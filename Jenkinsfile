pipeline {
  agent none
  stages {
    stage('Fetch dependencies') {
      steps {
        sh 'yarn'
      }
    }
    
    stage('Unit Test') {
      agent {
        docker 'circleci/node:9.3-stretch-browsers'
      }
      steps {
        sh 'yarn test:ci'
      }
    }
    stage('E2E Test') {
      agent {
        docker 'circleci/node:9.3-stretch-browsers'
      }
      steps {
        sh 'mkdir -p reports'
        sh 'yarn e2e:pre-ci'
        sh 'yarn e2e:ci'
        sh 'yarn e2e:post-ci'
      }
    }
    stage('Compile') {
      agent {
        docker 'circleci/node:9.3-stretch-browsers'
      }
      steps {
        sh 'yarn build:prod'
      }
    }
    stage('Build and Push Docker Image') {
      agent any
      environment {
        DOCKER_PUSH = credentials('docker_push')
      }
      steps {
        sh 'docker build -t $DOCKER_PUSH_URL/frontend .'
        sh 'docker login -u $DOCKER_PUSH_USR -p $DOCKER_PUSH_PSW $DOCKER_PUSH_URL'
        sh 'docker push $DOCKER_PUSH_URL/frontend'
      }
    }
  }
}