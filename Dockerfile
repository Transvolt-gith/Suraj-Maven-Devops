FROM tomcat:latest
MAINTAINER Ashok <ashok@oracle.coms>
EXPOSE 8080
COPY target/suraj-maven-web-app.war /usr/local/tomcat/webapps/suraj-maven-web-app.war
