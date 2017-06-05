# go-build

Go build dockerfile

## Setup
1. copy Dockerfile into your project: `curl -O https://raw.githubusercontent.com/excelWithBusiness/Devops-Config/master/Dockerfile`
2. Set your build arguments and build image:
```
docker build \
--build-arg GIT_CREDENTIAL="https://${GIT_USER}:${GIT_PASS}@github.com/excelWithBusiness/" \
--build-arg PROJECT_BUILD=${BUILD_NUMBER} \
--build-arg PROJECT_NAME=${PROJECT_NAME} \
--build-arg PROJECT_REPOSITORY="github.com/excelWithBusiness/${PROJECT_NAME}" \
-t ${TAG}:latest .
```
