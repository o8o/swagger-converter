FROM node:latest

RUN mkdir -p /usr/src/app

RUN cd /usr/src/app/ && \
    git clone https://github.com/LucyBot-Inc/api-spec-converter && \
    git clone https://github.com/mszostok/swagger-converter && \
    npm config set user 0 && \
    npm config set unsafe-perm true && \
    cd /usr/src/app/api-spec-converter && \
    npm install -g api-spec-converter && \
    echo "deb http://http.debian.net/debian jessie-backports main" | tee --append /etc/apt/sources.list.d/jessie-backports.list > /dev/null && \
    apt-get update && \
    apt-get install -y vim && \
    apt-get install -y maven && \
    apt-get install -y -t jessie-backports openjdk-8-jdk && \
    update-java-alternatives -s java-1.8.0-openjdk-amd64 && \
    cd /usr/src/app/swagger-converter && \
    mvn clean compile assembly:single


EXPOSE 8080
ENTRYPOINT [ "java",  "-jar", "/usr/src/app/swagger-converter/target/SwaggerYAMLConverter-1.0-SNAPSHOT-jar-with-dependencies.jar" ]
CMD [ "java",  "-jar", "/usr/src/app/swagger-converter/target/SwaggerYAMLConverter-1.0-SNAPSHOT-jar-with-dependencies.jar", "-h" ]

