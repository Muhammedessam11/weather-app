pipeline {
    agent any
    
     environment {
        DOCKERHUB_CREDENTIALS = credentials('Dockerhub')
    }
    
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t mohamedessam1911/weather-app:latest .'
                }
            }
        }
        
        stage('Docker Login') {
            steps {
               sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    sh 'docker push mohamedessam1911/weather-app:latest'
                }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    sh '''
                        docker run -d -p 3000:3000 --name weather-app mohamedessam1911/weather-app:latest
                    '''
                }
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
