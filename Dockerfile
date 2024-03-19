# Use Ubuntu 22.04 LTS
FROM ubuntu:22.04

# Avoid prompts during package installation
ARG DEBIAN_FRONTEND=noninteractive

# Install prerequisites, including Python and Pipenv, and clean up in one layer
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa \
    openjdk-17-jdk \
    python3 \
    python3-pip \
    wget && \
    pip3 install pipenv && \
    rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN useradd -ms /bin/bash developer && \
    mkdir -p /home/developer/Android/sdk /home/developer/.android && \
    touch /home/developer/.android/repositories.cfg
USER developer
WORKDIR /home/developer

# Environment variables
ENV ANDROID_SDK_ROOT /home/developer/Android/sdk
ENV PATH "$PATH:/home/developer/Android/sdk/platform-tools:/home/developer/flutter/bin:/home/developer/.local/bin"

# Setup Android SDK
RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip && \
    unzip sdk-tools.zip -d Android/sdk/cmdline-tools && \
    rm sdk-tools.zip && \
    mkdir -p Android/sdk/cmdline-tools/latest && \
    mv Android/sdk/cmdline-tools/bin Android/sdk/cmdline-tools/latest/ && \
    mv Android/sdk/cmdline-tools/lib Android/sdk/cmdline-tools/latest/ && \
    yes | Android/sdk/cmdline-tools/latest/bin/sdkmanager --licenses && \
    Android/sdk/cmdline-tools/latest/bin/sdkmanager "build-tools;32.0.0" "patcher;v4" "platform-tools" "platforms;android-32" "sources;android-32"

# Install Flutter
RUN git clone -b stable https://github.com/flutter/flutter.git && \
    flutter doctor

# Check for a Pipfile and install Python dependencies if it exists
# COPY --chown=developer:developer Pipfile Pipfile.lock* /home/developer/
# RUN if [ -f Pipfile ]; then pipenv install --deploy --ignore-pipfile; fi
