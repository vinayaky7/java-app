@Library('jenkins_shared_lib') _

pipeline{

    agent any

    parameters{

        choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/Destroy')
        #string(name: 'ImageName', description: "name of the docker build", defaultValue: 'javapp')
        #string(name: 'ImageTag', description: "tag of the docker build", defaultValue: 'v1')
        #string(name: 'DockerHubUser', description: "name of the Application", defaultValue: 'vikashashoke')
    }
    
    stages{
         
        stage('Git Checkout'){
        when { expression {  params.action == 'create' } }
            steps{
                script{
                    
                    gitCheckout(
                    branch: "main",
                    url: "https://github.com/yvinvijay/mrdevops_java_app.git"
            )
                }
            }
        }

        stage('Unit Test maven'){
        when { expression {  params.action == 'create' } } 
            steps{
               script{
                   
                   mvnTest()
               }
            }
        }
        
        stage('Integration Test maven'){
        when { expression {  params.action == 'create' } } 
            steps{
               script{
                   
                   mvnIntegrationTest()
               }
            }
        }

        stage('Static code analysis: Sonarqube'){
         
            steps{
               script{
                   
                   
                   statiCodeAnalysis()
               }
            }
        }

    }
}
