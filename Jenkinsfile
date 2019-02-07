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
                archiveArtifacts artifacts: 'target/spring-boot-sample-tomcat-jsp*.jar'
    		}
    	}
    	stage('Build Docker Image'){
    		steps{
    			script{
    				app = docker.build("mahi4847/monitoring-app")
    				app.inside{
    				sh 'echo $(curl http://54.121.95.266:30001)'
    				}
    			}
    		}
    	}
    	stage('Push Docker Image'){
    		steps{
    			script{
    				docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_login'){
    					app.push("${env.BUILD_NUMBER}")
    					app.push("latest")
    				}
    			}
    		}
    	}
    }
}
