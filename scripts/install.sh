#!/bin/bash
set -x

openssl aes-256-cbc -K $encrypted_0d83e5d68220_key -iv $encrypted_0d83e5d68220_iv -in deploy_rsa.enc -out deploy_rsa -d
eval "$(ssh-agent -s)"
chmod 600 deploy_rsa
ssh-add /deploy_rsa
echo $PWD
