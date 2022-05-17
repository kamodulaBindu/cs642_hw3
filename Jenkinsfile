
pipeline {
  agent {
    docker { image 'node:latest' }
  }
  stages {
    stage('Install') {
      steps { sh 'npm install' }
    }

    stage('Test') {
      withEnv(["CHROME_BIN=/usr/bin/chromium-browser"]) {
            steps { sh 'npm run-script test' }
      }
    }

    stage('Build') {
      steps { sh 'npm run-script build' }
    }
  }
}
