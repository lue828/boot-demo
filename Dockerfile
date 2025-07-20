FROM openjdk:17-jdk-alpine
EXPOSE 8080
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone 
ENV LANG=zh_CN.UTF-8 \
	JAVA_OPTS="-server -Xms512m -Xmx512m" \
    SPRING_PROFILES_ACTIVE="dev"

ADD ./boot-demo.jar boot-demo.jar
# ENTRYPOINT ["java","-javaagent:/opt/skywalking/agent/skywalking-agent.jar","-Xms512m","-Xmx512m","-jar","app.jar"]
ENTRYPOINT exec java -Dspring.profiles.active=${SPRING_PROFILES_ACTIVE} ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -jar /boot-demo.jar

# ENTRYPOINT exec java -Dspring.profiles.active=${SPRING_PROFILES_ACTIVE} ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -jar /app.jar
