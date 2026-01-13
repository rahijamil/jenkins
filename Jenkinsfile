pipeline {
    agent any

    tools {
        dockerTool 'docker-latest' 
    }

    environment {
        IMAGE_NAME = "rahijamil/jenkins-my-web"
        DOCKERHUB_CREDS = credentials('dockerhub-user-pass')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/rahijamil/jenkins.git'
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
                // docker run / Kubernetes / Helm commands
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
