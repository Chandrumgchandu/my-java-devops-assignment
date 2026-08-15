pipeline {
    agent any

    environment {
        GIT_REPO       = 'https://github.com/Chandrumgchandu/my-java-devops-assignment.git'

        AWS_REGION     = 'us-east-1'
        ECR_REGISTRY   = 'public.ecr.aws'
        ECR_REPOSITORY = 'q2s1m9s9/jenkinsecr'

        IMAGE_TAG      = "${BUILD_NUMBER}"
        IMAGE_URI      = "public.ecr.aws/q2s1m9s9/jenkinsecr:${BUILD_NUMBER}"

        K8S_NAMESPACE  = 'java-app'
        K8S_DEPLOYMENT = 'java-app'
        K8S_CONTAINER  = 'java-app'
    }

    stages {

        stage('Checkout') {
            steps {
                echo "Checking out YOUR GitHub repository..."

                git branch: 'main',
                    url: "${GIT_REPO}"

                sh '''
                    echo "========== GIT =========="
                    git remote -v
                    git log -1 --oneline
                '''
            }
        }

        stage('Build Java Application') {
            steps {
                sh '''
                    echo "========== MAVEN BUILD =========="

                    mvn clean -B \
                        -Denforcer.skip=true \
                        package
                '''
            }
        }

        stage('Unit Tests') {
        steps {
            sh '''
                echo "========== UNIT TESTS =========="

                mvn -B \
                    -Denforcer.skip=true \
                    test
            '''
        }
    }

        stage('Docker Login to Public ECR') {
            steps {
                sh '''
                    echo "========== ECR LOGIN =========="

                    aws ecr-public get-login-password \
                        --region us-east-1 |
                    docker login \
                        --username AWS \
                        --password-stdin public.ecr.aws
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                    echo "========== DOCKER BUILD =========="

                    docker build \
                        -t ${IMAGE_URI} \
                        .
                '''
            }
        }

        stage('Push Docker Image') {
            steps {
                sh '''
                    echo "========== DOCKER PUSH =========="

                    docker push ${IMAGE_URI}
                '''
            }
        }

        stage('Verify Kubernetes Access') {
    steps {
        sh '''
            echo "========== KUBERNETES ACCESS =========="

            export KUBECONFIG=/var/lib/jenkins/.kube/config

            kubectl get deployment \
                ${K8S_DEPLOYMENT} \
                -n ${K8S_NAMESPACE}
        '''
    }
}

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                    echo "========== KUBERNETES DEPLOYMENT =========="

                    export KUBECONFIG=/var/lib/jenkins/.kube/config

                    kubectl set image deployment/${K8S_DEPLOYMENT} \
                        ${K8S_CONTAINER}=${IMAGE_URI} \
                        -n ${K8S_NAMESPACE}

                    kubectl rollout status \
                        deployment/${K8S_DEPLOYMENT} \
                        -n ${K8S_NAMESPACE}
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                    echo "========== DEPLOYMENT VERIFICATION =========="

                    export KUBECONFIG=/var/lib/jenkins/.kube/config

                    kubectl get deployment \
                        ${K8S_DEPLOYMENT} \
                        -n ${K8S_NAMESPACE}

                    echo
                    kubectl get pods \
                        -n ${K8S_NAMESPACE} \
                        -o wide

                    echo
                    kubectl get service \
                        -n ${K8S_NAMESPACE}
                '''
            }
        }
    }

    post {
        success {
            echo "============================================"
            echo " PIPELINE SUCCESSFUL"
            echo " Image: ${IMAGE_URI}"
            echo " Kubernetes: ${K8S_DEPLOYMENT}"
            echo "============================================"
        }

        failure {
            echo "============================================"
            echo " PIPELINE FAILED"
            echo "============================================"
        }
    }
}