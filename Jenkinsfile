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
            email to: 'snnshnt@gmail.com',
            subject: "Build Successful",
            body: "The build was successful. Check the console output at ${env.BUILD_URL}."
        }
        failure{
            email to: 'snnshnt@gmail.com',
            subject: "Build Failed",
            body: """
            ${JOB_NAME} -${WORKSPACE},   
            ${JOB_NAME} -${JENKINS_URL},
            ${JOB_NAME} - ${BUILD_ID}, 
            ${JOB_URL} - ${BUILD_NUMBER},
            ${JOB_NAME} - ${BUILD_URL},
            ${JOB_NAME} - ${BUILD_TIMESTAMP},
            ${JOB_NAME} - ${BUILD_DISPLAY_NAME},
            ${JOB_NAME} - ${BUILD_CAUSE},
            ${JOB_NAME} - ${BUILD_USER_ID},
            ${JOB_NAME} - ${BUILD_USER},
            ${JOB_NAME} - ${BUILD_USER_EMAIL},
            ${JOB_NAME} - ${BUILD_USER_REMOTE_USER},
            ${JOB_NAME} - ${BUILD_USER_REMOTE_USER_EMAIL}
            """
        }
    }  

}