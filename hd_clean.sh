#!/bin/bash

echo "This script will clean up temporary files and call gdmap for data overview."

sudo journalctl --vacuum-size=300M
sudo apt-get clean
sudo apt-get autoremove

gdmap
