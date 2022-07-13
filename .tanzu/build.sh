
#-Dmaven.repo.local=${MAVEN_REPO_LOCAL} \

./mvnw clean package \
  -Dmaven.artifact.threads=32 \
  --update-snapshots \
  --no-transfer-progress

xmllint --xpath '/*[local-name()="project"]/*[local-name()="version"]/text()' pom.xml