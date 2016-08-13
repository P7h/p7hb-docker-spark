## Docker Image for Apache Spark
This image contains the following softwares

* Apache Spark v1.6.2 
* Scala v2.10.6
* SBT v0.13.12
* OpenJDK 64-Bit v1.8.0_102

## Get this image
There are 2 options to get this image.

You can either build this image using `Dockerfile` or pull the image directly from DockerHub.

### Build this image
Copy the `Dockerfile` to your local machine and then invoke the following command.

```
docker build -t p7hb/p7hb-docker-spark:1.6.2 .
```

### Pull the image

```
docker pull p7hb/p7hb-docker-spark
```
## Run the image
```
docker run --rm -ti -p 4040:4040 -p 8080:8080 -h spark --name=spark p7hb/p7hb-docker-spark:1.6.2
```
The above step will run the image with `root` on hostname `spark`.

## Spark commands
All the required binaries have been added to the `PATH`.

### Start Spark Master
```
start-master.sh
```

### Start Spark Slave
```
start-slave.sh spark://spark:7077
```

### Execute Spark job for calculating `Pi` Value
```
spark-submit --class org.apache.spark.examples.SparkPi --master spark://spark:7077 $SPARK_HOME/lib/spark-examples*.jar 100
```