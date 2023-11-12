#!/bin/bash

sudo yum update -y 
    sudo yum install wget -y  
    sudo cd /opt
    sudo wget -O splunkforwarder-9.1.1-64e843ea36b1-Linux-x86_64.tgz "https://download.splunk.com/products/universalforwarder/releases/9.1.1/linux/splunkforwarder-9.1.1-64e843ea36b1-Linux-x86_64.tgz"
    sudo tar -zxvf splunkforwarder-9.1.1-64e843ea36b1-Linux-x86_64.tgz -C /opt
    sudo chmod -R 777  splunkforwarder-9.1.1/
    sudo /opt/splunkforwarder/bin/splunk start --accept-license --answer-yes --no-prompt --seed-passwd "Nzui237@" 
    sudo /opt/splunkforwarder/bin/splunk enable boot-start