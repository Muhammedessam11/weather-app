pipeline {
    agent { label 'JenkinsSlave03' }  // Specify the agent here
    
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
        
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh '''
                        kubectl create deployment weather-app --image=mohamedessam1911/weather-app:latest --dry-run=client -o yaml | kubectl apply -f -
                        kubectl expose deployment weather-app --type=LoadBalancer --port=3000 --target-port=3000
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
