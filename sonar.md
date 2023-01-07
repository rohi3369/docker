 stage('SonarQube analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh "./gradlew sonarqube"
                }
            }
        }
        stage("Quality gate") {
            steps {
                waitForQualityGate abortPipeline: true
            }
        }




def:
def RES = "reddy.jfrog.io/brep-dev/"
                    def appname = test
                    if (gitBranch.contains('master')) {
                    /* groovylint-disable-next-line EmptyIfStatement, NestedBlockDepth */
                        docker build image -t {RES}-{appname}:{Buildnumber}
                        //reddy.jfrog.io/brep-dev/test:8
                    }else if (gitBranch.contains('feature/')) {
                        feature/lambda-test
                        env.extractbranch = gitBranch.sampleprinter("/")[0].toLowerCase()
                        env.extractbranch1 = gitBranch.sampleprinter("/")[1].toLowerCase()
                        docker build image -t {RES}-{appname}:{extractbranch}-{extractbranch1}-{Buildnumber}
                        //reddy.jfrog.io/brep-dev/test:feature-lambda-test-8
                    }else {
                        echo "image not build"
                    } 