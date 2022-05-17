
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
          sh 'ng test --progress=false --watch false'
        }
    }

    stage('Build') {
      steps { sh 'npm run-script build' }
    }
  }
}
