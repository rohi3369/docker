pipeline {
    agent {label 'mvn'}
    triggers { pollSCM('* * * * *') }
    stages {
        stage ('vcs') {
            steps{
            git branch : 'main', 
            url: 'https://github.com/rohi3369/spring-petclinic.git'
            }
        }
        // stage("Quality gate") {
        //     steps {
        //         waitForQualityGate abortPipeline: true
        //     }
        // }
        stage ('Artifactory config') {
           steps{
                rtMavenDeployer (
                    id: "MAVEN_DEPLOYER",
                    serverId: "Jfrogartifact",
                    releaseRepo: 'sai-libs-release-local',
                    snapshotRepo: 'sai-libs-snapshot-local' 
                    )
            }
        }
        stage ('Exec Maven') {
             steps {
                 rtMavenRun (
                     tool: "MAVEN_TOOL", 
                     pom: 'pom.xml',
                     goals: 'clean package',
                       deployerId: "MAVEN_DEPLOYER"
                )
             }
         }
        stage ('Publish Build Info') {
            steps {
                rtPublishBuildInfo (
                    serverId: "Jfrogartifact"
                )
            }
        }
        stage('SonarQube analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh "mvn package sonar:sonar"
                }
            }
        }
         stage('docker image build'){
            steps{
                sh """
                docker image build -t spc:$env.BUILD_ID .
                docker tag spc:1.0 soma3369.jfrog.io/spcimage/spc:$env.BUILD_ID
                docker push soma3369.jfrog.io/spcimage/spc:$env.BUILD_ID """  
            }
        }
    } 
    // post {
    //    success{
    //         mail subject: 'Build success', 
    //              body: 'Build success', 
    //              to: 'sairohith77@gmail.com'
    //             }
    //     failure {
    //         mail subject: 'Build Failed', 
    //              body: 'Build Failed', 
    //              to: 'sairohith77@gmail.com'
        
    //             }    
    //     }   
}    
