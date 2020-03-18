pipeline {
  agent any
  stages {
    stage('Lint HTML') {
      steps {
        sh 'pwd ls -lh'
        sh 'tidy -q -e index.html'
      }
    }

    stage('Build image') {
      steps {
        sh '''docker build -t adriflorence/capstone .
          docker image ls'''
      }
    }

    stage('Push Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'dockerhubpassword', usernameVariable: 'dockerhubuser')]) {
          sh '''docker login -u ${dockerhubuser} -p ${dockerhubpassword}
            docker tag adriflorence/capstone adriflorence/capstone:latest
            docker push adriflorence/capstone:latest'''
        }
      }
    }

    stage('Deploy To K8S Cluster'){
      steps {
        withAWS(credentials: 'aws-credentials', region: 'eu-west-2') {
          sh 'kubectl run capstone --image=adriflorence/capstone'
        }
      }
    }
  }
}
