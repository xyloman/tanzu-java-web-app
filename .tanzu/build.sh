#!/usr/env/bin bash

#-Dmaven.repo.local=${MAVEN_REPO_LOCAL} \

./mvnw clean deploy \
  -Dmaven.artifact.threads=32 \
  --update-snapshots
