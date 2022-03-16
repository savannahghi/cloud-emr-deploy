#!/bin/bash

source /home/{{server_user}}/envs/tomcat_env.sh
/opt/apache_tomcat/apache-tomcat-{{ tomcat_version }}/bin/shutdown.sh
echo "Tomcat stopped"
