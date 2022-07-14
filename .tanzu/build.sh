
set -o xtrace
set -o errexit
set -o nounset
set -o pipefail

#-Dmaven.repo.local=${MAVEN_REPO_LOCAL} \

metadata_path=$1

timestamp=$(date "+%Y%m%d-%H%M%S")
./mvnw clean deploy \
  -DbuildNumber=${timestamp} \
  -Dmaven.artifact.threads=32 \
  --update-snapshots \
  --no-transfer-progress

source target/maven-archiver/pom.properties

cat <<EOF > ${metadata_path}
{
  "groupId": "${groupId}",
  "artifactId": "${artifactId}",
  "version": "${version}",
  "classifier": "",
  "type": "jar"
}
EOF

cat ${metadata_path}