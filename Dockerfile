FROM openjdk:11
COPY ./target/spring-petclinic-2.7.3.jar /spring-petclinc-2.7.3.jar
EXPOSE 8080
CMD [ "java", "-jar", "spring-petclinic-2.7.3.jar" ]                                