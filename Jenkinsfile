pipeline {
    agent  label {'built-in'}

    environment {
        DOCKER_IMAGE = "vikasmudrist/myapp_vikas_guvi"
        DOCKER_TAG = "latest" // Uses Jenkins build number as the tag
    }

    stages {
        stage('Checkout') {
            steps {
                // Pulls the latest code from your SCM (GitHub/Bitbucket)
                git branch: 'main',
                url: 'https://github.com/Mudrist/test_guvi.git'    
            }
        }

        stage('Build Image') {
            steps {
                script {
                    // Builds the image using the Dockerfile in the root directory
                    sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                    sh "docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_IMAGE}:latest"
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials ([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )])    {
                    sh 'echo $PASS' | docker login -u $USER --password-stdin
                }
                    

                }
            }
        }

       
    
        stage('push image') {
            steps {
                // Removes local images to save disk space on the Jenkins agent
                sh "docker push ${DOCKER_IMAGE}:latest"
            }
        }
    }
}
