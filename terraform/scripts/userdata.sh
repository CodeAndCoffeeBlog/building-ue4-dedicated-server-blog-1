#!/bin/bash

sudo docker run -d --name ue4-dedicated -p 7777:7777/udp --restart=always ue4-dedicated-server:latest