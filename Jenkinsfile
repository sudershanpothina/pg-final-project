pipeline {
    agent any
    tools {
        // Install gradle and configure
        gradle "DEFAULT"
    }
    stages {
        stage('Clone project') {
            steps {
                cleanWs()
                // clone project
                git branch: 'main', url: 'https://github.com/sudershanpothina/pg-final-project.git'
                //clean
                sh "gradle clean"
            }
        }
        stage('build') {
            steps {
                sh "gradle build"
            }
        }
        stage('unit test') {
            steps {
                sh "gradle build"
            }
        }
        stage('package') {
            steps {
                sh "ls -al build/libs"
            }
        }
        stage('login to docker') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-creds', passwordVariable: 'DOCKER_PASSWD', usernameVariable: 'DOCKER_USER')]) {
                    sh "docker login -u $DOCKER_USER -p $DOCKER_PASSWD"
                }
            }
        }
        stage('build docker image') {
            steps {
                sh "docker build . -t sdrshnrcks/pg-sl-frontend:${BUILD_NUMBER}"
            }
        }
        stage('push docker image') {
            steps {
                sh "docker push sdrshnrcks/pg-sl-frontend:${BUILD_NUMBER}"
            }
        }

        stage('logout docker') {
            steps {
                sh "docker logout"
            }
        }
    }
}
