
set -o xtrace
set -o errexit
set -o nounset
set -o pipefail

#-Dmaven.repo.local=${MAVEN_REPO_LOCAL} \

./mvnw clean package \
  -Dmaven.artifact.threads=32 \
  --update-snapshots

source target/maven-archiver/pom.properties

cat <<EOF > ${METADATA_PATH}
{
  "groupId": "${groupId}",
  "artifactId": "${artifactId}",
  "version": "${version}",
  "classifier": "",
  "type": "jar"
}
EOF

cat ${METADATA_PATH}