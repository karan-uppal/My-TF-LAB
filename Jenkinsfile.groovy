pipeline{
    
    agent any
    tools{
    tool name: 'terraform-14', type: 'terraform'
    }
    stages{
        stage('git checkout'){
           steps{ 
            git 'https://github.com/karan-uppal/My-TF-LAB.git'
           }
        }
        stage('terraform init'){
            steps{
                sh 'terraform init'
            }}
        stage('terraform apply'){
            steps{
                sh 'terraform apply --auto-approve'
            }
            
        }
    }

}