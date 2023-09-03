@Library('jenkins_shared_lib') _

pipeline{

    agent any

    parameters{

        choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/Destroy')
        string(name: 'ImageName', description: "name of docker build", defaultValue: 'javapp')
        string(name: 'ImageTag', description: "tag of docker build", defaultValue: 'v1')
        string(name: 'DockerHubUser', description: "name of Aapplication", defaultValue: 'vinayakyadav')

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
        // when { expression {  params.action == 'create' } } 
            steps{
               script{
                   
                   mvnTest()
               }
            }
        }
        
        stage('Integration Test maven'){
        // when { expression {  params.action == 'create' } } 
            steps{
               script{
                   
                   mvnIntegrationTest()
               }
            }
        }

        // stage('Static code analysis: Sonarqube'){
        //  when { expression {  params.action == 'create' } }
        //     steps{
        //        script{
                   
        //            def SonarQubecredentialsId = 'sonarqube-api'
        //            statiCodeAnalysis(SonarQubecredentialsId)
        //        }
        //     }
        // }

        // stage('Quality gate status check: Sonarqube'){
        // when { expression {  params.action == 'create' } } 
        //     steps{
                
        //        script{
                   
        //            def SonarQubecredentialsId = 'sonarqube-api'
        //            QualityGateStatus(SonarQubecredentialsId)
        //        }
        //     }
        // }

        stage('Maven build: Sonarqube'){
        // when { expression {  params.action == 'create' } } 
            steps{
                
               script{
                   
                   
                   mvnBuild()
               }
            }
        }

        stage('Docker image build'){
        // when { expression {  params.action == 'create' } } 
            steps{
                
               script{
                   
                   
                   dockerBuild(dockerBuild("${params.ImageName}","${params.ImageTag}","${params.DockerHubUser}"))
               }
            }
        }

        stage('Docker image scan: trivy'){
        // when { expression {  params.action == 'create' } } 
            steps{
                
               script{
                   
                   
                   dockerBuild(dockerBuild("${params.ImageName}","${params.ImageTag}","${params.DockerHubUser}"))
               }
            }
        }

    }
}

