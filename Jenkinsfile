pipeline {
    agent any

    tools {
        maven 'maven3.9.12'
        jdk 'java21'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Verify Tools') {
            steps {
                sh '''
                  echo "Using Maven from: $MAVEN_HOME"
                  $MAVEN_HOME/bin/mvn -version
                  java -version
                '''
            }
        }

        stage('Build JAR') {
            steps {
                sh '''
                  $MAVEN_HOME/bin/mvn clean package -DskipTests
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-java-app:latest .'
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                  docker rm -f my-java-app || true
                  docker run -d -p 8081:8080 --name my-java-app my-java-app:latest
                '''
            }
        }
    }
}

