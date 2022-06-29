FROM hiromuhota/webspoon:0.8.2.17-full
COPY mysql-connector-java-5.1.47.jar ${CATAINA_HOME}/lib/mysql-connector-java-5.1.47.jar
RUN mkdir -p /usr/local/tomcat/plugins/spoon/pdi-git-plugin
COPY pdi-git-plugin /usr/local/tomcat/plugins/spoon/pdi-git-plugin