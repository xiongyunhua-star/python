#!/usr/bin/env sh

set -e
set -o pipefail

set -x

#  {
#    "clientId": "xxxxxxx",
#    "secret": "x",
#    "resource": "https://x.y.com/packages"
#  }


PROD URL: https://x.y.com

{
    "clientId":"0xxxxxxxF",
    "secret":"xxxx",
    "resource":"https://x.y.com/packages"
}

#SERVER="https://nogenggsqaap.chamberlain.com"


do_auth()
{
    curl -s -S -v -H "Content-Type: application/json"  $SERVER/auth/token -X POST -d '{ "clientId":"xxxxxx", "secret":"xxxx", "resource":"https://x.y.com/packages" }'
}



#   root@VantronOS-EFA7:~# curl -s -S -v -H 'Content-Type: application/json' https://nogenggsqaap.chamberlain.com/auth/token -X POST -d '{ "clientId":"0FF944EB-7527-40ED-AB2A-680F9465013F", "secret":"lN5dnGT1rS110FwNx2R9", "resource":"https://
#   nogenggsqaap.chamberlain.com/packages" }'
#   > POST /auth/token HTTP/1.1
#   > Host: nogenggsqaap.chamberlain.com
#   > User-Agent: curl/7.71.0
#   > Accept: */*
#   > Content-Type: application/jsoneyJhbGciOiJSUzI1NiIsImtpZCI6IjBDQzRGRENBNEY0MUZBNkMwOUVCN0U3REQ1RTFBODU2QzBERUU0RjMiLCJ0eXAiOiJKV1QiLCJ4NXQiOiJET
VQ5eWs5Qi1td0o2MzU5MWVHb1ZzRGU1UE0ifQ.eyJpc3MiOiJodHRwczovL2lkZW50aXR5Lm15cWJ1c2luZXNzLmNvbSIsIm5iZiI6MTcwNTQ2ODM1MiwiaWF0IjoxNzA1NDY4MzUyLCJleHAiOj
E3MDU0NzE5NTIsImF1ZCI6WyJNeVFCIERldmljZXMgQ2VsbHVsYXIgTWFudWZhY3R1cmluZyBBUEkiLCJodHRwczovL2lkZW50aXR5Lm15cWJ1c2luZXNzLmNvbS9yZXNvdXJjZXMiXSwic2NvcG
UiOlsibXlxYjpkZXZpY2VzOmNlbGx1bGFyOm1hbnVmYWN0dXJpbmc6d3JpdGUiXSwiY2xpZW50X2lkIjoiNzgyRDg0NUIxNUYwNDQzNzhGMDkxNDQyOTAyNzk5RDgiLCJjbGllbnRfQXBwbGljYX
Rpb25JZCI6IkZCMzUxODlELTBCMjAtNDYwRS04MzUxLTE1MDIyRjFEQTI4MCIsImp0aSI6IkMxQ0ExREM1QjdDOTlFOUQ2MDFDOUUzNjFDRjlDRTQ2In0.DSb8YcZ0CW4JYRzX9FSU9mlFq3zo4_
zF_VOBegxOaA4VuqHTERYbXKYFuBNojgi6NzKDJuN4O1bEUR22IEi9bt6w95Pl9fjNvZNtTm4vExEptmqfVlUdLJwbjpN3Y8X94lTkRUxhCa7ZS7Zaxj6KzhDX_gy1dru_RZ7X7Rzj_u79M2FjwM
CHPdHxzLCLcWFNangatSK5iUkGAqFydcX8nz4ObGud_E9W2bq4e68Q_Gn_Y-VTvTOv4Jk4uu50q_qXvuRrEAK18bdZai8JgjEXspCA4ZSO-Io0Bhf4SZg6JdH1-XJ_LaGqRa3efwYCPU-W9W2MWqVnXG8KqAw6CXjTHA
#   > Content-Length: 146
#   >
#   < HTTP/1.1 200 OK
#   < Content-Type: application/json; charset=utf-8
#   < api-supported-versions: 1.0
#   < Strict-Transport-Security: max-age=31536000; includeSubDomains; preload
#   < Date: Thu, 07 Dec 2023 01:56:13 GMT
#   < Transfer-Encoding: chunked
#   <
#   {"tokenType":"Bearer","token":"eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjBmZjk0NGViLTc1MjctNDBlZC1hYjJhLTY4MGY5NDY1MDEzZiIsIm5hbWVpZCI6IjBmZjk0NGViLTc1MjctNDBlZC1hYjJhLTY4MGY5NDY1MDEzZiIsImp0aSI6ImY0NDgzZjIzLWJmNzUtNGZjMi04NDVhLTIxMmM0NzFhMGZjMCIsImlhdCI6MTcwMTkxNDE3Mywicm9sZSI6InVzZXIiLCJuYmYiOjE3MDE5MTQxNjMsImV4cCI6MTcwMTkxNzc3MywiaXNzIjoibm9nZW5nZ3NxYWFwLmNoYW1iZXJsYWluLmNvbSIsImF1ZCI6Imh0dHBzOi8vbm9nZW5nZ3NxYWFwLmNoYW1iZXJsYWluLmNvbS9wYWNrYWdlcyJ9.DHZly6hmJfdmBvXRTNLByC6Cxm-qjTAE0-zWCXoOLY4PpuvcNZ8ohUZzj6YHdNOjRTW7KrIDWesTCaEyla6YzF92s3nSikORnzB0zLTV5IsHXepx51MQzvFglgFMTQrGnO58uBtlhsLX_mJ9BoRxCJfns-XYbvhwsi3r7vb9zwAgXKwL4nPOnavjrwL78XYzQNp5qxoFX684ro8SVubmd1wmXJLX4AGWz4BV4g0mbNOKjDatcio6AMpP2r_0WqrV7wepNXn-Tlw9JEE0LTcCPRFRoqYxHz_ngB6dLxHtehiDKrZM505c7VxjAQvtvXqt-l1QV_W-1Fod2i9g3ydM-g","issuedDate":"2023-12-07T01:56:13.5724734Z","expirationDate":"2023-12-07T02:56:13.5724734Z","resource":"https://nogenggsqaap.chamberlain.com/packages"}root@VantronOS-EFA7:~#
#

