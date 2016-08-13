FROM openjdk:8

MAINTAINER Prashanth Babu <Prashanth.Babu@gmail.com>

ENV SPARK_VERSION                           1.6.2
ENV SPARK_BINARY_ARCHIVE_NAME               spark-${SPARK_VERSION}-bin-hadoop2.6
ENV SPARK_BINARY_ARCHIVE_NAME_WITH_TGZ      $SPARK_BINARY_ARCHIVE_NAME.tgz
ENV SPARK_HOME                              /usr/local/spark

ENV SCALA_VERSION                           2.10.6
ENV SCALA_BINARY_ARCHIVE_NAME               scala-${SCALA_VERSION}
ENV SCALA_BINARY_ARCHIVE_NAME_WITH_TGZ      scala-$SCALA_VERSION.tgz
ENV SCALA_HOME                              /usr/local/scala

ENV SBT_VERSION                             0.13.12
ENV SBT_BINARY_ARCHIVE_NAME_WITH_TGZ        sbt-$SBT_VERSION.tgz
ENV SBT_HOME                                /usr/local/sbt

ENV PATH                                    $JAVA_HOME/bin:$SCALA_HOME/bin:$SBT_HOME/bin:$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH

RUN apt-get -y update && \
    apt-get install \
        curl vim tmux -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    wget -qO - http://d3kbcqa49mib13.cloudfront.net/${SPARK_BINARY_ARCHIVE_NAME_WITH_TGZ} | tar -xz -C /usr/local/ && \
    cd /usr/local && ln -s ${SPARK_BINARY_ARCHIVE_NAME} spark && \
    wget -qO - http://downloads.lightbend.com/scala/${SCALA_VERSION}/${SCALA_BINARY_ARCHIVE_NAME_WITH_TGZ} | tar -xz -C /usr/local/ && \
    cd /usr/local && ln -s ${SCALA_BINARY_ARCHIVE_NAME} scala && \
    wget -qO - https://dl.bintray.com/sbt/native-packages/sbt/${SBT_VERSION}/${SBT_BINARY_ARCHIVE_NAME_WITH_TGZ} | tar -xz -C /usr/local/ 

USER root

WORKDIR /root

EXPOSE 4040 8080

CMD ["/bin/bash"]