pipeline {
    agent {
        label 'ansible-slave-node'
    }
    
    tools {
        maven 'Maven-3.9.9'
    }

    stages {
        stage('Git clone') {
            steps {
                git branch: 'main', credentialsId: 'Github-Credentials', url: 'https://github.com/Transvolt-gith/Suraj-Maven-Devops.git'
            }
        }
        
        stage('Maven Build') {
            steps {
                sh 'mvn clean package' 
            }
        }
        
        stage('Code Review') {
            steps {
                withSonarQubeEnv('Sonar-9.9.8') {
                sh 'mvn sonar:sonar'    
                }
            }
        }
        
        stage('Upload Code to Nexus Repository') {
            steps {
              nexusArtifactUploader artifacts: [[artifactId: 'suraj-maven-web-app', classifier: '', file: 'target/suraj-maven-web-app.war', type: 'war']], credentialsId: 'Nexus-Credentials', groupId: 'in.surajit', nexusUrl: '54.221.131.107:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'surajit-release-repo', version: '3.0-RELEASE'  
            }
        }
        
        stage('Execute playbook') {
            steps {
                sh 'ansible-playbook task.yml' 
            }
        }
    }
}