#{"tokenType":"Bearer","token":"eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjBmZjk0NGViLTc1MjctNDBlZC1hYjJhLTY4MGY5NDY1MDEzZiIsIm5hbWVpZCI6IjBmZjk0NGViLTc1MjctNDBlZC1hYjJhLTY4MGY5NDY1MDEzZiIsImp0aSI6ImY0NDgzZjIzLWJmNzUtNGZjMi04NDVhLTIxMmM0NzFhMGZjMCIsImlhdCI6MTcwMTkxNDE3Mywicm9sZSI6InVzZXIiLCJuYmYiOjE3MDE5MTQxNjMsImV4cCI6MTcwMTkxNzc3MywiaXNzIjoibm9nZW5nZ3NxYWFwLmNoYW1iZXJsYWluLmNvbSIsImF1ZCI6Imh0dHBzOi8vbm9nZW5nZ3NxYWFwLmNoYW1iZXJsYWluLmNvbS9wYWNrYWdlcyJ9.DHZly6hmJfdmBvXRTNLByC6Cxm-qjTAE0-zWCXoOLY4PpuvcNZ8ohUZzj6YHdNOjRTW7KrIDWesTCaEyla6YzF92s3nSikORnzB0zLTV5IsHXepx51MQzvFglgFMTQrGnO58uBtlhsLX_mJ9BoRxCJfns-XYbvhwsi3r7vb9zwAgXKwL4nPOnavjrwL78XYzQNp5qxoFX684ro8SVubmd1wmXJLX4AGWz4BV4g0mbNOKjDatcio6AMpP2r_0WqrV7wepNXn-Tlw9JEE0LTcCPRFRoqYxHz_ngB6dLxHtehiDKrZM505c7VxjAQvtvXqt-l1QV_W-1Fod2i9g3ydM-g","issuedDate":"2023-12-07T01:56:13.5724734Z","expirationDate":"2023-12-07T02:56:13.5724734Z","resource":"https://nogenggsqaap.chamberlain.com/packages"}


#{
#  "tokenType": "Bearer",
#  "token": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjBmZjk0NGViLTc1MjctNDBlZC1hYjJhLTY4MGY5NDY1MDEzZiIsIm5hbWVpZCI6IjBmZjk0NGViLTc1MjctNDBlZC1hYjJhLTY4MGY5NDY1MDEzZiIsImp0aSI6ImY0NDgzZjIzLWJmNzUtNGZjMi04NDVhLTIxMmM0NzFhMGZjMCIsImlhdCI6MTcwMTkxNDE3Mywicm9sZSI6InVzZXIiLCJuYmYiOjE3MDE5MTQxNjMsImV4cCI6MTcwMTkxNzc3MywiaXNzIjoibm9nZW5nZ3NxYWFwLmNoYW1iZXJsYWluLmNvbSIsImF1ZCI6Imh0dHBzOi8vbm9nZW5nZ3NxYWFwLmNoYW1iZXJsYWluLmNvbS9wYWNrYWdlcyJ9.DHZly6hmJfdmBvXRTNLByC6Cxm-qjTAE0-zWCXoOLY4PpuvcNZ8ohUZzj6YHdNOjRTW7KrIDWesTCaEyla6YzF92s3nSikORnzB0zLTV5IsHXepx51MQzvFglgFMTQrGnO58uBtlhsLX_mJ9BoRxCJfns-XYbvhwsi3r7vb9zwAgXKwL4nPOnavjrwL78XYzQNp5qxoFX684ro8SVubmd1wmXJLX4AGWz4BV4g0mbNOKjDatcio6AMpP2r_0WqrV7wepNXn-Tlw9JEE0LTcCPRFRoqYxHz_ngB6dLxHtehiDKrZM505c7VxjAQvtvXqt-l1QV_W-1Fod2i9g3ydM-g",
#  "issuedDate": "2023-12-07T01:56:13.5724734Z",
#  "expirationDate": "2023-12-07T02:56:13.5724734Z",
#  "resource": "https://nogenggsqaap.chamberlain.com/packages"
#}

