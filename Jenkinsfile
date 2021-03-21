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

        echo "app is $app"
    }

   stage('Run tests') {
        bat  'npm test'
   }

/*
    stage('Test image') {

        /*environment {
            WORKSPACE='C:\\Windows\\System32\\config\\systemprofile\\AppData\\Local\\Jenkins\\.jenkins\\workspace\\scripted-hello-world-pipeline-fuck'
        }*/
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */
        /*echo "env.WORKSPACE workspace is $env.WORKSPACE"
        echo "WORKSPACE workspace is $WORKSPACE"*/
        /*app.inside {
            bat 'echo "Tests passed!!!"'
        }
    }*/

    stage('Deploy image to Docker HUB') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', '72c9639c-ac44-4105-9fe2-6b137e54b9fd') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }

        stage('Deploy image to Heroku') {

        docker.withRegistry('https://registry.heroku.com', 'fda93d4c-6264-4c5a-bb77-fa99a131b16c') {
            bat 'heroku container:push web'
            bat 'heroku container:release web'
        }
    }
}
