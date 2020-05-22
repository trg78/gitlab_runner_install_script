#!/bin/bash
apt update
apt upgrade -y
apt-get install -y debian-archive-keyring curl gnupg apt-transport-https
curl -L https://packages.gitlab.com/runner/gitlab-runner/gpgkey | sudo apt-key add -
touch /etc/apt/sources.list.d/runner_gitlab-runner.list
echo deb https://packages.gitlab.com/runner/gitlab-runner/ubuntu/ focal main
deb-src https://packages.gitlab.com/runner/gitlab-runner/ubuntu/ focal main > /etc/apt/sources.list.d/runner_gitlab-runner.list
apt update
curl -s https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash
export GITLAB_RUNNER_DISABLE_SKEL=true;
apt install -y gitlab-runner
gitlab-runner register
