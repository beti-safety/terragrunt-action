# Dockerfile used in execution of Github Action
FROM gruntwork/terragrunt:0.0.1
MAINTAINER Gruntwork <info@gruntwork.io>

RUN apt-get update -y && \
    apt-get install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

RUN pip --version
RUN pip install awscli
RUN aws --version

COPY ["./src/main.sh", "/action/main.sh"]
ENTRYPOINT ["/action/main.sh"]
