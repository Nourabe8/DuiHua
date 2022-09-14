FROM maven:3.8.6-openjdk-11
ENV DB_URL=jdbc:mysql://duihua-db.cxdxuohuonzo.us-east-1.rds.amazonaws.com:3306/Duihua
ENV DB_NAME=DuiHua
ENV DB_USENAME=root
ENV DB_PASSWORD=DuiHua2022
ENV DB_PORT=3306
WORKDIR /app
ADD pom.xml .
RUN ["/usr/local/bin/mvn-entrypoint.sh", "mvn", "verify", "clean", "--fail-never"]
COPY . .
RUN mvn package
EXPOSE 8080
ENTRYPOINT ["java","-jar","./target/DuiHua-0.0.1-SNAPSHOT.war"]
