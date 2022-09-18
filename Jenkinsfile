pipeline {

	agent any

	environment {
		AWS_ACCESS_KEY_ID     = credentials('Access-key-ID')
  		AWS_SECRET_ACCESS_KEY = credentials('Secret-access-key')
		ARTIFACT_NAME = 'dui.json'
		AWS_S3_BUCKET = 'finalproject-duihua'
		AWS_EB_APP_NAME = 'FinalProject-DuiHua'
        AWS_EB_ENVIRONMENT_NAME = 'Finalprojectduihua-env'
        AWS_EB_APP_VERSION = "${BUILD_ID}"
	}

	stages {

		stage('Build') {

			steps {
				sh 'docker build -t dohahq/duihua:3.0 .'
			}
		}

		stage('Login') {

			steps {
				sh 'docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push dohahq/duihua:3.0'
			}
		}

        stage('Deploy') {
            steps {
                sh 'aws configure set region us-east-1	'
                sh 'aws elasticbeanstalk create-application-version --application-name $AWS_EB_APP_NAME --version-label $AWS_EB_APP_VERSION --source-bundle S3Bucket=$AWS_S3_BUCKET,S3Key=$ARTIFACT_NAME'
                sh 'aws elasticbeanstalk update-environment --application-name $AWS_EB_APP_NAME --environment-name $AWS_EB_ENVIRONMENT_NAME --version-label $AWS_EB_APP_VERSION'
            }
	}
    }
	post {
		always {
			sh 'docker logout'
		}
	}

}
