---
title: "How to Dockerize Spring Boot and PostgreSQL"
date: 2023-02-21T18:19:39+01:00
draft: false
---

# Introduction.

In this article, I will walk you through the entire process of dockerizing a Spring Boot application, and connecting it to a PostgreSQL database which would be spun up in a seperate container. I assume you have a little knowledge of [Docker](https://docker.com). I initially planned to do a Docker tutorial. I think at the time of writing this--I have a draft on medium about it. Expect an article soon based on Docker.

### Getting Started.

[Docker](https://docker.com) is a pretty useful tool that lets you bundle your applications into things called "images" which houses your application files and dependencies. It lets you run the application within those images as a "container" which is an isolated virtual environment, otherwise layer on your operating system. 

Recently, I spun up an Ubuntu docker image which I accessed by entering into the container. It is an awesome tool that would let you save money and run multiple applications simultaneously.

To get started, you would need a machine running Linux preferrably. This is because when Docker was developed, it was done with the Linux operating system in mind as the target platform. I personally fancy Debian distributions, specifically Ubuntu.

If you use Windows, that is pretty fantastic! You could use the popular [Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/install). This is an amazing feature Windows included that would let you run Linux on top of Windows, therefore utilize the power of Docker and Docker Desktop.

If you use MacOS, do not fret! All you require is the Docker Desktop application. It is really ironic that despite Apple's MacOS being based on the Unix kernel which is similar to Linux it isn't natively supported by Docker. If you use a Mac, [download the Docker Desktop for Mac OS X](https://desktop.docker.com/mac/main/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=module).

### Installing Docker.

I will be focusing on Linux users here, since all you need to do for Mac and Windows is run a setup or installation file to get it up quickly.

1. Firstly if you have an Old version of Docker, you may need to uninstall:
```bash
$ sudo apt-get remove docker docker-engine docker.io containerd runc
```

2. Update your `apt` package-index:
```bash
$ sudo apt-get update
$ sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```

3. Include Docker's official GPG Key:
```bash
$ sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

4. Set up the registry for Docker:
```bash
$ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

5. Update the apt package-index:
```bash
$ sudo chmod a+r /etc/apt/keyrings/docker.gpg
$ sudo apt-get update
```

6. Setup and install the docker engine after satisfying the above requirements:
```bash
$ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### Setting Up Java.

You would need to set up Java on your system. To do this, you would need to install the Java Development Kit. To do this, run the following command: `brew install openjdk@19` (MacOS) or `sudo apt install openjdk@19` (Linux). If you use windows, kindly visit [Oracle](https://oracle.com) to download the Java Development Kit. 

If you use Windows, visit Apache Maven's site to install it. Then add it to your environment variable path.

### Installing Maven.

Maven is a build tool that is used for building Java packages and dependencies. It is very much similar to gradle, which you must have used or heard of before if you have done something like Android development. Here we would be using Maven. Java is a dependency for Maven. To install Maven, run the following command:
`brew install mvn` (MacOS) or `sudo apt install mvn`.

### Setting Up Spring Boot.

[Spring Boot](https://spring.io) is a popular MVC framework that was used to simplify the development of applications in the Java Programming Language that was hard to do with the intial Spring MVC framework. It is one of the most preferred means of developing web applications in Java and is used widely in enterprise organizations, banking institutions and major payment infrastructure.

This isn't a spring crash course, so we're going to do something pretty simple. There are two ways to go about this. One, we use [Spring Boot's quickstart](https://spring.io) to generate our spring boot application, otherwise we use the Spring Boot Extension in Visual Studio code, which I use and is pretty amazing. You could get it [here](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-spring-initializr)

The version we would be playing with at this time is `3.0.0+`.

> Any version you would want to use works fine, the main deal is getting our Spring Boot application and PostgreSQL containers up. Type in "spring-docker-postgres" as the demo and artifcat for the project.

Select "Jar" as the format which our application would be bundled into. You could skip the dependency aspects. We'll add those later. Also select Java 19 as the version to use for the project.

Once you have generated your project file, open it up either in Visual Studio Code or Intelli J. The next thing you would have to do, is select your dependencies and strap them onto your `pom.xml`.

```xml
<dependencies>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-data-jpa</artifactId>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-security</artifactId>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-web</artifactId>
		</dependency>
		<dependency>
			<groupId>org.postgresql</groupId>
			<artifactId>postgresql</artifactId>
			<scope>runtime</scope>
		</dependency>
		<dependency>
			<groupId>org.projectlombok</groupId>
			<artifactId>lombok</artifactId>
			<optional>true</optional>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-test</artifactId>
			<scope>test</scope>
		</dependency>
		<dependency>
			<groupId>org.springframework.security</groupId>
			<artifactId>spring-security-test</artifactId>
			<scope>test</scope>
		</dependency>
	</dependencies>
```

Update the package repostory using Maven, the build tool which we previously installed.

<!-- ### Creating a Simple Spring Method.

Create a new file in your `src/main/java/com/spring-docker-postgres/spring-docker-postgres/` by running the following command: `mkdir example && cd example && touch ExampleController.java`. Once that is done, populate the file with the following:

`ExampleController.java`
```java
package com.spring_docker_postgres.spring_docker_postgres.example;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/example")
public class ExampleController {
 @GetMapping
 public ResponseEntity<String> exampleController() {
  return ResponseEntity.ok("Testing the api.");
 }
}
```

Define your application properties: -->


```properties

spring.datasource.url=jdbc:postgresql://localhost:5432/example
spring.datasource.username=postgres
spring.datasource.password=postgres

spring.jpa.show-sql=true
spring.jpa.hibernate.ddl-auto=update
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.PostgreSQLDialect
spring.jpa.properties.hibernate.format_sql=true
```


Execute the command: `mvn spring-boot:run` or run the project from your IDE. Using an API Testing client such as Postman or Insonmia, test the following endpoint to see the response: `http://localhost:8080/api/v1/example`. That should return the above response in a string, as JSON format within the response body.

### Dockerizing our Application.

So generally Spring Boot applications are deployed or built into production into a format called `Jar` or `War`. We selected `Jar` initially. In order to build our application into a `jar` file, we would need to run the following commands:

```bash
$ ./mvnw clean package -DskipTests
```

We added the flag `-DskipTests` to just skip tests and get to the chase. I do not recommend you do this when building a `jar` so you catch the errors and avoid shipping bugs into production
We should have our newly created `.jar` stored in our target folder! 

It is usually stored in a folder known as `target/` which is in your project's directory. I recommend you copy the jar file from the target folder into your root directory. `sudo cp /target/<jar-file>.jar /<destination>/`

### Creating the Docker image.

A docker image is like potential energy. It's a container at rest packaged with all application dependencies required to run our application. To build an image, we would have to define the contents using something called a `Dockerfile.` Create a file called `Dockerfile`. No extension, just a file: `touch Dockerfile`. Depending on your IDE, you should see a blueish or pink whale icon carrying some boxes. Now, we define the contents:

```Dockerfile
FROM openjdk:19
ARG JAR_FILE=*.jar
COPY ${JAR_FILE} application.jar
ENTRYPOINT ["java", "-jar", "application.jar"]
```

Here, using `FROM` we get the OpenJdk@19 installed on our image. We copy the `jar` file into our image and add an Entrypoint. Then we save the file. Instead of building the image right away, we would use a container orchestration tool known as docker-compose which we installed previously in this article.

### Using Docker-Compose.

Docker-Compose is a utility used to automate and orchestrate the deployment, management and building of docker images to docker containers. To use docker-compose, we need to create a `docker-compose.yml` file.

Append the following configurations:

```yml
version: '3.1'
services:
  API:
    image: ':latest'
    build:
      context: .
    ports:
      - "8080:8080"
    container_name: spring_docker-postgres
    depends_on:
      Database:
        condition: service_healthy
    environment:
      - SPRING_DATASOURCE_URL=jdbc:postgresql://Database:5432/example
      - SPRING_DATASOURCE_USERNAME=postgres
      - SPRING_DATASOURCE_PASSWORD=postgres
      - SPRING_JPA_HIBERNATE_DDL_AUTO=update
```

Here we instruct docker-compose to build our spring boot image into a container called "api" and provide the context, otherwise dockerfile to acheive this. We also assign ports and create the environment variables for the project.

### Where's our postgres database?

> This is where it gets interesting. We do not need a local database!
Docker gives us the power to create and run an instance of PostgreSQL within a container by pulling the image off the registry without having postgres installed locally. To do this we use compose once more.

```yml
  Database:
    image: 'postgres:13.1-alpine'
    ports:
      - "5432"
    container_name: sdp_database
    environment:
      - POSTGRES_PASSWORD=postgres
      - POSTGRES_USER=postgres
      - POSTGRES_DB=example
    healthcheck:
      test: [ "CMD-SHELL", "pg_isready -U postgres" ]
      interval: 10s
      timeout: 5s
      retries: 5
```

The "spd" is just a self coined abbreviation for spring-docker-postgres. Call it whatever you like!

### Running the containers.

Your compose file should look like this:

```yml
version: '3.1'
services:
  API:
    image: ':latest'
    build:
      context: .
    ports:
      - "8080:8080"
    container_name: spring_docker-postgres
    depends_on:
      Database:
        condition: service_healthy
    environment:
      - SPRING_DATASOURCE_URL=jdbc:postgresql://Database:5432/example
      - SPRING_DATASOURCE_USERNAME=postgres
      - SPRING_DATASOURCE_PASSWORD=postgres
      - SPRING_JPA_HIBERNATE_DDL_AUTO=update
Database:
    image: 'postgres:13.1-alpine'
    ports:
      - "5432"
    container_name: sdp_database
    environment:
      - POSTGRES_PASSWORD=postgres
      - POSTGRES_USER=postgres
      - POSTGRES_DB=example
    healthcheck:
      test: [ "CMD-SHELL", "pg_isready -U postgres" ]
      interval: 10s
      timeout: 5s
      retries: 5
```

Now the command we've all been waiting for! Run `docker-compose up` Then visit the assigned ports on your localhost. Congratulations, you have dockerized Spring and Postgres!
