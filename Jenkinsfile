pipeline {
  agent any

  environment {
    RELEASE_IMAGE = 'registry.felix.com/platform/service-registry-center'
    IMAGE_VERSION = '1.0'
  }
  
  stages {
    stage('compile source code') {
        steps {
          echo 'start to compile source code......'
          sh 'mvn clean package'
          echo 'complete source code compiling......'
        }
    }

    stage('build image') {
      steps {
        echo 'start to build image......'
        sh 'docker build -t ${RELEASE_IMAGE}:${IMAGE_VERSION} -f Dockerfile .'
        echo 'complete  ${RELEASE_IMAGE}:${IMAGE_VERSION} image building and start to push the image......'
        sh 'docker push ${RELEASE_IMAGE}:${MAGE_VERSION}'
        echo 'completed the image push'
      }
    }
  }

  post {
      always {
          deleteDir()
      }
      success {
          echo 'Success.'
      }
      unstable {
          echo 'It is unstable!'
      }
      failure {
          echo 'Failed!!!'
      }
      changed {
          echo 'Things were different before...'
      }
  }
}
