pipeline {
    agent any

    tools {
        jdk 'java21'
        maven 'maven3'
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh "${tool 'maven3'}/bin/mvn clean compile"
            }
        }

        stage('Test') {
            steps {
                sh "${tool 'maven3'}/bin/mvn test"
            }
        }

        stage('Package') {
            steps {
                sh "${tool 'maven3'}/bin/mvn package"
            }
        }
    }

    post {
        success {
            echo 'CI PIPELINE SUCCESS 🎉'
        }
        failure {
            echo 'CI PIPELINE FAILED ❌'
        }
    }
}
