pipeline {
    agent any

    environment {
        DEPLOY_SCRIPT = 'scripts/deploy_to_ec2.sh'
    }

    stages {
        stage('Clone Repo') {
            steps {
                echo 'Cloning GitHub repo using SSH...'
                // Print current Git branches (for debugging)
                sh 'git branch -a || true'
                sh 'git rev-parse --abbrev-ref HEAD || true'
                // Explicitly specify the main branch
                git credentialsId: 'github-ssh-fresh', url: 'git@github.com:mariame1/devops-deployment-project.git'
            }
        }

        stage('Health Check') {
            steps {
                echo 'Running system health check...'
                sh 'bash scripts/health_check.sh'
            }
        }

        stage('Deploy to EC2') {
            steps {
                echo 'Deploying to EC2 instance...'
                sh "bash ${DEPLOY_SCRIPT}"
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed.'
        }
    }
}
