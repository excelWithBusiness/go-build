# go-build

Go build base Dockerfile


## Versioning
Previously, was versioned as 0.0.1 and v0.0.2, new convention:

`<golangver>-<iteration>`
examples: ```
1.9-1
1.9-2
1.8-1
1.8-2
```

## Setup
1. copy Dockerfile into your project: `curl -O https://raw.githubusercontent.com/excelWithBusiness/go-build/master/Dockerfile`
2. Set your build arguments and build image:
```
docker build \
--build-arg GIT_CREDENTIAL="https://${GIT_USER}:${GIT_PASS}@github.com/excelWithBusiness/" \
--build-arg PROJECT_BUILD=${BUILD_NUMBER} \
--build-arg PROJECT_NAME=${PROJECT_NAME} \
--build-arg PROJECT_REPOSITORY="github.com/excelWithBusiness/${PROJECT_NAME}" \
-t ${TAG}:latest .
```

## TODO
- Update above "Setup"
- Proper 'FROM <x>' rather than this curling Dockerfile nonsense
- Switch to tokens for git credentials via .netrc
