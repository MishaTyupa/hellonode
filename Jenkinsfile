node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

   stage('Install dependencies') {
        bat  'npm install'
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("miketyupa/hello-world")
    }

    stage('Run tests') {
        bat  'npm test'
    }

    /*stage('Deploy image to Docker HUB') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
       /* docker.withRegistry('https://registry.hub.docker.com', '72c9639c-ac44-4105-9fe2-6b137e54b9fd') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }*/

    stage('Deploy site to K8S') {

    withKubeConfig(caCertificate: '''MIIDITCCAgmgAwIBAgIBAjANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDEwptaW5p
a3ViZUNBMB4XDTIxMDMyNzE5MzA1NloXDTIyMDMyODE5MzA1NlowMTEXMBUGA1UE
ChMOc3lzdGVtOm1hc3RlcnMxFjAUBgNVBAMTDW1pbmlrdWJlLXVzZXIwggEiMA0G
CSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC8n3UAO1bt9aughowoQaRPFAzZlwm/
H1LkERDbPrJmaglt3prLNhqQK0Cm2qQP7bAav3ni6qHL0hW2BH1kqvGBvP0HvQZz
G8dOuXhs3GoWrAKHuhVVWrq/yiWKEez3Sb7vrEnjtFVpU2DoZtSVI8XaKd1VEHt+
93bqltDmKIwI6TWCnbF4A2nlgYpCNQz6ii690sVpdAKdzNHkDVj0MUi/9NyjAYb3
xSdVGME3pd+omd4LUu0Pco0VXQJUUgQ3FqB8Ob+82Vclf2xWd9Dmcw2Y3AazZPzl
gD/TcrQbSn7F9KZ19/Alrl3ey6q+b4sgQfCD5L6YxlSgR15bNwiSPaS5AgMBAAGj
YDBeMA4GA1UdDwEB/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDAQYIKwYBBQUH
AwIwDAYDVR0TAQH/BAIwADAfBgNVHSMEGDAWgBQt/YyA1RsfwA5gLudIMYTdmnDT
WDANBgkqhkiG9w0BAQsFAAOCAQEAGVJ8UyUrwOA2oRXj2NOY+sG/yEZ2vK8iDsPg
OAAaqCpWt27K3a+dNmXWhBxZEeQcyxI/qtqQnXS1D1QF6G5O62+oYC1D6E9MC2SA
TxYCWyUQV+de5fDblCMdyS0z63WZzPXiTHh53cgwKBBp+1uvqoeyc2dzIaV48PXf
5Gt7MjaJt1RkVEIPNATpyQ1ChLYAbGhTGgzAXadqC+jSim/641SZ9JfDBl1yR4zt
Vj96A82BuXtoboELZ4BddSsZjzw1QgexZ96DpCREO6kF1k8EV8F9ghCRAsEf7eqF
oW9z3bXnwwOto5E4MoImd7VBA8vLtIjjAZ9Yon+hbnw9uJlUTA==''', clusterName: 'minikube', contextName: '', credentialsId: 'minikube', namespace: 'default', serverUrl: 'https://192.168.191.26:8443') {
        bat 'kubectl version --client'
        bat 'kubectl apply -f k8s\\deployment-music-app-ver1.yml'
        bat 'kubectl port-forvard deployment-musicapp-ver1 7654:5000'
}
    }       
}
