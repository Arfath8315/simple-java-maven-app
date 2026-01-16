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
                  mvn -version
                  java -version
                '''
            }
        }

        stage('Build JAR') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                  docker build -t my-java-app:latest .
                '''
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                  docker rm -f my-java-app || true
                  docker run -d -p 8001:8080 --name my-java-app my-java-app:latest
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline succeeded'
        }
        failure {
            echo '❌ Pipeline failed'
        }
    }
}

