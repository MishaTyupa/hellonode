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
    withKubeConfig([credentialsId: 'minikube', serverUrl: 'https://192.168.191.26:8443']) {
        bat 'kubectl version --client'
        bat 'kubectl apply -f k8s\\deployment-music-app-ver1.yml'
        bat 'kubectl port-forvard deployment-musicapp-ver1 7654:5000'
    }
    }       
}
