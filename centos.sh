#!/bin/bash

yum install -y nginx
yum clean all
rm -rf /var/cache/yum
