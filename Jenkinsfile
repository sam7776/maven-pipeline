pipeline{
    agent any
    environment{
        bno = "${env.BUILD_NUMBER}"
        gitUrl = "${env.GIT_URL}"
        project = "Current Project is working fine and well"
    }
    triggers{
        pollSCM('* * * * *')
    }
    stages{
        stage('Git Checkout'){
            steps{
                sh """
                    echo "Starting Git Checkout..."
                """
            }
            post{
                success{
                    echo "Git Checkout completed successfully for build number ${bno} and git URL is ${gitUrl}"
                }
                failure{
                    echo "Git Checkout failed for build number ${bno} and git URL is ${gitUrl}"
                }
            }
        }
        stage('Build'){
            steps{
                sh "mvn clean package"
            }
            post{
                success{
                    echo "Build completed successfully for build number ${bno}"
                }
                failure{
                    echo "Build failed for build number ${bno}"
                }
            }
        }
        stage('Test'){
            steps{
                sh "mvn test"
            }
            post{
                success{
                    echo "Tests completed successfully for build number ${bno}"
                }
                failure{
                    echo "Tests failed for build number ${bno}"
                }
            }
        }
    }
    post{
        always{
            echo "${project}"
        }
        success{
            mail to: 'snnshnt@gmail.com,niishantakm@gmail.com,akmeshram1971@gmail.com',
            subject: "Build ${bno} - Success",
            body: "Build ${bno} was successful. Check console output at ${env.BUILD_URL}"
        }
        failure{
            mail to: 'snnshnt@gmail.com,niishantakm@gmail.com,akmeshram1971@gmail.com',
            subject: "Build ${bno} - Failed",
            body: "Build ${bno} failed. Check console output at ${env.BUILD_URL}"
        }
    }
}