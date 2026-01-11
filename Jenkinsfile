pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
            }
        }
    }

    post {
        success {
            emailext subject: 'Build SUCCESS: ${JOB_NAME}',
                     body: 'Job ${JOB_NAME} build #${BUILD_NUMBER} was successful.',
                     to: 'cs.mohammadrahi@gmail.com'
        }
        failure {
            emailext subject: 'Build FAILURE: ${JOB_NAME}',
                     body: 'Job ${JOB_NAME} build #${BUILD_NUMBER} failed.',
                     to: 'cs.mohammadrahi@gmail.com'
        }
    }
}