#TOKEN="eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjBmZjk0NGViLTc1MjctNDBlZC1hYjJhLTY4MGY5NDY1MDEzZiIsIm5hbWVpZCI6IjBmZjk0NGViLTc1MjctNDBlZC1hYjJhLTY4MGY5NDY1MDEzZiIsImp0aSI6IjQ2NTdmMmU4LWU2YjctNDE1MS1iZWYzLTFiNWY0NTVmYjA2OSIsImlhdCI6MTcwMTkxNDg4Nywicm9sZSI6InVzZXIiLCJuYmYiOjE3MDE5MTQ4NzcsImV4cCI6MTcwMTkxODQ4NywiaXNzIjoibm9nZW5nZ3NxYWFwLmNoYW1iZXJsYWluLmNvbSIsImF1ZCI6Imh0dHBzOi8vbm9nZW5nZ3NxYWFwLmNoYW1iZXJsYWluLmNvbS9wYWNrYWdlcyJ9.oZfYFNyLqMH05L9j0Qctm46yZOBFWYVeFZw-W1RRP3sS8g0CegD-r-r7Lhav-ScESvKnxLL8nmrIa9geNecHoxr2n7FVxYDTBm4njWa-4t4VvBd8xcWemYnOpoQn1lzGgo9OOkOB5wrmbskgWSkGRSJNikY4RASTxw3MtshEEn-sN87RK4Zbe8ukGzLYojnVkiCfb-ii2PK0JKqsIlQ5wYT50zlb98aDKwituMZr0rsVXWHLwJesHbHq4X2TJsbWeAIDICAn-f6X1t4lOjY-T_4-nLozJPbK7RQH7q6gcqIHUFGvJrTkmnGTXvIP-jMJwqOUJ8-k6Nc10mu_J2Tebw"

#{"tokenType":"Bearer","token":"eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjBmZjk0NGViLTc1MjctNDBlZC1hYjJhLTY4MGY5NDY1MDEzZiIsIm5hbWVpZCI6IjBmZjk0NGViLTc1MjctNDBlZC1hYjJhLTY4MGY5NDY1MDEzZiIsImp0aSI6ImUxYjhhYTFhLTU1NzYtNDFkZC04ZmIyLWZmNDU0ZGMxZjIzYiIsImlhdCI6MTcwMjAxNjcyMSwicm9sZSI6InVzZXIiLCJuYmYiOjE3MDIwMTY3MTEsImV4cCI6MTcwMjAyMDMyMSwiaXNzIjoibm9nZW5nZ3NxYWFwLmNoYW1iZXJsYWluLmNvbSIsImF1ZCI6Imh0dHBzOi8vbm9nZW5nZ3NxYWFwLmNoYW1iZXJsYWluLmNvbS9wYWNrYWdlcyJ9.Oh_NMdO3Jg26yovGAV-yBT-feK4OJRA3Tv6z4DeWbGY5OBTl4BC7pjBBi-SHT0CE0B-oic4y1LrCOM0qwp3fLZTW7BZftrn2YYyL_gm-K4JSO8jXhhM71n8wnFvPPf1b0hKlSJB_SdEQ_MxFP550XmaHxtan0yearLKt2Zl4VI_0cbFak7klNusKsFMOjNbYJ60fITEVl4KeXcPk2UYenrCfDeFrGGoNfwurAPyin7r8eZES2E8FRTfyItaD2mPJ7BiYhlWlW3wfDl5iOGFoxxtPKoXwK-B-rKADTtiGTavhUA1ouI3NJJnRN9CcPU0VOLLhyplkjf7r3DCZybHKzA","issuedDate":"2023-12-08T06:25:21.2564073Z","expirationDate":"2023-12-08T07:25:21.2564073Z","resource":"https://nogenggsqaap.chamberlain.com/packages"}root@VantronOS-EFA7:/tmp#
TOKEN="eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjBmZjk0NGViLTc1MjctNDBlZC1hYjJhLTY4MGY5NDY1MDEzZiIsIm5hbWVpZCI6IjBmZjk0NGViLTc1MjctNDBlZC1hYjJhLTY4MGY5NDY1MDEzZiIsImp0aSI6ImUxYjhhYTFhLTU1NzYtNDFkZC04ZmIyLWZmNDU0ZGMxZjIzYiIsImlhdCI6MTcwMjAxNjcyMSwicm9sZSI6InVzZXIiLCJuYmYiOjE3MDIwMTY3MTEsImV4cCI6MTcwMjAyMDMyMSwiaXNzIjoibm9nZW5nZ3NxYWFwLmNoYW1iZXJsYWluLmNvbSIsImF1ZCI6Imh0dHBzOi8vbm9nZW5nZ3NxYWFwLmNoYW1iZXJsYWluLmNvbS9wYWNrYWdlcyJ9.Oh_NMdO3Jg26yovGAV-yBT-feK4OJRA3Tv6z4DeWbGY5OBTl4BC7pjBBi-SHT0CE0B-oic4y1LrCOM0qwp3fLZTW7BZftrn2YYyL_gm-K4JSO8jXhhM71n8wnFvPPf1b0hKlSJB_SdEQ_MxFP550XmaHxtan0yearLKt2Zl4VI_0cbFak7klNusKsFMOjNbYJ60fITEVl4KeXcPk2UYenrCfDeFrGGoNfwurAPyin7r8eZES2E8FRTfyItaD2mPJ7BiYhlWlW3wfDl5iOGFoxxtPKoXwK-B-rKADTtiGTavhUA1ouI3NJJnRN9CcPU0VOLLhyplkjf7r3DCZybHKzA"



