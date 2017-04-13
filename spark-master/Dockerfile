FROM hadoop-spark:latest

ADD spark-master-entrypoint.sh /spark-master-entrypoint.sh
RUN chmod a+x /spark-master-entrypoint.sh

ENTRYPOINT ["/spark-master-entrypoint.sh"]
