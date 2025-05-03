pipeline{
    agent any

    environment{
        STAGE="PROD"
        USER="DEV"
        PASS=credentials('PASS')
    }

    stages{
        stage('Git checkout code') {
            steps {
                git 'https://github.com/rahultiple31/spring-boot-war-example-jenkins.git'
            }
        }

        stage("environment"){
            steps{
                sh '''
                echo "$STAGE"
                echo "uaername $USER and password $PASS"
                '''
            }
        }

        stage("build code"){
            steps{
                sh '''
                mvn clean package
                echo "$BUILD_ID"
                '''
            }
        }

        stage("test"){
            steps{
                 sh 'mvn test'
            }

            post { 
                always { 
                    echo "test done"
                }
            }

        }

        stage("build docket images"){
            steps{
                 sh '''
                 docker rmi -f app:latest
                 docker build -t app .
                 '''
            }
        }

        stage("docker push"){
            steps{
                 
                 withCredentials([string(credentialsId: 'docker_hub', variable: 'docker_hub')]) {
                 sh 'docker login -u rahultipledocker -p ${docker_hub}' 
                }
                 sh '''
                 docker tag app rahultipledocker/nov-aap:latest
                 docker push rahultipledocker/nov-aap:latest
                 docker rmi rahultipledocker/nov-aap:latest
                 docker logout
                 '''                 
            }
        }

        stage("pull docker image and deploy on local machine"){
            steps{
                 
                 withCredentials([string(credentialsId: 'docker_hub', variable: 'docker_hub')]) {
                 sh 'docker login -u rahultipledocker -p ${docker_hub}' 
                }
                 sh '''
                 docker pull rahultipledocker/nov-aap:latest
                 docker run -itd --name web-app rahultipledocker/nov-aap:latest /bin/bash
                 docker logout
                 '''                 
            }
        }

    }
}
