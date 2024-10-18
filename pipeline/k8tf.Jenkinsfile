
pipeline{

    agent{
        kubernetes{
            yamlFile 'pipeline/templates/terraform.yaml'
            retries 2
        }
    }
    //TODO: CHANGE THE ERROR HANDLING
    options {
        skipDefaultCheckout(true)
        ansiColor('xterm')
    }

     parameters {
        booleanParam(name: 'APPLY_TERRAFORM', defaultValue: false, description: 'Apply Terraform changes')
        booleanParam(name: 'DESTROY_TERRAFORM', defaultValue: false, description: 'Destroy Terraform infrastructure')
    }

    stages{
        stage('Git Checkout') {
            steps {
                checkout([$class: 'GitSCM',
                          branches: [[name: '*/main']],
                          userRemoteConfigs: [[
                              url: 'https://github.com/codewithnayak/iels-resources-gcp.git',  // Git repository URL
                          ]]
                ])
            }
        }
        stage("Init"){
            steps{
                script{
                    container(name: 'terraform'){
                        dir('k8-sa') {
                            try{
                                sh("terraform init -input=false")
                            }
                            catch(Exception e){
                                println("Error"+e)
                            }
                            
                        }
                        
                    }
                
                }
            }
        }

        stage("Plan"){
            steps{
                script{
                    container(name: 'terraform'){
                        dir('k8-sa') {
                            try{
                                sh("terraform plan -out=tfplan -input=false")
                            }
                            catch(Exception e){
                                println("Error"+e)
                            }
                        }
                        
                    }
                
                }
            }
        }
        stage("Apply"){
            when {
                expression {
                    return params.APPLY_TERRAFORM == true
                }
            }
            steps{
                script{
                    container(name: 'terraform'){
                        dir('k8-sa') {
                           try{
                             sh("terraform apply tfplan")
                           }
                           catch(Exception e){
                            println("Error"+e)
                           }
                        }
                        
                    }
                
                }
            }
        }

        stage("Destroy"){
            when {
                expression {
                    return params.DESTROY_TERRAFORM == true
                }
            }
            steps{
                script{
                    container(name: 'terraform'){
                        dir('k8-sa') {
                           sh '''
                              terraform destroy -auto-approve
                             '''
                        }
                        
                    }
                
                }
            }
        }
    }

    post {
        always {
           script{
            if(getContext(hudson.FilePath)){
                 cleanWs(cleanWhenNotBuilt: false,
                    deleteDirs: true,
                    disableDeferredWipeout: true,
                    notFailBuild: true,
                    patterns: [[pattern: '.gitignore', type: 'INCLUDE'],
                               [pattern: '.propsfile', type: 'EXCLUDE']])
            }
           }
        }
    }

}
