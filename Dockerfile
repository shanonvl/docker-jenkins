FROM stackbrew/ubuntu:14.04
MAINTAINER Allan Espinosa "allan.espinosa@outlook.com"

# this repo adds oracle-java8 support, see the following link for more details:
# http://tecadmin.net/install-oracle-java-8-jdk-8-ubuntu-via-ppa/
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update && apt-get clean

RUN apt-get install -q -y oracle-java8-installer oracle-java8-set-default git make gcc maven && apt-get clean

ADD http://mirrors.jenkins-ci.org/war/1.574/jenkins.war /opt/jenkins.war
RUN chmod 644 /opt/jenkins.war
ENV JENKINS_HOME /jenkins

ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]
EXPOSE 8080
CMD [""]
