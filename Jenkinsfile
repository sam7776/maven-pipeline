pipeline{
    agent any
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
                    docker build -t spring-boot-app .
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
        stage("Deploy"){
            steps{
                sh '''
                    java -jar /var/lib/jenkins/workspace/mvn-project/target/hello-world-0.0.1-SNAPSHOT.war
                '''
            }
            post{
                success{
                    echo "Application deployed successfully"
                }
                failure{
                    echo "Application deployment failed"
                }

            }

        }

    }
    post{
        success{
            mail to: 'snnshnt@gmail.com',
            subject: "Build Successful- ${JOB_NAME} #${BUILD_NUMBER}",
            body: """
            body: "The build was successful. Check the console output at ${env.BUILD_URL}."
        }
        failure{
            mail to: 'snnshnt@gmail.com',
            subject: "Build Failed - ${JOB_NAME} #${BUILD_NUMBER}",
            body: """
            Job: ${JOB_NAME},
            Build Number: ${BUILD_NUMBER},
            Build URL: ${BUILD_URL},
            Workspace: ${WORKSPACE},
            Jenkins URL: ${JENKINS_URL},
            Build Cause: ${BUILD_CAUSE},
            Build User: ${BUILD_USER_ID} (${BUILD_USER}),
            """
        }
    }  

}