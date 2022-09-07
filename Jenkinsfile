
pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/QA']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ponnamnagesh/Koffeluvaws.git']]])            
           
          }
        }    
        stage ("Terraform Init") {
            steps {
                sh ('terraform init') 
            }
        }
        stage ("Terraform Plan") {
            steps {
                sh ('terraform plan') 
            }
        }
        stage ("Terraform Action") {
            steps {
                echo "Terraform action is --> ${action}"
                sh ('terraform ${action} --auto-approve') 
           }
        }
        stage ('Build') {
            steps {
                script {
                    input message: 'Proceed?', ok: 'Yes', submitter: 'admin'
                }
                script {
                    dir('./modules/app') {
                        sh 'mvn clean install' 
                    }
                }
      }
        }
    // Building Docker images
    stage ('Building New Docker Image') {
            steps {
                script {
                    input message: 'Proceed?', ok: 'Yes', submitter: 'admin'
                }
                script {
                    dir('./modules/app') {
                        //  Building new image
                        sh 'docker image build -t ecs-koffee-luv-home:latest .'
                        sh 'aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 004738182300.dkr.ecr.us-east-2.amazonaws.com'
                        //sh 'docker build -t ecs-koffee-luv-home .'
                        //sh 'docker tag latest:$BUILD_NUMBER'
                        //sh 'docker tag latest[:$BUILD_NUMBER]'
                        sh 'docker tag ecs-koffee-luv-home:latest 004738182300.dkr.ecr.us-east-2.amazonaws.com/ecs-koffee-luv-home:latest'
                        echo "Image successfully built"
                    }
                }
                post {
                aborted{
                    echo "stage has been aborted"
                }
                }
            }
        }
   
    // Uploading Docker images into AWS ECR
    stage('Pushing to ECR') {
     steps{  
        script {
                    input message: 'Proceed?', ok: 'Yes', submitter: 'admin'
                }
         script {
                sh 'aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 004738182300.dkr.ecr.us-east-2.amazonaws.com'
                sh 'docker push 004738182300.dkr.ecr.us-east-2.amazonaws.com/ecs-koffee-luv-home:latest'
         }
         post {
                aborted{
                    echo "stage has been aborted"
                }
            }    
        }
      }
    }
}
