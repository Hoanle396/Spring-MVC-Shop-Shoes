FROM tomcat:8.5.31-jre8
WORKDIR .
RUN rm -rvf /usr/local/tomcat/webapps/ROOT
RUN ls
ADD ./target/webApp.war /usr/local/tomcat/webapps/ROOT.war
CMD ["catalina.sh", "run"]
EXPOSE 8080