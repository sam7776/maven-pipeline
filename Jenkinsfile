pipeline{
    agent any
    stages{
        stage("git checkout"){
            steps{
                git 'https://github.com/sam7776/maven-project-tutorial.git'
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
