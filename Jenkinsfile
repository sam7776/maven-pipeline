pipeline{
    agent any
    stages{
        stage("git checkout"){
            steps{
                git url 'https://github.com/sam7776/maven-pipeline.git'
            }
        }
        stage("build"){
            steps{
                sh '''
                    mvn clean package
                '''
            }
        }
        stage("test"){
            steps{
                sh '''
                    mvn test
                '''
            }
        }
    }
}