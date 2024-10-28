pipeline {
    agent any

    stages {
        stage('Сборка Docker Image') {
            steps {
                script {
                   sh 'docker build -t "myapp" .'
                }
            }
        }
        stage('Запуск тестов') {
            steps {
                script {
                    docker.image('myapp').inside {
                        sh 'npm test'
                    }
                }
            }
        }
        stage('Загрузка в Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials-id') {
                        docker.image('myapp').push('latest')
                    }
                }
            }
        }
    }
}

