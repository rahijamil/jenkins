pipeline {
    agent any

    environment {
        IMAGE_NAME = "rahijamil/jenkins-my-web"
        DOCKERHUB_CREDS = credentials('dockerhub-user-pass')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Docker Check') {
            steps {
                sh 'docker version'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${IMAGE_NAME}:latest")
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-user-pass') {
                        dockerImage.push('latest')
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying ${IMAGE_NAME}:latest"
                // You can add docker run / Kubernetes / Helm commands here
            }
        }
    }

    post {
        always {
            echo "Pipeline finished"
        }
        success {
            echo "Build & Push successful 🎉"
        }
        failure {
            echo "Pipeline failed ❌"
        }
    }
}
