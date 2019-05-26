# lfce-vagrant-env

This repo brings up an Linux Foundation Certified Engineer (LFCE) Centos 7 exam simulation environment with the help of Vagrant. Several nodes are created and you perform various tasks on each during the exam. The starting node is `box`. You can `ssh` from box to any other node in the environment and all of the nodes are in its `/etc/hosts` file. Only the `box` node can `ssh` to other nodes in the environment. After completing a task, return to the `box` node before connecting to another node. Root access can be obtain with `sudo -i` on any node.

## Getting Started

Bring up the exam environment with

```sh
bash up_exam.sh
```

This automatically connects you to the common `box` node in the exam environment.
## Cleaning Up

Destroy the exam environment with

```sh
bash destroy_exam.sh
```