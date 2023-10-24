# 기존의 JRE 이미지 대신 JDK 이미지를 사용 (WAR 실행을 위해)
FROM openjdk:8-jdk-slim

# 포트 설정
EXPOSE 8081

# 어플리케이션 파일을 컨테이너에 추가
COPY build/libs/hanabit*.war app.war


# 컨테이너가 시작될 때 스프링 부트 애플리케이션 실행
ENTRYPOINT ["java", "-jar", "/app.war"]
