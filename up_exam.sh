#!/bin/bash

vagrant up

ssh-add -q ~/.vagrant.d/insecure_private_key
ssh -A -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -p 2221 vagrant@localhost