pipeline{
    agent any
    tools{
        maven "mvn"
    }
    environment{
        
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
                always{
                    echo "Git Checkout completed"
                }
            }
        }
    }
}