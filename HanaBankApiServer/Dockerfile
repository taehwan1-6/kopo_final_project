# 기본 이미지로 OpenJDK 8을 사용합니다.
FROM openjdk:8-jre-slim

# 어플리케이션 파일을 컨테이너에 추가합니다.
COPY build/libs/HanaBankApiServer*.jar app.jar

# 8080 포트를 열어둡니다.
EXPOSE 8082

# 컨테이너가 실행될 때 Java 어플리케이션을 실행합니다.
ENTRYPOINT ["java", "-jar", "/app.jar"]
