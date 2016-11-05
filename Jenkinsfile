#!/usr/bin/env groovy

stage('checkout') {
  node('master') {
    checkout scm
  }
}

stage('install') {
  node('master') {
    docker.image('node:6.9.0').inside{
      sh "npm install"
    }
  }
}

stage('tests') {
  parallel 'backend': {
    node('master') {
      docker.image('3.3.9-jdk-8').inside{
        sh "./mvnw test"
      }
    }
    }, 'frontend': {
      node('master') {
        docker.image('node:6.9.0').inside{
          sh "gulp test"
        }
      }
    }
  }
}

stage('packaging') {
  node('master') {
    docker.image('3.3.9-jdk-8').inside{
      sh "./mvnw package -Pprod -DskipTests"
    }
  }
}
