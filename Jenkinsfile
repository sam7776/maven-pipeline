pipeline{
    agent any
    tools{
        maven "mvn"
    }
    environment{
        bno = "${env.BUILD_NUMBER}"
        gitUrl = "${env.GIT_URL}"
    }
    triggers{
        pollSCM('* * * * * *')
    }
    stages{
        stage('Git Checkout'){
            steps{
                sh """
                    echo "Starting Git Checkout...
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
                mvn clean package
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
    }
}