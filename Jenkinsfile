#!groovy​

  stage('checkout') {
    node('master') {
      checkout scm
    }
  }

  stage('install') {
    node('master') {
      docker.image('node:6.9.0').inside{
        sh "npm install"
	stash 'installed-app'
      }
    }
  }

  stage('tests') {
    parallel 'backend': {
      node('master') {
        docker.image('maven:3.3.9-jdk-8').inside{
          sh 'mvn test'
        }
      }
      }, 'frontend': {
        node('master') {
          docker.image('node:6.9.0').inside{
	    unstash 'installed-app'
            sh "npm install -g gulp && gulp test"
          }
        }
      }
    }

  stage('packaging') {
    node('master') {
      docker.image('maven:3.3.9-jdk-8').inside{
	// I have to remove the previously installed modules to avoid a strange rights error
        sh "rm-rf node_modules && mvn package -Pprod -DskipTests"
      }
    }
  }
