FROM ubuntu:14.04
MAINTAINER javacodegeeks
RUN apt-get update && apt-get install -y python-software-properties software-properties-common
RUN add-apt-repository ppa:webupd8team/java
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 boolean true" | debconf-set-selections	 
RUN apt-get update && apt-get install -y oracle-java8-installer
RUN mkdir -p /usr/local/helloworld
ADD test/target /usr/local/helloworld
CMD ["java", "-cp", "/usr/local/helloworld/basic-maven-example-1.0-SNAPSHOT.jar", "HelloWorld"]
