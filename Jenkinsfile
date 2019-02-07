pipeline{
    agent any
     tools{
        maven 'maven'
        //jdk 'java1.8.0'
       }
    stages{
    	stage('Build'){
    		steps {
                echo 'Running build automation'
                sh 'mvn clean package'
                archiveArtifacts artifacts: 'target/spring-boot-sample-tomcat-jsp*.war'
    		}
    	}
    	stage('Build Docker Image'){
    		steps{
    			script{
    				app = docker.build("mulpuruvsdockerid/monitoring-app")
    				app.inside{
    				sh 'echo $(curl http://54.121.95.266:30001)'
    				}
    			}
    		}
    	}
    	stage('Push Docker Image'){
    		steps{
    			script{
    				docker.withRegistry('https://registry.hub.docker.com', 'DocCred'){
    					app.push("${env.BUILD_NUMBER}")
    					app.push("latest")
    				}
    			}
    		}
    	}
    }
}
