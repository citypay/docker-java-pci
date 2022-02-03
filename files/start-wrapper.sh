#!/bin/bash

# expecting that this script is run by the runtime user not root
# ensure that the line is added to /etc/sudoers.d
# %osquery ALL=(ALL) NOPASSWD: /usr/bin/osqueryd

# turn on bash's job control
set -m

# run osqueryd in the background
sudo osqueryd &
