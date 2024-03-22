#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import time
from multiprocessing.managers import ListProxy
import requests
import json
import base64
import argparse
import multiprocessing
import os

SERVER = "https://x.y.com"
TOKEN = ''
BATCHID = ''
PACKAGEIDS = []
encodedcertificate = []
shared_pkg_ids = None
shared_encodedcertificate = None
shared_token = None
cpu = os.cpu_count()


# 获取token
def do_auth():
    headers = {
        "Content-Type": "application/json"
    }
    datas = {
        "clientId": "0xxx13F",
        "secret": "xxxx",
        "resource": "https://x.y.com/packages"
    }
    data_json = json.dumps(datas)
    url = SERVER + '/auth/token'
    response = requests.request(url=url, headers=headers, method='POST', data=data_json)
    print(type(response), response.json(), type(response.json()))
    global TOKEN
    if response.status_code == 200:
        body = response.json()
        TOKEN = body.get('token')
    else:
        print(f"请求失败:{url}, 状态码: {response.status_code}")


# 创建一个批请求, 返回一个batchId
def do_batch_req(nums=1):
    url = SERVER + '/packages/api/v1/batch'
    headers = {
        "Content-Type": "application/json",
        "Authorization": f"Bearer {TOKEN}"
    }
    print(headers)
    data_json = json.dumps(
        {
            "seedingSpecification": "190-3000",
            "quantity": nums
        }
    )
    response = requests.request(url=url, method='POST', headers=headers, data=data_json)

    global BATCHID
    if 200 <= response.status_code <= 299:
        body = response.json()
        BATCHID = body.get('batchId')
        print(f"BATCHID={BATCHID}")
    else:
        print(f"请求失败:{url}, 状态码: {response.status_code}")


# 基于batchId,获取packagesIds
def do_batch_status():
    url = SERVER + f'/packages/api/v1/batch/{BATCHID}?omitIds=false'
    print(url)
    headers = {
        "Content-Type": "application/json",
        "Authorization": f"Bearer {TOKEN}"
    }
    print(headers)
    response = requests.request(url=url, headers=headers, method='GET', timeout=60)
    body = response.json()
    status = body.get('status')
    global PACKAGEIDS
    if 200 <= response.status_code <= 299:
        while True:  # 循环去判断该get请求的status直到拿到Completed和Failed
            if status == "Completed":
                PACKAGEIDS = body.get('packagesIds')
                break
            elif status == "Pending" or status == "InProgress":
                print("Pending|Inprogress")
                time.sleep(3)
                body = requests.request(url=url, headers=headers, method='GET', timeout=60).json()
                status = body.get('status')
            else:  # Failed状态
                print(body)
                break
    else:
        print(f"请求失败:{url}, 状态码: {response.status_code}")
    print(f"PACKAGEIDS数量={len(PACKAGEIDS)}")


def list_to_manager_list(inlist: list) -> ListProxy:
    return multiprocessing.Manager().list(inlist)


# 基于shared_pkg_ids ,获取base64EncodedCertificate
# 多进程方式消费shared_pkg_ids, 并且将各进程产生的base64EncodedCertificate append到 shared_encodedcertificate
def do_package_req(shared_pkg_ids: ListProxy, shared_encodedcertificate: ListProxy, shared_token: str):
    print(f'开始创建{len(shared_pkg_ids)}个base64EncodedCertificate....')
    headers = {
        "Authorization": f'Bearer {shared_token}'
    }
    while True:
        if not shared_pkg_ids:
            break
        pg_id = shared_pkg_ids.pop()
        print(f"开始 append {pg_id}的 base64EncodedCertificate....")
        url = SERVER + f'/packages/api/v1/packages/{pg_id}'
        # print(f"{url}")
        response = requests.request(url=url, headers=headers, method='GET', timeout=60)

        if 200 <= response.status_code <= 299:
            body = response.json()
            shared_encodedcertificate.append(body.get('certificates')[0].get('base64EncodedCertificate'))
        else:
            print(f"{response.status_code}:{url}")
            print(f"headers = {headers}")


# 基于base64EncodedCertificate,生成文件
def do_package_req_ex(shared_pkg_ids, shared_encodedcertificate):
    print(
        f"len(shared_pkg_ids) = {len(shared_pkg_ids)}, len(shared_encodedcertificate) = {len(shared_encodedcertificate)}")
    if len(shared_pkg_ids) != len(shared_encodedcertificate):
        print("长度不一样....")
        return
    for file_name, cert in zip(shared_pkg_ids, shared_encodedcertificate):
        with open(f"D:\\pythonProject\\getfile\\binfile\\{file_name}.bin",
                  "wb") as f:  ##下载文件存放在当前目录,可自行修改路径(需要确保路径存在)，win: C:\\Users\\vantron\\files\\{file_name}.bin, linux: /tmp/files/
            f.write(base64.b64decode(cert))
        print(f"saved file {file_name}.bin")


def main():
    files_nums = args.files_nums
    do_auth()
    global shared_token
    shared_token = list_to_manager_list([TOKEN])  # 将token传入到各个子进程
    do_batch_req(nums=files_nums)
    do_batch_status()
    global shared_pkg_ids
    global shared_encodedcertificate
    f = lambda: 5 if len(PACKAGEIDS) <= 100 else cpu
    threads = f()  #配置线程数量
    if PACKAGEIDS:
        shared_pkg_ids = list_to_manager_list(PACKAGEIDS)  # 默认非空
        shared_encodedcertificate = list_to_manager_list([])  # 默认空
        process_list = []
        start_time = time.time()
        for i in range(threads):
            p = multiprocessing.Process(target=do_package_req,
                                        args=(shared_pkg_ids, shared_encodedcertificate, shared_token[0]))
            process_list.append(p)
            p.start()
        for p in process_list:
            p.join()
        end_time = time.time()
        print(f"执行时间: {end_time - start_time}")
        shared_pkg_ids = list_to_manager_list(PACKAGEIDS)  # 默认非空
        print(
            f"In main() len(shared_pkg_ids) = {len(shared_pkg_ids)}, len(shared_encodedcertification)={len(shared_encodedcertificate)}")
        do_package_req_ex(shared_pkg_ids, shared_encodedcertificate)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="this python code used to get files")
    parser.add_argument("--files-nums", type=int, default=1,
                        help="This parameter determines, how many files are generated")
    args = parser.parse_args()
    main()
