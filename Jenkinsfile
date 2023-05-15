pipeline {
    agent any
    stages {
        stage('Build') {
            environment{
                version = "1.0.0"
            }
            steps {
                script {
                    bat """
                    dir
                    docker build -f Dockerfile . --tag SWE5998-${VER}
                    """
                }
            }   
        }    
    }
    post{
        failure{
            slackSend( channel: "#Jenkins", token: "slack_webhook token", color: "good", message: "${custom_msg1()}")
        }
        success{
            slackSend( channel: "#Jenkins", token: "slack_webhook token", color: "good", message: "${custom_msg2()}")
        }
    }
}


def custom_msg1()
{
  def JENKINS_URL= "localhost:8080"
  def JOB_NAME = env.JOB_NAME
  def BUILD_ID= env.BUILD_ID

  def JENKINS_LOG= " FAILED: Job [${env.JOB_NAME}] Logs path: http://localhost:8080/job/SWE5998/job/main/${BUILD_ID}/consoleText"
  return JENKINS_LOG

}

def custom_msg2()
{
  def JENKINS_URL= "localhost:8080"
  def JOB_NAME = env.JOB_NAME
  def BUILD_ID= env.BUILD_ID

  def JENKINS_LOG= " PASSED: Job [${env.JOB_NAME}] Logs path: http://localhost:8080/job/SWE5998/job/main/${BUILD_ID}/consoleText"
  return JENKINS_LOG

}
