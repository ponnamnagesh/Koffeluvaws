
pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/dev']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ponnamnagesh/Koffeluvaws.git']]])            
           
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
    // Building Docker images
    stage('Building image') {
      steps{
        script {
          //dockerImage = docker.build registry 
          sh 'cd modules/app'
          sh 'docker build -t ecs-koffee-luv-home .'
          sh 'docker tag ecs-koffee-luv-home:latest 004738182300.dkr.ecr.us-east-2.amazonaws.com/ecs-koffee-luv-home:latest'
        
        }
      }
    }
   
    // Uploading Docker images into AWS ECR
    stage('Pushing to ECR') {
     steps{  
         script {
                sh 'aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 004738182300.dkr.ecr.us-east-2.amazonaws.com'
                sh 'docker push 004738182300.dkr.ecr.us-east-2.amazonaws.com/ecs-koffee-luv-home:latest'
         }
        }
      }
    }
}
