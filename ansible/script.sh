#!/bin/bash
# Gere o arquivo tf_outputs.json antes: terraform output -json > tf_outputs.json

GHA_IP=$(jq -r .gha_droplet_pip.value tf_outputs.json)
MONGO_IP=$(jq -r '.mongodb_droplet_pip.value' tf_outputs.json)
APP1_IP=$(jq -r '.apps_droplets_pips.value["0"]' tf_outputs.json)
APP2_IP=$(jq -r '.apps_droplets_pips.value["1"]' tf_outputs.json)

cat <<EOF > inventory.ini
[gha]
$GHA_IP

[mongodb]
$MONGO_IP

[apps]
$APP1_IP
$APP2_IP
EOF