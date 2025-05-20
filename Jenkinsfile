pipeline{
    agent any
    tools{
        maven "mvn"
    }
    environment{
        bno = ${env.BUILD_NUMBER}
        gitUrl = "${env.GIT_URL}"
    }
    triggers{
        pollSCM('* * * * * *')
    }
    stages{
        stage('Git Checkout'){
            steps{
                script{
                    checkout scm
                }
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
    }
}