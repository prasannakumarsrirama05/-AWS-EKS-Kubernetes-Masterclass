# 🌟 AWS, kubectl & eksctl CLI Installation Guide 🌟

A comprehensive guide to installing AWS CLI, kubectl CLI, and eksctl CLI.

## 📝 Table of Contents
- [Introduction](#-introduction-)
- [Installing AWS CLI](#-installing-aws-cli-)
  - [Mac 💻](#mac-)
  - [Windows 🖥️](#windows-)
  - [Configure AWS CLI ⚙️](#configure-aws-cli-)
- [Installing kubectl CLI](#-installing-kubectl-cli-)
  - [Mac 💻](#mac-1-)
  - [Windows 🖥️](#windows-1-)
- [Installing eksctl CLI](#-installing-eksctl-cli-)
  - [Mac 💻](#mac-2-)
  - [Windows/Linux 🖥️🐧](#windowslinux-)
- [References 📚](#references-)

## 🚀 Introduction
This guide provides step-by-step instructions on how to install:
- 🛠️ AWS CLI
- 🛠️ kubectl CLI
- 🛠️ eksctl CLI

## 🧰 Installing AWS CLI
AWS CLI is a powerful tool to interact with AWS services through the command line.

#### Mac 💻
1. 📥 Download and install AWS CLI using these commands:
   ```sh
   curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
   sudo installer -pkg ./AWSCLIV2.pkg -target /
   ```
2. ✅ Verify the installation:
   ```sh
   aws --version
   which aws
   ```
   📘 [Reference for Mac](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html)

#### Windows 🖥️
1. 📥 Download the AWS CLI binary for Windows 10 (64-bit) from this [link](https://awscli.amazonaws.com/AWSCLIV2.msi).
2. 🔨 Install the downloaded binary.
3. ✅ Verify the installation:
   ```sh
   aws --version
   ```
   📘 [Reference for Windows](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html)

#### Configure AWS CLI ⚙️
1. 🚪 Log in to AWS Management Console.
2. Navigate to `Services > IAM`.
3. 🤵 Select an IAM user (🔐 never use the root user for security reasons) and navigate to the **Security credentials** tab.
4. Click **Create access key** and copy the Access ID and Secret access key.
5. 🔧 Open your command line and run:
   ```sh
   aws configure
   ```
6. 📝 Provide the required details (use `us-east-1` for default region and `json` for default output format).
7. 🧪 Test if AWS CLI is working:
   ```sh
   aws ec2 describe-vpcs
   ```

## 🧰 Installing kubectl CLI
kubectl CLI is used to deploy and manage applications on Kubernetes.

⚠️ **IMPORTANT**: Use the Amazon EKS-vended kubectl binary to ensure compatibility with your EKS Cluster version. [Reference](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html)

#### Mac 💻
1. 📥 Download and install kubectl:
   ```sh
   mkdir kubectlbinary
   cd kubectlbinary
   curl -o kubectl https://amazon-eks.s3.us-west-

2.amazonaws.com/1.16.8/2020-04-16/bin/darwin/amd64/kubectl
   chmod +x ./kubectl
   mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
   echo 'export PATH=$PATH:$HOME/bin' >> ~/.bash_profile
   ```
2. ✅ Verify the installation:
   ```sh
   kubectl version --short --client
   ```

#### Windows 🖥️
1. 📥 Download and install kubectl on Windows 10:
   ```sh
   mkdir kubectlbinary
   cd kubectlbinary
   curl -o kubectl.exe https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/windows/amd64/kubectl.exe
   ```
2. 🔄 Update the system **Path** environment variable to include the path to your kubectl binary (e.g., `C:\Users\YOUR_USER\Documents\kubectlbinary`).
3. ✅ Verify the installation:
   ```sh
   kubectl version --short --client
   kubectl version --client
   ```

## 🧰 Installing eksctl CLI
eksctl CLI is the official CLI for Amazon EKS.

#### Mac 💻
1. 🛠️ Install Homebrew on MacOS:
   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
   ```
2. 🍺 Install the Weaveworks Homebrew tap and eksctl:
   ```sh
   brew tap weaveworks/tap
   brew install weaveworks/tap/eksctl
   ```
3. ✅ Verify the installation:
   ```sh
   eksctl version
   ```

#### Windows/Linux 🖥️🐧
For Windows and Linux, refer to the official eksctl installation guide:
- 📘 [eksctl Installation Guide](https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html#installing-eksctl)

## 📚 References
- [Getting Started with Amazon EKS using eksctl](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html)
