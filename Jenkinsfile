node {
def app
stage('Clone repository') {
git 'https://github.com/NyongSS/Container-Infrastructure.git'
}
stage('Build image') {
app = docker.build("nyongss/prbasedtest")
}
stage('Test image') {
app.inside {
sh 'make test'
}
}
stage('Push image') {
docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
app.push("${env.BUILD_NUMBER}")
app.push("latest")
}
}
}
