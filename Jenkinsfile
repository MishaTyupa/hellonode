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

    stage('Deploy site to Heroku') {
        //bat 'docker login --username=drmexanik7@gmail.com --password=15078cb5-fe06-4abc-94c2-55f131b38bc8 registry.heroku.com'
        //bat 'docker tag miketyupa/hello-world:latest registry.heroku.com/infinite-escarpment-38882/web'
        //bat 'docker push registry.heroku.com/infinite-escarpment-38882/web'
        //bat 'heroku auth:login -i'
        //bat 'echo drmexanik7@gmail.com'
        //bat 'echo d222aa59-2ea3-44f2-9543-9c516fb9784e'
        bat 'HEROKU_API_KEY='bd28dc5d-b976-479e-8727-8c8de3cb2f23' heroku container:push web -a infinite-escarpment-38882'
        bat 'HEROKU_API_KEY='bd28dc5d-b976-479e-8727-8c8de3cb2f23' heroku container:release web -a infinite-escarpment-38882'
        //bat 'docker logout registry.heroku.com'
    }       
}