do_batch_req()
{
     curl -s -S -v \
         -H "Content-Type: application/json" \
         -H "Authorization: Bearer $TOKEN" \
         $SERVER/packages/api/v1/batch -X POST -d '{ "seedingSpecification":"190AVANTRON", "quantity":10}'
}

# root@VantronOS-EFA7:~# curl -s -S -v -H 'Content-Type: application/json' https://nogenggsqaap.chamberlain.com/auth/token -X POST -d '{ "clientId":"0FF944EB-7527-40ED-AB2A-680F9465013F", "secret":"lN5dnGT1rS110FwNx2R9", "resource":"https://
# nogenggsqaap.chamberlain.com/packages" }'
# > POST /auth/token HTTP/1.1
# > Host: nogenggsqaap.chamberlain.com
# > User-Agent: curl/7.71.0
# > Accept: */*
# > Content-Type: application/json
# > Content-Length: 146
# >
# < HTTP/1.1 200 OK
# < Content-Type: application/json; charset=utf-8
# < api-supported-versions: 1.0
# < Strict-Transport-Security: max-age=31536000; includeSubDomains; preload
# < Date: Thu, 07 Dec 2023 02:08:07 GMT
# < Transfer-Encoding: chunked
# <
# {"tokenType":"Bearer","token":"eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjBmZjk0NGViLTc1MjctNDBlZC1hYjJhLTY4MGY5NDY1MDEzZiIsIm5hbWVpZCI6IjBmZjk0NGViLTc1MjctNDBlZC1hYjJhLTY4MGY5NDY1MDEzZiIsImp0aSI6IjQ2NTdmMmU4LWU2YjctNDE1MS1iZWYzLTFiNWY0NTVmYjA2OSIsImlhdCI6MTcwMTkxNDg4Nywicm9sZSI6InVzZXIiLCJuYmYiOjE3MDE5MTQ4NzcsImV4cCI6MTcwMTkxODQ4NywiaXNzIjoibm9nZW5nZ3NxYWFwLmNoYW1iZXJsYWluLmNvbSIsImF1ZCI6Imh0dHBzOi8vbm9nZW5nZ3NxYWFwLmNoYW1iZXJsYWluLmNvbS9wYWNrYWdlcyJ9.oZfYFNyLqMH05L9j0Qctm46yZOBFWYVeFZw-W1RRP3sS8g0CegD-r-r7Lhav-ScESvKnxLL8nmrIa9geNecHoxr2n7FVxYDTBm4njWa-4t4VvBd8xcWemYnOpoQn1lzGgo9OOkOB5wrmbskgWSkGRSJNikY4RASTxw3MtshEEn-sN87RK4Zbe8ukGzLYojnVkiCfb-ii2PK0JKqsIlQ5wYT50zlb98aDKwituMZr0rsVXWHLwJesHbHq4X2TJsbWeAIDICAn-f6X1t4lOjY-T_4-nLozJPbK7RQH7q6gcqIHUFGvJrTkmnGTXvIP-jMJwqOUJ8-k6Nc10mu_J2Tebw","issuedDate":"2023-12-07T02:08:07.2312694Z","expirationDate":"2023-12-07T03:08:07.2312694Z","resource":"https://nogenggsqaap.chamberlain.com/packages"}root@VantronOS-EFA7:~#

# < HTTP/1.1 201 Created
# < Content-Type: application/json; charset=utf-8
# < Location: https://nogenggsqaap.chamberlain.com/api/v1.0/1b9baac7-a694-ee11-b594-00505699264b
# < api-supported-versions: 1.0
# < Strict-Transport-Security: max-age=31536000; includeSubDomains; preload
# < Date: Thu, 07 Dec 2023 02:17:34 GMT
# < Transfer-Encoding: chunked
# <
# {"batchId":"1b9baac7-a694-ee11-b594-00505699264b","seedingSpecification":"190AVANTRON","quantity":10,"processingStartedOn":null,"processingCompletedOn":null,"expiresOn":null,"requestedOn":"2023-12-07T02:17:34.0333333","status":"Pending"}root@VantronOS-EFA7:/tmp#


