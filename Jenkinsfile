pipeline {
    agent any

    environment {
        GIT_CREDENTIALS_ID = 'github-ssh-fresh'
        GIT_REPO_URL = 'git@github.com:mariame1/devops-deployment-project.git'
        GIT_BRANCH = 'main'
    }

    stages {
        stage('Clone Repo') {
            steps {
                echo 'Cloning GitHub repo using SSH...'
                
                // Print current Git branches (for debugging)
                sh 'git branch -a || true'
                sh 'git rev-parse --abbrev-ref HEAD || true'

                // Explicitly specify the main branch
                git branch: "${GIT_BRANCH}", credentialsId: "${GIT_CREDENTIALS_ID}", url: "${GIT_REPO_URL}"
            }
        }

        stage('Health Check') {
            steps {
                echo 'Running health checks...'
                // Add your health check logic here
            }
        }

        stage('Deploy to EC2') {
            steps {
                echo 'Deploying to EC2...'
                // Add your deploy logic here
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline succeeded.'
        }
        failure {
            echo '❌ Pipeline failed.'
        }
    }
}
