#!/bin/bash
chown -R tomcat.tomcat /server/deploy-root/hbhan-tomcat/
su - tomcat -c /server/was/launcher/startup_hbhan-tomcat.sh