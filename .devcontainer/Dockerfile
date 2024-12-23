ARG VARIANT="1-3.12-bookworm"
FROM mcr.microsoft.com/vscode/devcontainers/python:${VARIANT}

# amd64 or arm64
ARG ARCH=amd64

RUN apt update && apt install -y \
    bash-completion \
    dnsutils \
    fzf \
    wget \
    ca-certificates \
    default-jre \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts/

RUN wget -qO- https://astral.sh/uv/install.sh | sh

ENV CARGO_HOME="/opt/.cargo/bin"
RUN mkdir -p $CARGO_HOME
RUN mv /root/.local/bin/uv $CARGO_HOME/uv
ENV PATH="$CARGO_HOME/:$PATH"
RUN chown -R vscode $CARGO_HOME

# AWS CLI v2のインストール
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-$(uname -m).zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf ./awscliv2.zip ./aws

# Terraformのインストール
ARG TF_VERSION=1.10.3
RUN curl https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_${ARCH}.zip -o "terraform.zip" \
    && unzip ./terraform.zip terraform -d /usr/local/bin/ && rm -rf ./terraform.zip
