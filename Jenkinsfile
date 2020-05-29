pipeline {
    // master executor should be set to 0
    agent any
    stages {
        stage('Build Jar') {
            steps {
                //sh
                bat "mvn clean package"
            }
        }
        stage('Build Image') {
            steps {
                //sh
                bat "docker build -t=ravisharma2780/selenium-docker1 ."
            }
        }
        stage('Push Image') {
            steps {
			    withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'pass', usernameVariable: 'user')]) {
                    //sh
			        bat "docker login --username=${user} --password=${pass}"
			        bat "docker push ravisharma2780/selenium-docker1:latest"
			    }
            }
        }
    }
}