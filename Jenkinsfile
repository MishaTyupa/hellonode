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

withKubeConfig(caCertificate: '''MIID3DCCAsSgAwIBAgIBAjANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDEwptaW5p
a3ViZUNBMB4XDTIxMDMyNzE5MzUxM1oXDTIyMDMyODE5MzUxM1owLDEXMBUGA1UE
ChMOc3lzdGVtOm1hc3RlcnMxETAPBgNVBAMTCG1pbmlrdWJlMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1qBJa4UZ+eYg+z68LJjgcFcqk6/zxN7oKIf/
wbc5RfZM/AUxeRkGA5b7RauGWI+zEBmC1ltjm7lcC+wvLK0gE95xllMXzR5/ImpP
EfnKv10UwXhOe0srE2xpq5pu4sdnkt6Za3ZH29ctjt60cRxgPULyZdo0gRCrSsmr
fo3DNAIuk8ItevINQZPpraysJNaDvk2LeFDHZpN/WnDokfjYRj9Jslaqt8Z5uEyO
GSEsSkmam/+meE9b7EoSB3iW2miqoL56M+/mMLqerALZZIAMo6vbISLXzKlpKkOL
/X7Lz7YGcq/7/dMs4AwDcFr/Ii8VKZvYVoL9KTkm1j1+u/wV2wIDAQABo4IBHjCC
ARowDgYDVR0PAQH/BAQDAgWgMB0GA1UdJQQWMBQGCCsGAQUFBwMBBggrBgEFBQcD
AjAMBgNVHRMBAf8EAjAAMB8GA1UdIwQYMBaAFC39jIDVGx/ADmAu50gxhN2acNNY
MIG5BgNVHREEgbEwga6CCm1pbmlrdWJlQ0GCH2NvbnRyb2wtcGxhbmUubWluaWt1
YmUuaW50ZXJuYWyCJGt1YmVybmV0ZXMuZGVmYXVsdC5zdmMuY2x1c3Rlci5sb2Nh
bIIWa3ViZXJuZXRlcy5kZWZhdWx0LnN2Y4ISa3ViZXJuZXRlcy5kZWZhdWx0ggpr
dWJlcm5ldGVzgglsb2NhbGhvc3SHBMCovxqHBApgAAGHBH8AAAGHBAoAAAEwDQYJ
KoZIhvcNAQELBQADggEBAM+JqFVxcmRLMMfiCyqnyj0eGA1PQarDmVgCtdHfrBUa
BW7nfnEjr999nVo7R6LToIdeqvnsOGG/xnww8JZ0Oz3tzULQf4q/IQOr+K61hRd9
oaMbHrxEO0Ms0m3Q+rEnZIfGxQsHdwZsCF/ZMFrf/8/8AMbMPaNOlJLPhngbrtS7
zGwMoAcr0L3jBSDqVlyyEk+PsC/9Qqt+CsWiMhtiqnj/GNdXYVMJZIm7Y+qxMBtO
kYYc2vnMsTtHORQpwIAPxPYjHQ5QHMd29i7u8KQ0rkURfxT8k+Y2G1rxP0Q15TbY
K+Kqndi9GJod/5IVGY2MivvuhPgLxPCyTGBDFOPx3dw=''', clusterName: 'minikube', contextName: 'minikube', credentialsId: 'minikube', namespace: 'default', serverUrl: 'https://192.168.191.26:8443') {
            bat 'kubectl version --client'
        bat 'kubectl apply -f k8s\\deployment-music-app-ver1.yml'
        bat 'kubectl port-forvard deployment-musicapp-ver1 7654:5000'
        }

    }       
}
