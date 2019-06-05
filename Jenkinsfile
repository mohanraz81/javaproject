// Powered by Infostretch 

timestamps {

node () {

	stage ('javaproject - Checkout') {
 	 checkout([$class: 'GitSCM', branches: [[name: '*/dev-1.0']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '05907e5d-53e9-49e1-8deb-45ab16ecb06c', url: 'https://github.com/mohanraz81/javaproject.git']]]) 
	}
	stage ('javaproject - Build') {
 	
// Unable to convert a build step referring to "hudson.plugins.build__timeout.BuildTimeoutWrapper". Please verify and convert manually if required.
// Unable to convert a build step referring to "hudson.plugins.timestamper.TimestamperBuildWrapper". Please verify and convert manually if required.		// Maven build step
	withMaven(maven: 'maven-3.5.4') { 
 			if(isUnix()) {
 				sh "mvn -f test/pom.xml install cobertura:cobertura -D cobertura.reports.format=xml " 
			} else { 
 				bat "mvn -f test/pom.xml install cobertura:cobertura -D cobertura.reports.format=xml " 
			} 
 		}
		archiveArtifacts allowEmptyArchive: false, artifacts: 'test/target/*.jar', caseSensitive: true, defaultExcludes: true, fingerprint: false, onlyIfSuccessful: false
		// JUnit Results
		junit 'test/target/surefire-reports/*.xml' 
	}
}
}
