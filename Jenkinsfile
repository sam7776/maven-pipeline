pipeline{
    agent any
    stages{
        // stage("git checkout"){
        //     steps{
        //         git 'https://github.com/sam7776/maven-pipeline.git'
        //     }
        // }
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
        stage("docker build"){
            steps{
                sh '''
                    docker build -t spring-boot-app .
                '''
            }
        }
        // stage("Deploy"){
        //     steps{
        //         sh '''
        //             java -jar /var/lib/jenkins/workspace/mvn-project/target/hello-world-0.0.1-SNAPSHOT.war
        //         '''
        //     }
        // }
    }
}