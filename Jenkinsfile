pipeline{
    agent any
    environment{
        bno = "${env.BUILD_NUMBER}"
        gitUrl = "${env.GIT_URL}"
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
                    echo "Git Checkout completed successfully for build number ${bno}"
                }
                failure{
                    echo "Git Checkout failed for build number ${bno}"
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
                
                sh "mksir hope"
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
            echo "Pipeline worked !!"
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