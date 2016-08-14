## Docker Image for Apache Spark
This image contains the following softwares:

* OpenJDK 64-Bit v1.8.0_102
* Scala v2.10.6
* SBT v0.13.12
* Apache Spark v1.6.2 

## Get this image
There are 2 options for getting this image:

1. Build this image using [`Dockerfile`](Dockerfile) OR
2. Pull the image directly from DockerHub.

### Build this image
Copy the [`Dockerfile`](Dockerfile) to a folder on your local machine and then invoke the following command.


    docker build -t p7hb/p7hb-docker-spark:1.6.2 .


### Pull the image


    docker pull p7hb/p7hb-docker-spark


## Run the image

    docker run --rm -ti -p 4040:4040 -p 8080:8080 -h spark --name=spark p7hb/p7hb-docker-spark:1.6.2


The above step will launch and run the image with:

 * `root` user [as defined in the `Dockerfile`].
 * `spark` as host name.
 * `spark` container name.

## Check softwares and versions

### Host name

    root@spark:~# hostname
    spark

### Java

    root@spark:~# java -version
    openjdk version "1.8.0_102"
    OpenJDK Runtime Environment (build 1.8.0_102-8u102-b14.1-1~bpo8+1-b14)
    OpenJDK 64-Bit Server VM (build 25.102-b14, mixed mode)

### Scala

    root@spark:~# scala -version
    Scala code runner version 2.10.6 -- Copyright 2002-2013, LAMP/EPFL

### SBT

Running `sbt about` will download and setup SBT on the image.

### Spark

```
root@spark:~# spark-shell
Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /___/ .__/\_,_/_/ /_/\_\   version 1.6.2
      /_/

Using Scala version 2.10.5 (OpenJDK 64-Bit Server VM, Java 1.8.0_102)
Type in expressions to have them evaluated.
Type :help for more information.
Spark context available as sc.
SQL context available as sqlContext.

scala>
```

## Spark commands
All the required binaries have been added to the `PATH`.

### Start Spark Master

    start-master.sh


### Start Spark Slave

    start-slave.sh spark://spark:7077

### Execute Spark job for calculating `Pi` Value

    spark-submit --class org.apache.spark.examples.SparkPi --master spark://spark:7077 $SPARK_HOME/lib/spark-examples*.jar 100

### Start Spark Shell

    spark-shell --master spark://spark:7077