FROM maven:3.8.6-openjdk-11 as build
RUN git clone https://github.com/rohi3369/spring-petclinic.git && \
     cd /spring-petclinic && \
      mvn package
  
FROM openjdk:11
COPY --from=build /spring-petclinic/target/spring-petclinic-2.7.3.jar /spring-petclinc-2.7.3.jar
EXPOSE 8080
CMD [ "java", "-jar", "springpetclinc-2.7.3.jar" ]                                