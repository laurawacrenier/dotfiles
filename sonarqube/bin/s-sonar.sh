#!/bin/sh

# Exit on failure
set -e

setDefaultCredentials() {
    echo "sonar.jdbc.username=sonar" >> $SONAR_PROPERTIES_FILE
    echo "sonar.jdbc.password=sonar" >> $SONAR_PROPERTIES_FILE
}

clearEmbeddedDatabaseSettings() {
  sed '/embeddedDatabase/d' $SONAR_PROPERTIES_FILE > $SONAR_PROPERTIES_FILE.new
  sed '/jdbc/d' $SONAR_PROPERTIES_FILE.new > $SONAR_PROPERTIES_FILE
  rm $SONAR_PROPERTIES_FILE.new
}

clearDataFolder() {
  rm -rf $SONAR_CURRENT/data/*
  rm -rf $SONAR_CURRENT/logs/*
}

SONAR_PROPERTIES_FILE=$SONAR_CURRENT/conf/sonar.properties
SONAR_DB="localhost"

if [ "$1" = "start" ]
then
  # clean the temp data
  clearDataFolder

  # Clear DB settings
  clearEmbeddedDatabaseSettings

  # print out properties for the correct DB
  if [ "$2" = "NEXT" ]
  then
    echo "sonar.jdbc.username=laura" >> $SONAR_PROPERTIES_FILE
    echo "sonar.jdbc.password=laura" >> $SONAR_PROPERTIES_FILE
    echo "sonar.jdbc.url=jdbc:postgresql://doryondemanddb.internal.sonarsource.com/laura" >> $SONAR_PROPERTIES_FILE
  else
    echo "sonar.jdbc.url=$H_JDBC_URL" >> $SONAR_PROPERTIES_FILE
    echo "sonar.embeddedDatabase.port=9092" >> $SONAR_PROPERTIES_FILE
  fi
fi

$SONAR_CURRENT/bin/$SONAR_WRAPPER_FOLDER/sonar.sh $1
