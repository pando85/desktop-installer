#!groovy

node('dockerpython') {

    stage('Checkout'){
        checkout scm
    }

	stage('Check'){
	    sh 'make check'
	}

    stage('Test with molecule'){
	    sh 'make test'
    }
}
