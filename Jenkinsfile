pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/karyabarca/new-demoapp.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'python3 -m venv venv'
                        sh './venv/bin/pip install -r requirements.txt'
                    } else {
                        bat 'python -m venv venv'
                        bat 'venv\\Scripts\\pip install -r requirements.txt'
                    }
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    if (isUnix()) {
                        sh './venv/bin/python -m pytest tests/'
                    } else {
                        bat 'venv\\Scripts\\python -m pytest tests\\'
                    }
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t new-demoapp .'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh 'docker run --name new-demoapp-container -d new-demoapp'
                }
            }
        }
    }
}
