
#-Dmaven.repo.local=${MAVEN_REPO_LOCAL} \

./mvnw clean package \
  -Dmaven.artifact.threads=32 \
  --update-snapshots \
  --no-transfer-progress

groupId=$(./mvnw help:evaluate -f pom.xml --offline -Dexpression=project.groupId -DforceStdout -q)
artifactId=$(./mvnw help:evaluate -f pom.xml --offline -Dexpression=project.artifactId -DforceStdout -q)
version=$(./mvnw help:evaluate -f pom.xml --offline -Dexpression=project.version -DforceStdout -q)

cat <<EOF > metadata.json
{
  "groupId": "${groupId}",
  "artifactId": "${artifactId}",
  "version": "${version}"
}
EOF

cat metadata.json