#!/bin/bash
curl https://releases.rancher.com/install-docker/19.03.sh | sh
usermod -aG docker ubuntu