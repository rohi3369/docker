# image executed 
FROM maven:3.8.6-openjdk-11
RUN git clone https://github.com/rohi3369/shopizer.git && \
cd shopizer && \
mvn install
EXPOSE 8080
CMD ["java", "-jar", "/shopizer.jar"]
