pipeline {
    agent {
        label 'built-in'
    }

    environment {
        IMAGE_NAME = "my-app"
        CONTAINER_NAME   = "my-app-container"
        PORT = "8081"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Mudrist/test_guvi.git'
            }
        }

        stage('Build Image') {
            steps {
                    sh 'docker build -t $IMAGE_NAME .'
                }
            }
        stage('container operation') {
            steps {
                    sh '''
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                    '''
                }
            }
        stage('Run New Container') {
            steps {
                    sh '''
                    docker run -d -p $PORT:80 --name $CONTAINER_NAME $IMAGE_NAME || true
                    '''
                }
            }   
            
        }
    }
