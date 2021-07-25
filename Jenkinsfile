pipeline {
    agent any
    tools {
        // Install gradle and configure
        gradle "DEFAULT"
    }
    stages {
        stage('Build') {
            steps {
                cleanWs()
                // clone project
                git branch: 'main', url: 'https://github.com/sudershanpothina/pg-final-project.git'
                sh "gradle clean"
            }
        }
    }
}
