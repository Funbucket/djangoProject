pipeline {
    agent any

    environment {
        imagename = "ouchcs/django-jenkins-server"
        registryCredential = 'docker'
        dockerImage = ''
    }

    stages {
        stage('Bulid Docker') {
          steps {
            echo 'Bulid Docker'
            script {
                dockerImage = docker.build imagename
            }
          }
          post {
            failure {
              error 'This pipeline stops here...'
            }
          }
        }

        stage('Push Docker') {
          steps {
            echo 'Push Docker'
            script {
                docker.withRegistry( '', registryCredential) {
                    dockerImage.push() 
                }
            }
          }
          post {
            failure {
              error 'This pipeline stops here...'
            }
          }
        }
        
        stage('Docker Run') {
            steps {
                echo 'Pull Docker Image & Docker Image Run'
                sshagent (credentials: ['ssh']) {
                    sh "ssh -o StrictHostKeyChecking=no ubuntu@3.34.42.251 'docker pull ouchcs/django-jenkins-server'" 
                    sh "ssh -o StrictHostKeyChecking=no ubuntu@3.34.42.251 './deploy.sh'"
                }
            }
        }
    }
}
