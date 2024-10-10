pipeline {
    agent any

    environment {
        AWS_ACCOUNT_ID = '381492195384'          // 替换为你的AWS账户ID
        AWS_REGION = 'ap-southeast-1'            // 替换为你的AWS区域
        ECR_REPO_NAME = 'health/gateway'         // ECR存储库名称
        IMAGE_TAG = "${env.BUILD_ID}"            // 每次构建时的镜像标签
        DOCKER_IMAGE = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO_NAME}:${IMAGE_TAG}"
    }


    stages {
        stage('Checkout Code') {
            steps {
                // 从GitHub拉取代码
                git url: 'https://github.com/nusissSEteam9/Gateway_Application_Team9.git', branch: 'qybl'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // 使用Docker构建镜像
                    sh 'docker build -t gateway_application_team9 .'
                    sh 'docker tag gateway_application_team9:latest ' + DOCKER_IMAGE
                }
            }
        }

        stage('Login to ECR') {
            steps {
                script {
                    // 登录到ECR
                    sh '''
                    aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com
                    '''
                }
            }
        }

        stage('Push Docker Image to ECR') {
            steps {
                script {
                    // 推送Docker镜像到ECR
                    sh 'docker push ' + DOCKER_IMAGE
                }
            }
        }

        stage('Deploy on EC2') {
            steps {
                script {
                    // SSH到EC2并拉取最新镜像，重启容器
                    sshagent(['ec2-ssh-credentials']) {
                        sh '''
                        ssh -o StrictHostKeyChecking=no ec2-user@18.136.194.95 << EOF
                        docker pull ${DOCKER_IMAGE}
                        docker stop gateway_container || true
                        docker rm gateway_container || true
                        docker run -d -p 8081:8080 --name gateway_container ${DOCKER_IMAGE}
                        EOF
                        '''
                    }
                }
            }
        }
    }
}