#  {
#    "batchId": "1b9baac7-a694-ee11-b594-00505699264b",
#    "seedingSpecification": "190AVANTRON",
#    "quantity": 10,
#    "processingStartedOn": null,
#    "processingCompletedOn": null,
#    "expiresOn": null,
#    "requestedOn": "2023-12-07T02:17:34.0333333",
#    "status": "Pending"
#  }

#{"batchId":"f7669fae-9295-ee11-b594-00505699264b","seedingSpecification":"190AVANTRON","quantity":10,"processingStartedOn":null,"processingCompletedOn":null,"expiresOn":null,"requestedOn":"2023-12-08T06:26:13.2433333","status":"Pending"}root@VantronOS-EFA7:/tmp#


BATCHID="f7669fae-9295-ee11-b594-00505699264b"

do_batch_status()
{
     curl -s -S -v \
         -H "Content-Type: application/json" \
         -H "Authorization: Bearer $TOKEN" \
         "$SERVER/packages/api/v1/batch/$BATCHID?omitIds=false"
}



#{"batchId":"f7669fae-9295-ee11-b594-00505699264b","seedingSpecification":"190AVANTRON","quantity":10,"processingStartedOn":"2023-12-08T06:26:13.3568666","processingCompletedOn":"2023-12-08T06:26:15.5967758","expiresOn":"2023-12-15T06:26:15.5967758","requestedOn":"2023-12-08T06:26:13.2433333","status":"Completed","statusMessage":"Batch operation completed successfully.","packagesIds":["60b3a5a1-9188-ee11-af9d-f8a21608ae00","61b3a5a1-9188-ee11-af9d-f8a21608ae00","62b3a5a1-9188-ee11-af9d-f8a21608ae00","63b3a5a1-9188-ee11-af9d-f8a21608ae00","64b3a5a1-9188-ee11-af9d-f8a21608ae00","65b3a5a1-9188-ee11-af9d-f8a21608ae00","66b3a5a1-9188-ee11-af9d-f8a21608ae00","77b3a5a1-9188-ee11-af9d-f8a21608ae00","78b3a5a1-9188-ee11-af9d-f8a21608ae00","79b3a5a1-9188-ee11-af9d-f8a21608ae00"]}root@VantronOS-EFA7:/tmp#


# $ cat tmp.txt  | jq
# {
#   "batchId": "f7669fae-9295-ee11-b594-00505699264b",
#   "seedingSpecification": "190AVANTRON",
#   "quantity": 10,
#   "processingStartedOn": "2023-12-08T06:26:13.3568666",
#   "processingCompletedOn": "2023-12-08T06:26:15.5967758",
#   "expiresOn": "2023-12-15T06:26:15.5967758",
#   "requestedOn": "2023-12-08T06:26:13.2433333",
#   "status": "Completed",
#   "statusMessage": "Batch operation completed successfully.",
#   "packagesIds": [
#     "60b3a5a1-9188-ee11-af9d-f8a21608ae00",
#     "61b3a5a1-9188-ee11-af9d-f8a21608ae00",
#     "62b3a5a1-9188-ee11-af9d-f8a21608ae00",
#     "63b3a5a1-9188-ee11-af9d-f8a21608ae00",
#     "64b3a5a1-9188-ee11-af9d-f8a21608ae00",
#     "65b3a5a1-9188-ee11-af9d-f8a21608ae00",
#     "66b3a5a1-9188-ee11-af9d-f8a21608ae00",
#     "77b3a5a1-9188-ee11-af9d-f8a21608ae00",
#     "78b3a5a1-9188-ee11-af9d-f8a21608ae00",
#     "79b3a5a1-9188-ee11-af9d-f8a21608ae00"
#   ]
# }


do_package_req()
{
     curl -s -S -v \
         -H "Authorization: Bearer $TOKEN" \
         "$SERVER/packages/api/v1/packages/60b3a5a1-9188-ee11-af9d-f8a21608ae00"
}


