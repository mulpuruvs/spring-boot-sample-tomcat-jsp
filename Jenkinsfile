pipeline{
    agent any
     tools{
        maven 'maven'
     }
    stages{
    	stage('Build'){
    		steps {
                echo 'Running build automation'
                sh 'mvn -B -DskipTests clean package'
                archiveArtifacts artifacts: 'target/spring-boot-sample-tomcat-jsp*.war'
    		}
    	}
        //stage('JUnit Test') {
         //   steps {
         //       sh "mvn test"
         //     }
       // }
       /* stage('SonarQube Code Analysis') {
            steps {
                sh "mvn sonar:sonar -Dsonar.host.url=http://54.185.178.109:30002"
              }
        } */
        stage('Build Docker Image'){
    		steps{
    			script{
    				app = docker.build("mulpuruvsdockerid/monitoring-app")
    				app.inside{
    				//sh 'echo $(curl http://54.212.233.123:30001)'
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
        stage('Deploy kubernetes'){
          steps {
              kubernetesDeploy(
                kubeconfigId: 'kubeconfig',
                configs: 'application.yaml',
                enableConfigSubstitution: false)
                //echo 'App url: http://54.212.233.123:31008/'
          }
        }
    }
}
