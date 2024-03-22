#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import time
import requests
import json
import base64
import argparse

SERVER = "https://x.y.com"
TOKEN = ''
BATCHID = ''
PACKAGEIDS = []
encodedcertificate = []


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

        while True:    # 循环去判断该get请求的status直到拿到Completed和Failed
            if status == "Completed":
                PACKAGEIDS = body.get('packagesIds')
                break
            elif status == "Pending" or status == "InProgress":
                print("Pending|Inprogress")
                body = requests.request(url=url, headers=headers, method='GET', timeout=60).json()
                status = body.get('status')
                time.sleep(3)
            else:    # Failed状态
                print(body)
                break
    else:
        print(f"请求失败:{url}, 状态码: {response.status_code}")

    print(f"PACKAGEIDS数量={len(PACKAGEIDS)}")



# 基于packageIds ,获取base64EncodedCertificate
def do_package_req(packageIds: list):
    print(f'开始创建{len(PACKAGEIDS)}个base64EncodedCertificate....')
    global encodedcertificate
    headers = {
        "Authorization": f'Bearer {TOKEN}'
    }
    for pg_id in packageIds:
        print(f"开始 append {pg_id}的 base64EncodedCertificate....")
        url = SERVER + f'/packages/api/v1/packages/{pg_id}'
        response = requests.request(url=url, headers=headers, method='GET')
        body = response.json()
        encodedcertificate.append(body.get('certificates')[0].get('base64EncodedCertificate'))

    print('len(PACKAGEIDS)=%d; len(encodedcertificate)=%d' % (len(PACKAGEIDS), len(encodedcertificate)))


# 基于base64EncodedCertificate,生成文件
def do_package_req_ex(encodedcertificate: list):
    for file_name, cert in zip(PACKAGEIDS, encodedcertificate):
        with open(f"D:\\pythonProject\\getfile\\binfile\\{file_name}.bin", "wb") as f:  ##下载文件存放在当前目录,可自行修改路径(需要确保路径存在)，win: C:\\Users\\vantron\\files\\{file_name}.bin, linux: /tmp/files/
            f.write(base64.b64decode(cert))
        print(f"saved file {file_name}.bin")


def main():
    files_nums = args.files_nums
    do_auth()
    do_batch_req(nums=files_nums)
    do_batch_status()
    if PACKAGEIDS:
        start_time = time.time()
        do_package_req(PACKAGEIDS)
        end_time = time.time()
        print(f"执行时间: {end_time - start_time}")
        do_package_req_ex(encodedcertificate)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="this python code used to get files")
    parser.add_argument("--files-nums", type=int, default=1,
                        help="This parameter determines, how many files are generated")
    args = parser.parse_args()
    main()