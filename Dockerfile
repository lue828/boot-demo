FROM openjdk:17-jdk-alpine
EXPOSE 8080
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone 
ENV LANG=zh_CN.UTF-8 \
	JAVA_OPTS="-server -Xms512m -Xmx512m" \
    SPRING_PROFILES_ACTIVE="dev"

#将jar添加到容器的/opt目录中
COPY /app/build/boot-demo.jar /opt

#指定dockerfile的命令在哪个目录下执行
WORKDIR /opt

#ENTRYPOINT exec java -Dspring.profiles.active=${SPRING_PROFILES_ACTIVE} ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -jar boot-demo.jar
ENTRYPOINT exec java -Djava.security.egd=file:/dev/./urandom -jar boot-demo.jar

