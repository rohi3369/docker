FROM openjdk:11
COPY /home/ubuntu/remote_root/workspace/spring/target/spring-petclinic-2.7.3.jar /spring-petclinc-2.7.3.jar
EXPOSE 8080
CMD [ "java", "-jar", "springpetclinc-2.7.3.jar" ]                                 