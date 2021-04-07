pipeline {
  agent any
  environment {
        registry = 'devOpsTargil/jenkins-test'
        registryCredential = 'dockerhub'
        dockerImage = ''
  }
  stages {
    stage('Build') {
      agent any
      steps {
        git(url: 'https://github.com/jenkins-docs/simple-node-js-react-npm-app.git', branch: 'master')
        withMaven() {
          sh 'mvn clean install -DskipTests -Dmaven.test.skip=true'
        }

      }
    }

    stage('Test') {
      steps {
        git 'https://github.com/Rodion/ComeAndEat.git'
        withMaven() {
          sh 'mvn test'
        }

      }
    }
    stage('Docker') {
      agent {
          docker {
              image 'docker'
          }
      }
      steps {
          sh 'docker --version'
      }
    }
    stage('Building the image') {
        steps{
            script {
                dockerImage = docker.build registry + ":$BUILD_NUMBER"
            }
              echo "Build number #${env.BUILD_NUMBER}"
        }
    }
    stage('Deploy the image') {
        steps{
            script {
                docker.withRegistry( '', registryCredential ) {
                    dockerImage.push()
                }
            }
        }
    }
    }
  }
}
