pipeline{
    
    agent any
    
    tools {
  terraform 'terraform-14'
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
            }}
            stage('terraform destroy'){
            steps{
                sh 'terraform destroy --auto-approve'
            }
            
        }
    }

}