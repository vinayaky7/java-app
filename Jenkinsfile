@Library('jenkins_shared_lib') _

pipeline{

    agent any

    
    stages{
         
        stage('Git Checkout'){
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
         
            steps{
               script{
                   
                   mvnTest()
               }
            }
        }
        
        stage('Integration Test maven'){
         
            steps{
               script{
                   
                   mvnIntegrationTest()
               }
            }
        }
    }
}
