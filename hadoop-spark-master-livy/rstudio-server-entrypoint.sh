#!/bin/bash


export SPARK_VERSION=2.0.1
export SPARK_HOME=/opt/spark-$SPARK_VERSION

rstudio-server start

exec /spark-master-entrypoint.sh $@
#$LIVY_APP_PATH/bin/livy-server $@
