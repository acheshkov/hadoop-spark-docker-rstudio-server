#!/bin/bash


export SPARK_VERSION=1.6.2
export SPARK_HOME=/opt/spark-$SPARK_VERSION


if [ -z ${HOST+x} ]; then
  export LIBPROCESS_IP=$(ip route get 8.8.8.8 | head -1 | cut -d' ' -f8)
else
  export LIBPROCESS_IP=$HOST
fi


#exec /spark-master-entrypoint.sh $@
#$LIVY_APP_PATH/bin/livy-server $@
