#!/bin/bash

# get go
wget -c https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local
# caveat: export PATH=$PATH:/usr/local/go/bin
