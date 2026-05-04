pipeline {
    agent { label 'Built-In Node' }

    stages {
        stage('Clone') {
            steps {
                git branch: 'main',
                url: 'https://github.com/Mudrist/test_guvi.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Building application...'
            }
        }

        stage('Test') {
            steps {
                echo 'Running unit tests...'
            }
        }
    }
}
