pipeline {
    agent any

    stages {
        stage('Сборка Docker Image') {
            steps {
                script {
                    docker.build('hello-world-app')
                }
            }
        }
        stage('Запуск тестов') {
            steps {
                script {
                    docker.image('hello-world-app').inside {
                        sh 'npm install'
                        sh 'npm test'
                    }
                }
            }
        }
        stage('Загрузка в Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials-id') {
                        docker.image('hello-world-app').push('latest')
                    }
                }
            }
        }
    }
}

