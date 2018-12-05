#!/usr/bin/env bash

apt-get update -y
apt-get install unzip socat jq dnsutils -y 

# Install consul
pushd /usr/local/bin/
wget https://releases.hashicorp.com/consul/1.4.0/consul_1.4.0_linux_amd64.zip
unzip consul_1.4.0_linux_amd64.zip
rm -fr consul_1.4.0_linux_amd64.zip
popd



