
#-Dmaven.repo.local=${MAVEN_REPO_LOCAL} \

./mvnw clean package \
  -Dmaven.artifact.threads=32 \
  --update-snapshots \
  --no-transfer-progress

cat target/maven-archiver/pom.properties | jq -R -s 'split("\n") | map(select(length > 0)) | map(select(startswith("#") | not)) | map(split("=")) | map({(.[0]): .[1:] | join("=")}) | add'