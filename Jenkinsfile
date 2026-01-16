pipeline {
    agent any

    tools {
        maven 'maven3.9'
        jdk 'java21'
    }

    environment {
        IMAGE_NAME = "java-cicd-app"
        CONTAINER_NAME = "java-app"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
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
                docker build -t $IMAGE_NAME .
                '''
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true

                docker run -d \
                  -p 8001:8080 \
                  --restart always \
                  --name $CONTAINER_NAME \
                  $IMAGE_NAME
                '''
            }
        }
    }

    post {
        success {
            echo "🚀 Application deployed successfully on port 8001"
        }
        failure {
            echo "❌ Pipeline failed"
        }
    }
}

