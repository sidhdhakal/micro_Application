@Library('Shared') _
pipeline {
    agent any

    environment {
        DOCKERHUB_USER = "siddhartha54"
        SONAR_HOME = tool "Sonar"
    }

    parameters {
        string(name: 'Frontend_DOCKER_TAG', defaultValue: '', description: 'Tag for frontend image')
        string(name: 'User_DOCKER_TAG', defaultValue: '', description: 'Tag for user service image')
        string(name: 'Cart_DOCKER_TAG', defaultValue: '', description: 'Tag for cart service image')
        string(name: 'Product_DOCKER_TAG', defaultValue: '', description: 'Tag for product service image')
    }

    stages {

        stage("Validate Parameters") {
            steps {
                script {
                    if (!params.Frontend_DOCKER_TAG?.trim() ||
                        !params.User_DOCKER_TAG?.trim() ||
                        !params.Cart_DOCKER_TAG?.trim() ||
                        !params.Product_DOCKER_TAG?.trim()) {
                        error("❌ ERROR: All Docker tags must be provided.")
                    }
                }
            }
        }

        stage("Workspace Cleanup") {
            steps { cleanWs() }
        }

        stage("Checkout Code") {
            steps {
                script {
                    code_checkout("https://github.com/sidhdhakal/micro_Application.git", "main")
                }
            }
        }

        stage("Install Node Modules") {
            steps {
                script {
                    def services = ["front-end", "Cart", "User", "Product"]
                    for (svc in services) {
                        dir(svc) {
                            sh '''
                                npm install --silent --no-fund --no-audit
                            '''
                        }
                    }
                }
            }
        }

        stage("Trivy: Filesystem Scan") {
            steps { script { trivy_scan() } }
        }

        stage("OWASP: Dependency Check") {
            steps { script { owasp_dependency() } }
        }

        stage("SonarQube: Code Analysis") {
            steps {
                script {
                    sonarqube_analysis("Sonar", "micro-app", "micro-app")
                }
            }
        }

        stage("SonarQube: Code Quality Gates") {
            steps {
                script {
                    sonarqube_code_quality()
                }
            }
        }

        stage("Docker: Build Images") {
            parallel {
                stage("Frontend") {
                    steps { dir("front-end") {
                        script { docker_build("frontend-service", params.Frontend_DOCKER_TAG, DOCKERHUB_USER) }
                    }}
                }

                stage("Cart Service") {
                    steps { dir("Cart") {
                        script { docker_build("cart-service", params.Cart_DOCKER_TAG, DOCKERHUB_USER) }
                    }}
                }

                stage("Product Service") {
                    steps { dir("Product") {
                        script { docker_build("product-service", params.Product_DOCKER_TAG, DOCKERHUB_USER) }
                    }}
                }

                stage("User Service") {
                    steps { dir("User") {
                        script { docker_build("user-service", params.User_DOCKER_TAG, DOCKERHUB_USER) }
                    }}
                }
            }
        }

        stage("Docker: Push to DockerHub") {
            steps {
                script {
                    docker_push("frontend-service", params.Frontend_DOCKER_TAG, DOCKERHUB_USER)
                    docker_push("cart-service", params.Cart_DOCKER_TAG, DOCKERHUB_USER)
                    docker_push("product-service", params.Product_DOCKER_TAG, DOCKERHUB_USER)
                    docker_push("user-service", params.User_DOCKER_TAG, DOCKERHUB_USER)
                }
            }
        }

        stage("Trigger CD Pipeline") {
            steps {
                script {
                    build job: "MicroApp-CD", parameters: [
                        string(name: 'Frontend_DOCKER_TAG', value: params.Frontend_DOCKER_TAG),
                        string(name: 'Cart_DOCKER_TAG', value: params.Cart_DOCKER_TAG),
                        string(name: 'Product_DOCKER_TAG', value: params.Product_DOCKER_TAG),
                        string(name: 'User_DOCKER_TAG', value: params.User_DOCKER_TAG)
                    ]
                }
            }
        }
    }

    post {
        success {
            archiveArtifacts artifacts: '*.xml', followSymlinks: false
            echo "✅ Build and push successful!"
        }
        failure {
            echo "❌ Build failed. Check logs!"
        }
    }
}
