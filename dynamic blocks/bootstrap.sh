#!/bin/bash
yum - y update
yum - y install httpd
sudo servise httpd started
chkconfig httpd on
