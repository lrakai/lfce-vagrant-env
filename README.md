# lfce-vagrant-env

This repo brings up an Linux Foundation Certified Engineer (LFCE) Centos 7 exam simulation environment with the help of Vagrant. Several nodes are created and you perform various tasks on each during the exam. The environment has the following properties:

- Each node has all of the other nodes in its `/etc/hosts` file. 
- The starting node is `box`. 
    - You can `ssh` from box to any other node in the environment. 
    - Only the `box` node can `ssh` to other nodes in the environment. After completing a task, return to the `box` node before connecting to another node. 
- Root access can be obtain with `sudo -i` on any node.

## Exam Tasks

You can create tasks to complete based on the [LFCE domains and competencies](https://training.linuxfoundation.org/certification/linux-foundation-certified-engineer-lfce/#domains).

## Getting Started

Bring up the exam environment with

```sh
bash up_exam.sh
```

This automatically connects you to the `box` node in the exam environment. Prepare the systems as you prefer using packages from standard repos, for example:

```sh
sudo -i
yum install -y pssh
pssh -H box -H node1 -H node2 "yum install -y tmux bash-completion bash-completion-extras && mandb"
exec bash
```

## Tips

```sh
man -k ... # search for commands by name, description
man -wK ... # search for commands in man pages
yum provides */binary # search for package providing a binary
rpm -qf $(which binary) # which installed package provides a binary
```

## Cleaning Up

Destroy the exam environment with

```sh
bash destroy_exam.sh
```