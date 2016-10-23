node {

    stage('checkout') {
        checkout scm
    }

    stage('install') {
        node {
            docker.image('node:6.9.0').inside{
                sh "npm install"
            }
        }
    }

    stage('tests') {
        parallel 'backend': {
            docker.image('3.3.9-jdk-8').inside{
                sh "./mvnw test"
            }
        }, 'frontend': {
            docker.image('node:6.9.0').inside{
                sh "gulp test"
            }
        }
    }

    stage('packaging') {
        docker.image('3.3.9-jdk-8').inside{
            sh "./mvnw package -Pprod -DskipTests"
        }
    }
}
