#!/bin/bash

sudo dnf update --refresh -y
sudo dnf autoremove -y

sudo systemctl reboot
