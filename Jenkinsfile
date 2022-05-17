
pipeline {
  browsers: ['ChromeHeadlessNoSandbox'],
  agent {
    docker { image 'node:latest' }
  }
  stages {
    stage('Install') {
      steps { sh 'npm install' }
    }

    stage('Test') {
            steps { sh 'npm run-script test' }
      }

    stage('Build') {
      steps { sh 'npm run-script build' }
    }
  }
}
