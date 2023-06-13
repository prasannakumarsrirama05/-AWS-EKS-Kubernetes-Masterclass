# AWS EKS Setup Guide

This README provides a streamlined process for installing the necessary command-line interfaces (CLIs) to work with Amazon Elastic Kubernetes Service (EKS): AWS CLI, kubectl, and eksctl.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Install AWS CLI](#install-aws-cli)
  - [macOS](#macos)
  - [Windows 10](#windows-10)
- [Install kubectl CLI](#install-kubectl-cli)
  - [macOS](#macos-1)
  - [Windows 10](#windows-10-1)
- [Install eksctl CLI](#install-eksctl-cli)
  - [macOS](#macos-2)
  - [Windows or Linux](#windows-or-linux)
- [References](#references)

## Prerequisites

- MacOS or Windows 10 (64-bit)
- Command Line Interface (CLI)
- Internet access

## Install AWS CLI

### macOS

1. Download the AWS CLI version 2 package.

    ```sh
    curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
    ```

2. Install the downloaded package.

    ```sh
    sudo installer -pkg ./AWSCLIV2.pkg -target /
    ```

3. Verify the installation.

    ```sh
    aws --version
    ```

### Windows 10

1. Download the AWS CLI version 2 installer from [this link](https://awscli.amazonaws.com/AWSCLIV2.msi).

2. Run the downloaded MSI installer and follow the on-screen instructions.

3. Verify the installation.

    ```sh
    aws --version
    ```

### Configure AWS CLI

1. Navigate to the AWS Management Console, go to Services > IAM, and select your IAM user. Note: Use an IAM user, not the root user.

2. Go to the Security Credentials tab and click on Create access key. Copy the Access Key ID and Secret Access Key.

3. Configure the AWS CLI by running the following command and providing the necessary details.

    ```sh
    aws configure
    ```

4. Test the configuration by describing your VPCs.

    ```sh
    aws ec2 describe-vpcs
    ```

## Install kubectl CLI

Amazon recommends using the Amazon EKS-vended kubectl binary for compatibility with your EKS cluster version.

### macOS

1. Download the kubectl binary.

    ```sh
    mkdir kubectlbinary && cd kubectlbinary
    curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/darwin/amd64/kubectl
    ```

2. Make the binary executable and move it to your PATH.

    ```sh
    chmod +x ./kubectl
    mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
    echo 'export PATH=$PATH:$HOME/bin' >> ~/.bash_profile
    ```

3. Verify the installation.

    ```sh
    kubectl version --short --client
    ```

### Windows 10

1. Download the kubectl binary.

    ```sh
    mkdir kubectlbinary && cd kubectlbinary
    curl -o kubectl.exe https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/windows/amd64/kubectl.exe
    ```

2. Add the binary's directory to your system's PATH environment variable.



3. Verify the installation.

    ```sh
    kubectl version --short --client
    ```

## Install eksctl CLI

### macOS

1. Install Homebrew if it's not already installed.

    ```sh
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    ```

2. Tap the Weaveworks repository and install eksctl.

    ```sh
    brew tap weaveworks/tap
    brew install weaveworks/tap/eksctl
    ```

3. Verify the installation.

    ```sh
    eksctl version
    ```

### Windows or Linux

Refer to the [official eksctl installation guide](https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html#installing-eksctl).

## References

- [AWS CLI Installation on macOS](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html)
- [AWS CLI Installation on Windows](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html)
- [kubectl Installation](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html)
- [eksctl Installation Guide](https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html#installing-eksctl)
- [Getting Started with eksctl](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html)
