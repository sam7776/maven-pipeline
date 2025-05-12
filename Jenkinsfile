pipeline{
    agent any
    triggers{
        pollSCM('* * * * *')        
    }
    
    stages{
        // stage("git checkout"){
        //     steps{
        //         git 'https://github.com/sam7776/maven-pipeline.git'
        //     }
        // }
        stage("build"){
            steps{
                sh '''
                    mvn clean package
                '''
            }
            post{
                success{
                    echo "Build successful"
                }
                failure{
                    echo "Build failed"
                }
            }
        }
        stage("test"){
            steps{
                sh '''
                    mvn test
                '''
            }
            post{
                success{
                    echo "Tests passed"
                }
                failure{
                    echo "Tests failed"
                }
            }
        }
        stage("docker build"){
            steps{
                sh '''
                    docker rmi -f spring-boot-app
                    docker buil -t spring-boot-app .
                '''
            }
            post{
                success{
                    echo "Docker image built successfully"
                }
                failure{
                    echo "Docker image build failed"
                }
            }
        }
        // stage("Deploy"){
        //     steps{
        //         sh '''
        //             java -jar /var/lib/jenkins/workspace/mvn-project/target/hello-world-0.0.1-SNAPSHOT.war
        //         '''
        //     }
        //     post{
        //         success{
        //             echo "Application deployed successfully"
        //         }
        //         failure{
        //             echo "Application deployment failed"
        //         }

        //     }

        // }
    }
    post{
        always{
            echo "Pipeline completed"
        }
        success{
            mail to: 'snnshnt@gmail.com',
                 subject: "Build ${currentBuild.currentResult}: Job '${env.JOB_NAME}' (${env.BUILD_NUMBER})",
                 body: "Check console output at ${env.BUILD_URL} to view the results."
        }
        failure{
            mail to: 'snnshnt@gmail.com',
            subject: "Build ${currentBuild.currentResult}: Job '${env.JOB_NAME}' (${env.BUILD_NUMBER})",
            body: """
                Jenkins Job Failed!
                ==================
                Name: ${env.JOB_NAME}
                Build No: ${env.BUILD_NUMBER}
                Check: ${env.BUILD_URL}
                Workspace: ${env.WORKSPACE}
                Failed Stage: ${currentBuild.currentResult}
            """
        }
    }

}