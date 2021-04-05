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
    withKubeConfig([credentialsId: 'MIIEpAIBAAKCAQEAvJ91ADtW7fWroIaMKEGkTxQM2ZcJvx9S5BEQ2z6yZmoJbd6ayzYakCtAptqkD+2wGr954uqhy9IVtgR9ZKrxgbz9B70GcxvHTrl4bNxqFqwCh7oVVVq6v8olihHs90m+76xJ47RVaVNg6GbUlSPF2indVRB7fvd26pbQ5iiMCOk1gp2xeANp5YGKQjUM+oouvdLFaXQCnczR5A1Y9DFIv/TcowGG98UnVRjBN6XfqJneC1LtD3KNFV0CVFIENxagfDm/vNlXJX9sVnfQ5nMNmNwGs2T85YA/03K0G0p+xfSmdffwJa5d3suqvm+LIEHwg+S+mMZUoEdeWzcIkj2kuQIDAQABAoIBABJKWBscpfJPN0RKp76jlt5AMHrNBZnt3KjW6s6Hxt7de2qXAmWgKnU+bHeBjhUpVEFTver+G5BbH9XVm58uYFrXS6X7c2uoDuyYWZAc04C9T0WACt+K+77rSDaaRGM6WHR/PW8CJqIe/q+qgQSxQldEZf0AqykFsBdRZpJa7jFS2TwyeZjV4u5Ltg1fwxD/zhne2TEIa02e21NmY5EM38Jt/a1znBw6WDIFfBXf4yg4oFxebSLGwSiSGSv+ACBOSUxFIh5aY70vEuHScXAl56DmhXnCySRXB006YhRrF6ZNxFIGalHRq9dIGPZCxSGTtEd4+PWN0vck+kDVjrRtcq0CgYEA0MHjrOrU8RXA1sbd1b2PvM/lWfBzbdx7OCV6uyF2m9UaJFaxiwmZ6JKGswNBmumIDyNWn11r0fNyYvuFQQp/K1nT3ByZrafw7Sr7Y7S3chazUcA4ymqX0T5VHxQRSqOqAEzbYBbLRkuzjpH2tG+I95ztl0UW8OTs2z193Q9tNsMCgYEA508ZarKBLs3LFIVMUlFyhnynKdDV3gddZ90J0OJ2UozDRU/YhYtgR/hcjhbnysOrqrEWjD9DhWGsrVyerHEtaGHoRTZxxU2WOn27N7bviqM5u0NTZY3f3bavJ0OugXY5n9gxdLJGuer+pCfPWetNDyv14y/NLaH6OB3Fb0ScVtMCgYEAljHpzQ9oBczQ4bZTBOVN9VreeMc3RWPMg6jzlI+O9q9sD5kQRCi0Q1Co+ULugLZk3f9e42ojmPq+4dh1F0amGFqYw1UQfJDIFttF44ayNbN/cOIL+haXBEUEmUem6Ty3o1+otomv1vPATGNYTJmywfR2PM/IoakTgOnNFK90tGECgYBlWCjAsNkc0pnJseWQo5LUDcWH8rHhh8SK/zOPy8kfvgDIW4V4bWqP3edfcfW4xyZtsQ06AXXp+LOZeV0kHKpSc6M6v/H1Cltp4TCn5oTpbz6aJ5NgiVquX546S9Mncc8pk6WHhZyrVKSg87hLo2at4QrosUbqWW+yKokYiS0edQKBgQCmRW7K6zwrb9oDy5rtFFF7IVWe7Nfgmqk4JVTZ0esZ3sA4SXgt0jDAeWd24wPE6R+rFsVkXSp6ai3gKzti5laDGZNuKdThLvmdXUKJo6Ht3tA9aaqYFMow4mVdyKTzIVHpYBwEMYMF4YpLALsT4l4u+6Yf3VdvrQdEAHVaRdSk1Q==', serverUrl: 'https://192.168.191.26:8443') {
        bat 'kubectl version --client'
        bat 'kubectl apply -f k8s\\deployment-music-app-ver1.yml'
        bat 'kubectl port-forvard deployment-musicapp-ver1 7654:5000'
    }
    }       
}
