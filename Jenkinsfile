pipeline {
    agent any

    stages {
        stage('Сборка Docker Image') {
            steps {
                script {
                   sh 'docker build -t "reimiyaa/myapp" .'
                }
            }
        }
        stage('Запуск тестов') {
            steps {
                script {
                    sh 'npm test'
                }
            }
        }
        stage('Загрузка в Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://registry-1.docker.io/', 'dockerhub-credentials-id') {
                        docker.image('reimiyaa/myapp').push('latest')
                    }
                }
            }
        }
    }
}

