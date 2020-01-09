FROM golang:1.13

ARG GIT_CREDENTIAL
ARG PROJECT_BUILD
ARG PROJECT_NAME
ARG PROJECT_REPOSITORY

ENV PROJECT_BUILD=${PROJECT_BUILD}
ENV PROJECT_NAME=${PROJECT_NAME}
ENV PROJECT_PATH=/go/src/${PROJECT_REPOSITORY}

COPY . ${PROJECT_PATH}

WORKDIR ${PROJECT_PATH}

# Create credentials file and sync
RUN echo ${GIT_CREDENTIAL} > .git-credential \
    && git config --global credential.helper "store --file=${PROJECT_PATH}/.git-credential" \
    && make compile

# Clean up
RUN rm .git-credential && rm -rf .git

# SecretsManagement stuffs
RUN curl -O https://s3-eu-west-1.amazonaws.com/filtered-sec-public/secretsmanagement/v0.1/ssm-entrypoint.sh && \
    chmod +x ./ssm-entrypoint.sh
CMD ["./ssm-entrypoint.sh", "/bin/sh", "-c", "${PROJECT_PATH}/dist/${PROJECT_NAME}"]



#CMD ["/bin/sh", "-c", "${PROJECT_PATH}/dist/${PROJECT_NAME}"]
