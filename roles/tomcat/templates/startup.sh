#!/bin/bash

set -e

if [[ `id -nu` != "{{ server_user }}" ]];then
   echo "Not running as {{ server_user }}, exiting..."
   exit 1
fi

source /home/{{server_user}}/envs/tomcat_env.sh
/opt/apache_tomcat/apache-tomcat-{{ tomcat_version }}/bin/startup.sh
echo "Tomcat started"