#{"packageId":"60b3a5a1-9188-ee11-af9d-f8a21608ae00","packageVersion":"2.0","seedingSpecification":"190AVANTRON","seeds":[{"alias":"port1-mac","prefix":"0x000000","type":"MAC","value":{"dec":2944807,"hex":"0x0000002CEF27"}},{"alias":"port2-mac","prefix":"0x000000","type":"MAC","value":{"dec":2944808,"hex":"0x0000002CEF28"}},{"alias":"port3-mac","prefix":"0x000000","type":"MAC","value":{"dec":2944809,"hex":"0x0000002CEF29"}},{"alias":"port4-mac","prefix":"0x000000","type":"MAC","value":{"dec":2944810,"hex":"0x0000002CEF2A"}}],"certificates":[{"alias":"myq_certs","prefix":"12","uniqueIdentifier":"12001730EB","type":"MyQ","base64EncodedCertificate":"AQAAABA4A2mh/ADKAQAABAAAAAAAAAAAAAAAAAAAAAAAAABgAAAAigAADrcAABASQ29weXJpZ2h0IFRoZSBDaGFtYmVybGFpbiBHcm91cCwgTExDLiAyMDIzICAgICAguSP5Sbkj+UkAAAAKAAAAAQAAAAAAAAAAAAAAAAAAAAAxMjAwMTczMEVCDNlOsQzZTrEAAA4NAAAAAgAAAAAAAAAAAAAAAAAAAAAtLS0tLUJFR0lOIENFUlRJRklDQVRFLS0tLS0KTUlJQ1hqQ0NBZ1dnQXdJQkFnSVVXRENDOGcyM0JqZzY3U1d5OEhnZjRKK1ZZMXN3Q2dZSUtvWkl6ajBFQXdJdwpnWVl4Q3pBSkJnTlZCQVlUQWxWVE1SRXdEd1lEVlFRSURBaEpiR3hwYm05cGN6RVNNQkFHQTFVRUJ3d0pUMkZyCklFSnliMjlyTVJvd0dBWURWUVFLREJGRGFHRnRZbVZ5YkdGcGJpQkhjbTkxY0RFTU1Bb0dBMVVFQ3d3RFRYbFIKTVNZd0pBWURWUVFEREIxT1QwNHRVRkpQUkNCRVpYWnBZMlZ6SUZKdllXUkliM1Z6WlNCRFFUQWdGdzB5TXpFdwpNakV3TVRJNU16SmFHQTh5TVRJek1Ea3lOekF4TWprek1sb3dGVEVUTUJFR0ExVUVBd3dLTVRJd01ERTNNekJGClFqQlpNQk1HQnlxR1NNNDlBZ0VHQ0NxR1NNNDlBd0VIQTBJQUJCQTkzUFpQUEN1a1FnUSs2SmJIZExXSzZCd3IKaEFzVmRSVW1DZlhKcjJycDBmM0psODFGQzJRSWg1c0duZlZMSVloUzJUc21iMHlVZjJKTnFET2Jtd3lqZ2I0dwpnYnN3REFZRFZSMFRBUUgvQkFJd0FEQU9CZ05WSFE4QkFmOEVCQU1DQlBBd0V3WURWUjBsQkF3d0NnWUlLd1lCCkJRVUhBd0l3SFFZRFZSME9CQllFRklPbzViZ2hxWVkzVnFCSTM4dkh0MHFCbVlMQU1COEdBMVVkSXdRWU1CYUEKRkh1TWJablo1QXprSGtWOFl2MHRuTWh5ZzE0Nk1FWUdBMVVkSHdRL01EMHdPNkE1b0RlR05XaDBkSEE2THk5agpjbXd1YlhseFpHVjJhV05sY3k1amIyMHZZM0pzWkM5TmVWRWxNakJFWlhacFkyVnpKVEl3UTBFdVkzSnNNQW9HCkNDcUdTTTQ5QkFNQ0EwY0FNRVFDSUQyVGQxRVNCNXR2QnpVNmVSUjBRMmFWRWlCeExNeUhaWUpoMGJoSTVDSXQKQWlCRm14akFmK2J2eEhXa2FVaTV4Q21ua09aR0JaUDNSNW5mUzAzUlhhYVhmdz09Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0KLS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tDQpNSUlDWURDQ0FnV2dBd0lCQWdJVUdueTBBbXpVY2dBNTVnRXZ6Qjk3b2RsMEd5RXdDZ1lJS29aSXpqMEVBd0l3DQpnWU14Q3pBSkJnTlZCQVlUQWxWVE1SRXdEd1lEVlFRSURBaEpiR3hwYm05cGN6RVNNQkFHQTFVRUJ3d0pUMkZyDQpJRUp5YjI5ck1Sb3dHQVlEVlFRS0RCRkRhR0Z0WW1WeWJHRnBiaUJIY205MWNERU1NQW9HQTFVRUN3d0RUWGxSDQpNU013SVFZRFZRUUREQnBPVDA0dFVGSlBSQ0JTYjI5MElGSnZZV1JJYjNWelpTQkRRVEFnRncweU1qRXlNakF4DQpOVFEyTURWYUdBOHlNVEl5TVRFeU5qRTFORFl3TlZvd2dZTXhDekFKQmdOVkJBWVRBbFZUTVJFd0R3WURWUVFJDQpEQWhKYkd4cGJtOXBjekVTTUJBR0ExVUVCd3dKVDJGcklFSnliMjlyTVJvd0dBWURWUVFLREJGRGFHRnRZbVZ5DQpiR0ZwYmlCSGNtOTFjREVNTUFvR0ExVUVDd3dEVFhsUk1TTXdJUVlEVlFRRERCcE9UMDR0VUZKUFJDQlNiMjkwDQpJRkp2WVdSSWIzVnpaU0JEUVRCWk1CTUdCeXFHU000OUFnRUdDQ3FHU000OUF3RUhBMElBQkRUSXNmYlVYV2ZqDQpJRW9EMFpjWU9oSDNlV3kxS3pHY3BNMU40enVzMjhQMGpaaFFjMXppYUlpTUprUGU1OXZOOGNHVVorSml0SFBDDQovR2cyazBLZG5YbWpVekJSTUIwR0ExVWREZ1FXQkJUN2NxU1liUEEyNHpHQ2VhdDBMNGVnRlUzWFpEQWZCZ05WDQpIU01FR0RBV2dCVDdjcVNZYlBBMjR6R0NlYXQwTDRlZ0ZVM1haREFQQmdOVkhSTUJBZjhFQlRBREFRSC9NQW9HDQpDQ3FHU000OUJBTUNBMGtBTUVZQ0lRRFBjb2I3dHE4dnpJTjBnL0pVNXZKWDAxaFVYak5tNTVEdThGQU1hQ2oxDQpyZ0loQUxvNElkTTExYjVZRDUrcFlTS0FRVHFKR3FvaDJFcjA4UW5hMk94Z1NMOUoNCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0KLS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tDQpNSUlDWnpDQ0FnMmdBd0lCQWdJVU5KdGJqSXovUmlrYTQ4TXR6bFVNdCtpUjRnVXdDZ1lJS29aSXpqMEVBd0l3DQpnWU14Q3pBSkJnTlZCQVlUQWxWVE1SRXdEd1lEVlFRSURBaEpiR3hwYm05cGN6RVNNQkFHQTFVRUJ3d0pUMkZyDQpJRUp5YjI5ck1Sb3dHQVlEVlFRS0RCRkRhR0Z0WW1WeWJHRnBiaUJIY205MWNERU1NQW9HQTFVRUN3d0RUWGxSDQpNU013SVFZRFZRUUREQnBPVDA0dFVGSlBSQ0JTYjI5MElGSnZZV1JJYjNWelpTQkRRVEFnRncweU1qRXlNakF4DQpOVFEyTVRSYUdBOHlNVEl5TVRFeU5qRTFORFl4TkZvd2dZc3hDekFKQmdOVkJBWVRBbFZUTVJFd0R3WURWUVFJDQpEQWhKYkd4cGJtOXBjekVTTUJBR0ExVUVCd3dKVDJGcklFSnliMjlyTVJvd0dBWURWUVFLREJGRGFHRnRZbVZ5DQpiR0ZwYmlCSGNtOTFjREVNTUFvR0ExVUVDd3dEVFhsUk1Tc3dLUVlEVlFRRERDSk9UMDR0VUZKUFJDQkpiblJsDQpjbTFsWkdsaGNua2dVbTloWkVodmRYTmxJRU5CTUZrd0V3WUhLb1pJemowQ0FRWUlLb1pJemowREFRY0RRZ0FFDQp4cWJmdTVjVThTMktySk53ZkIvZ1JicGtGL1RGaXhoRFVQRlR6QzA1ZlpoakYycFBLQ1oyY0x2aFJZamhicGw2DQpSdXhJSnBQZDZpSVIycFNUVC8wa1dhTlRNRkV3SFFZRFZSME9CQllFRklBcDYrWTBwYU9wcFJSWHZTc216LzdYDQo4NkZBTUI4R0ExVWRJd1FZTUJhQUZQdHlwSmhzOERiak1ZSjVxM1F2aDZBVlRkZGtNQThHQTFVZEV3RUIvd1FGDQpNQU1CQWY4d0NnWUlLb1pJemowRUF3SURTQUF3UlFJZ0RBd3cwbGVLUFZNZGRiaDhNTys1Ti9HbVhvRExNdEtZDQpPT0V1K3dBRHRJRUNJUUNrR1pONVAwQVgzeWZMbEgrOWhqRENjbFRwSGdIMFd6VDZ3Qm1iY3BWell3PT0NCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0KLS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tDQpNSUlDYVRDQ0FoQ2dBd0lCQWdJVVc5bzNpLzN2NzFtdytCUWF6ZWx3MTBLK1lxa3dDZ1lJS29aSXpqMEVBd0l3DQpnWXN4Q3pBSkJnTlZCQVlUQWxWVE1SRXdEd1lEVlFRSURBaEpiR3hwYm05cGN6RVNNQkFHQTFVRUJ3d0pUMkZyDQpJRUp5YjI5ck1Sb3dHQVlEVlFRS0RCRkRhR0Z0WW1WeWJHRnBiaUJIY205MWNERU1NQW9HQTFVRUN3d0RUWGxSDQpNU3N3S1FZRFZRUUREQ0pPVDA0dFVGSlBSQ0JKYm5SbGNtMWxaR2xoY25rZ1VtOWhaRWh2ZFhObElFTkJNQ0FYDQpEVEl5TVRJeU1ERTFORFl4T1ZvWUR6SXhNakl4TVRJMk1UVTBOakU1V2pDQmhqRUxNQWtHQTFVRUJoTUNWVk14DQpFVEFQQmdOVkJBZ01DRWxzYkdsdWIybHpNUkl3RUFZRFZRUUhEQWxQWVdzZ1FuSnZiMnN4R2pBWUJnTlZCQW9NDQpFVU5vWVcxaVpYSnNZV2x1SUVkeWIzVndNUXd3Q2dZRFZRUUxEQU5OZVZFeEpqQWtCZ05WQkFNTUhVNVBUaTFRDQpVazlFSUVSbGRtbGpaWE1nVW05aFpFaHZkWE5sSUVOQk1Ga3dFd1lIS29aSXpqMENBUVlJS29aSXpqMERBUWNEDQpRZ0FFYklERnVlZHZUY3F6QnFudjQvVllUOGRQSnpVMUJWV0QzRzMyTFdBTGpuNVR5ZjRDZjV2RU9vNEl0cC9HDQpMRjE2YTYyVW9QZ1o4L0sxblBHMFI5ZVMvNk5UTUZFd0hRWURWUjBPQkJZRUZIdU1iWm5aNUF6a0hrVjhZdjB0DQpuTWh5ZzE0Nk1COEdBMVVkSXdRWU1CYUFGSUFwNitZMHBhT3BwUlJYdlNzbXovN1g4NkZBTUE4R0ExVWRFd0VCDQovd1FGTUFNQkFmOHdDZ1lJS29aSXpqMEVBd0lEUndBd1JBSWdGZ2xqajBMUHJtYnNxWGhqTmF0dW52M205cFJSDQpMQlQzd05wRlJjaDVPK0FDSUNkRGlRL3Y1VGRWWkpqNjh1MjY3RWpNWDhJQVhUV2tVRzczZCs4UkNPM3oNCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS1r3zHya98x8gAAATsAAAADAAAAAAAAAAAAAAAAAAAAAC0tLS0tQkVHSU4gRUMgUFJJVkFURSBLRVktLS0tLQpQcm9jLVR5cGU6IDQsRU5DUllQVEVECkRFSy1JbmZvOiBBRVMtMjU2LUNCQywyNTYxRTZERjE5QjYwNEQwMUVDM0RFQzk5MUI3M0Q0MwoKUGwyK1JyUHA5Z1hEeWlQQ1JKL2ZDUHRSY3ZISlRqK2VrVW5xUnJtVUFPblBFa1ZONm1UNjVZNkV3dU9uZVVGcQo3dHpTUUF1WU9SaEVNclFlQlNuOFlCdTEvblZ5R1d3NXU1MjZzRkNUdllMYXloeE81Z3BhMlNVWWlqSUpwdHBRClBaWlJTM1VGemVmdlhmaXk1dk5vWkR6bE95SnVOVzlNbWhtOENmbDNGZFU9Ci0tLS0tRU5EIEVDIFBSSVZBVEUgS0VZLS0tLS0NCmQKZWBkCmVgAAAAEAAAAAQAAAAAAAAAAAAAAAAAAAAAM0U4NmxsTWJNODhZTGt3RQ=="}],"packageSha256Thumbprint":"fl3TvllTkOkYZB3lU9iz0JmVZc18Wgm70zJmCHA/n7A=","signature":"HEuJmiJdF1EjmbitHFnaBH/qPlnaWOm+l+AW27fHQ+48LOQfGDOViSWpyPaqAx5w1EMh0dCZpseuoQoLBlpa6n2tFZReDKQUWQOAsSzVKmirC5IGwC1wvsYHS+yZu5pdRR9V3czJHu6tocyldpVK6elUFfzTmTucDfJgTgl7QA5cRJtaaqX6+amV1Y/JYtDQ1qjc0NqJwwhkgSbjiqJEZCsakl3phzf8aPnR7F1VX7SLrxwNyGx2Rk0n4IIV32BB+wGIdh3tcJdOSITCuSLEid8Si3fhFrwcyARcWK9WmyH97JnQs2NsbHcLS8flluHcjR8Mo+6YM03wdDeaBK03VA=="}

do_package_req_ex()
{
    #cat tmp.txt  | jq -e -r ".certificates[0].base64EncodedCertificate" | base64 -d >tmp.bin

    curl -s -S \
         -H "Authorization: Bearer $TOKEN" \
         "$SERVER/packages/api/v1/packages/60b3a5a1-9188-ee11-af9d-f8a21608ae00" | jq -e -r ".certificates[0].base64EncodedCertificate" | base64 -d >tmp.bin
}

do_$1
