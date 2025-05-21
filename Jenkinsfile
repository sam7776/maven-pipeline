pipeline {
    agent any

    // Environment variables to store build-specific and project-specific information
    environment {
        bno = "${env.BUILD_NUMBER}" // Build number
        gitUrl = "${env.GIT_URL}"   // Git repository URL
        project = "Current Project is working fine and well" // Project description
        unpass = "${env.IdPass}"
    }

    // Trigger to poll the SCM for changes every minute
    triggers {
        pollSCM('* * * * *') // Poll SCM every minute
    }

    stages {
        // Stage 1: Git Checkout
        stage('Git Checkout') {
            steps {
                sh """
                    echo "Starting Git Checkout..."
                """
            }
            post {
                success {
                    echo "Git Checkout completed successfully for build number ${bno} and git URL is ${gitUrl}"
                }
                failure {
                    echo "Git Checkout failed for build number ${bno} and git URL is ${gitUrl}"
                }
            }
        }

        // Stage 2: Build
        stage('Build') {
            steps {
                sh "mvn clean package" // Build the project using Maven
            }
            post {
                success {
                    echo "Build completed successfully for build number ${bno}"
                }
                failure {
                    echo "Build failed for build number ${bno}"
                }
            }
        }

        // Stage 3: Test
        stage('Test') {
            steps {
                echo "here is username and password ${unpass}" // Display the username and password
                // input message: 'Do you want to run tests?' // Prompt user for confirmation to run tests
                echo "Running tests..."
                sh "mvn test" // Run tests using Maven
            }
            post {
                success {
                    echo "Tests completed successfully  for build number ${bno}"
                }
                failure {
                    echo "Tests failed for build number ${bno}"
                }
            }
        }

        // Stage 4: Deploy
        // stage('Deploy') {
        //     steps {
        //         sh "java -jar /var/lib/jenkins/workspace/maven-project-D-Pipeline/target/hello-world-0.0.1-SNAPSHOT.war" // Deploy the application
        //     }
        //     post {
        //         success {
        //             echo "Deployment completed successfully for build number ${bno}"
        //         }
        //         failure {
        //             echo "Deployment failed for build number ${bno}"
        //         }
        //     }
        // }

    }

    // Post actions to be executed after the pipeline completes
    post {
        always {
            echo "${project}" // Always display the project description
        }
        success {
            // Send email notification on successful build
            mail to: 'snnshnt@gmail.com,niishantakm@gmail.com,akmeshram1971@gmail.com',
            subject: "Build ${bno} - Success",
            body: "Build ${bno} was successful. Check console output at ${env.BUILD_URL}"
        }
        failure {
            // Send email notification on failed build
            mail to: 'snnshnt@gmail.com,niishantakm@gmail.com,akmeshram1971@gmail.com',
            subject: "Build ${bno} - Failed",
            body: "Build ${bno} failed. Check console output at ${env.BUILD_URL}"
        }
    }
}