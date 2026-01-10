pipeline {
    agent any

    environment {
        IMAGE_NAME = "f**ing shit!"
    }
    
    stages {
        stage("Hello"){
            steps {
                echo "Hello Pipeline from GitHub ${IMAGE_NAME}"
            }
        }
    }
}
