#!/bin/bash

CATALINA_HOME="/opt/apache_tomcat/apache-tomcat-{{ tomcat_version }}"

export CATALINA_BASE="/home/{{ server_user }}/tomcat"
export JAVA_HOME='/usr/lib/jvm/java-1.8.0-openjdk-amd64/'
export JAVA_OPTS='-Xmx1000m -Xms1000m'

# The first existing directory is used for JAVA_HOME (if JAVA_HOME is not
# defined in $DEFAULT)
JDK_DIRS="/usr/lib/jvm/java-1.8.0-openjdk-amd64/ /usr/lib/jvm/java-7-openjdk-amd64 /usr/lib/jvm/jre-7-oracle-x64"

# Look for the right JVM to use
for jdir in $JDK_DIRS; do
    if [ -r "$jdir/bin/java" -a -z "${JAVA_HOME}" ]; then
	JAVA_HOME_TMP="$jdir"
	# checks for a real JDK like environment, needed to check if 
	# really the java-gcj-compat-dev package is installed
	if [ -r "$jdir/bin/jdb" ]; then
	    JAVA_HOME="$JAVA_HOME_TMP"
	fi
    fi
done

# Default Java options
if [ -z "$JAVA_OPTS" ]; then
	JAVA_OPTS="-Djava.awt.headless=true"
fi
