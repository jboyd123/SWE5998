pipeline {
    agent any
    triggers {  
        pollSCM('') 
    }
    stages {
        stage('Build and Run') {
            environment{
                version = "1.0.0"
            }
            steps {
                script {
                    bat """
                    docker build -f Dockerfile . --tag localhost:5000/swe5998:${env.version}
                    docker run localhost:5000/swe5998:${env.version}
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
