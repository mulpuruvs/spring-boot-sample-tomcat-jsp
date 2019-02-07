pipeline{
    agent any
    stages{
    	stage('Build'){
    		steps {
                echo 'Running build automation'
                sh 'mvn clean install'
                archiveArtifacts artifacts: 'target/spring-boot-sample-tomcat-jsp*.jar'
    		}
    	}
    	stage('Build Docker Image'){
    		steps{
    			script{
    				app = docker.build("mahi4847/monitoring-app")
    				app.inside{
    				sh 'echo $(curl http://54.191.133.216:8080)'
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
