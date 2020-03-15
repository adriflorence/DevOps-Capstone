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
        withCredentials(bindings: [usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'dockerhubuser', passwordVariable: 'dockerhubpwd')]) {
          sh '''docker login -u ${dockerhubuser} -p ${dockerhubpwd}
            docker tag adriflorence/capstone adriflorence/capstone:latest
            docker push adriflorence/capstone:latest'''
        }
      }
    }

    stage('Deploy to Kubernetes')  {
      steps {
        withAWS(region: 'us-west-2', credentials: 'aws-credential') {
          sh 'aws eks update-kubeconfig --name Cluster-Capstone-eks'
	        sh 'kubectl get node'
          sh 'kubectl apply -f deployment/deployment.yaml'
          sh 'kubectl apply -f deployment/service.yaml'
          sh 'kubectl get all -o wide'
        }
      }
    }

  }
}
