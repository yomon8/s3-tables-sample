ARG VARIANT="1-3.12-bookworm"
FROM mcr.microsoft.com/vscode/devcontainers/python:${VARIANT}

RUN apt update && apt install -y \
    bash-completion \
    dnsutils \
    fzf \
    wget \
    ca-certificates \
    default-jre \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts/


# AWS CLI v2のインストール
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-$(uname -m).zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf ./awscliv2.zip ./aws

# Terraformのインストール
COPY --from=hashicorp/terraform:1.10 /bin/terraform /bin/terraform

# uvのインストール
COPY --from=ghcr.io/astral-sh/uv:0.6.1 /uv /uvx /bin/
RUN echo 'eval "$(uv generate-shell-completion bash)"' >> ~vscode/.bashrc
