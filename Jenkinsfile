pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('docker-access-key')
  }
  stages {
    stage('Build') {
      steps {
        bat 'docker build -t akt231/jenkins-docker-hub .'
      }
    }
    stage('Login') {
      steps {
        bat 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        bat 'docker push akt231/jenkins-docker-hub'
      }
    }
  }
  post {
    always {
      bat 'docker logout'
    }
  }
}