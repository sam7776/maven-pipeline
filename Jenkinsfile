pipeline {
    agent any

    // Environment variables to store build-specific and project-specific information
    tools{
        maven 'mvn'
    }
    environment {
        bno = "${env.BUILD_NUMBER}" // Build number
        gitUrl = "${env.GIT_URL}"   // Git repository URL
        project = "Current Project is working fine and well" // Project description

        // username = credentials('uname') // Git username credential ID
        // password = credentials('upass') // Git password credential ID
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

        // stage("Env Variables") {
        //     steps {
        //         sh '''
        //             echo "Build number: ${bno}"
        //             echo "Git URL: ${gitUrl}"
        //             echo "Project description: ${project}"
        //             // echo "Git username: ${uname}" // Display the Git username
        //             // echo "Git password: ${upass}" // Display the Git password
        //         '''
        //     }
        // }

        // Stage 2: Build
        stage('Build') {
            steps {
                echo "Building the project..."
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
                // echo "here is username ${username} and  password ${password}" // Display the username and password
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

        // stage("Clean Up all Docker Data"){
        //     steps{
        //         echo "Cleaning up all data..."
        //         sh """
        //             docker rm -f my_app
        //             docker rmi -f nishantakm/japp:latest
        //             docker logout
        //         """
        //     }
        //     post {
        //         success {
        //             echo "Clean up completed successfully for build number ${bno}"
        //         }
        //         failure {
        //             echo "Clean up failed for build number ${bno}"
        //         }
        //     }
        // }

        stage('Docker Build'){
            steps{ 
                
                sh """
                    echo "Building Docker image..."
                    docker build -t nishantakm/japp:latest .
                """
            }
            post {
                success {
                    echo "Docker build completed successfully for build number ${bno}"
                }
                failure {
                    echo "Docker build failed for build number ${bno}"
                }
            }
        }

        stage("Docker push and Deploy"){
            steps{
                // input message: 'Do you want to push the Docker image?' // Prompt user for confirmation to push Docker image
                echo "Pushing Docker image to Docker Hub..."
                // withCredentials([string(credentialsId: 'uname', variable: 'Duname'), string(credentialsId: 'upass', variable: 'Dupass')])
                withCredentials([usernamePassword(credentialsId: 'docker-id-pass', passwordVariable: 'Dupass', usernameVariable: 'Duname')]) {
                    sh """
                        docker login -u ${Duname} -p ${Dupass}
                        docker push nishantakm/japp:latest
                    """
                }
            }
            post {
                success {
                    echo "Docker image pushed successfully for build number ${bno}"
                }
                failure {
                    echo "Docker push failed for build number ${bno}"
                }
            }
        }

        stage('Deploy / Docker Run'){
            steps{
                sh """
                    echo "Running Docker container..."
                    docker run -itd --name my_app nishantakm/japp:latest /bin/bash
                """
            }
            post {
                success {
                    echo "Docker container started successfully for build number ${bno}"
                }
                failure {
                    echo "Docker container start failed for build number ${bno}"
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
            subject: "Build ${bno} -  Success",
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