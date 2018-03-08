#!groovy

node('docker') {

    stage('Checkout'){
        checkout scm
    }

	stage('Install dependencies'){
	    sh 'pip install -r requirements.txt'
	}

    stage('Test with molecule'){
	    sh 'cd roles/vscode && molecule test'
    }
}
