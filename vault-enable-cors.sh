#!/bin/bash

set -e 

curlvault() {
  curl --header "X-Vault-Token: xDNq4P1jJYF9Gm60GekUh8TW" $@
}

curlvault http://127.0.0.1:8200/v1/sys/config/cors

tee payload.json <<EOF
{
  "enabled": true,
  "allowed_origins": "*",
  "allowed_headers": [
    "Content-Type",
    "X-Requested-With",
    "X-Vault-AWS-IAM-Server-ID",
    "X-Vault-No-Request-Forwarding",
    "X-Vault-Token",
    "Authorization",
    "X-Vault-Wrap-Format",
    "X-Vault-Wrap-TTL"
  ]
}
EOF

curlvault --request PUT --data @payload.json http://127.0.0.1:8200/v1/sys/config/cors
curlvault http://127.0.0.1:8200/v1/sys/config/cors