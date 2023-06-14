# 🌟 Create EKS Cluster & Node Groups 🌟

This guide will take you through the steps to create an EKS Cluster and Node Groups.

## 🚀 Step-00: Introduction 🚀

Understand about EKS Core Objects:

- 🎛️ **Control Plane**
- 💼 **Worker Nodes & Node Groups**
- 🌐 **Fargate Profiles**
- 🏦 **VPC**

We will:

- 🛠️ Create EKS Cluster
- 🤝 Associate EKS Cluster to IAM OIDC Provider
- 🎨 Create EKS Node Groups
- 🔍 Verify Cluster, Node Groups, EC2 Instances, IAM Policies and Node Groups

## 🚧 Step-01: Create EKS Cluster using eksctl 🚧

This will take about 15 to 20 minutes to create the Cluster Control Plane.

```shell
# 🛠️ Create Cluster
eksctl create cluster --name=eksdemo1 \
                      --region=us-east-1 \
                      --zones=us-east-1a,us-east-1b \
                      --without-nodegroup 

# 📋 Get List of clusters
eksctl get cluster
```

## 🔗 Step-02: Create & Associate IAM OIDC Provider for EKS Cluster 🔗

To enable and use AWS IAM roles for Kubernetes service accounts on our EKS cluster, we must create & associate OIDC identity provider. Use the latest version of eksctl.

```shell
# 🔨 Template
eksctl utils associate-iam-oidc-provider \
    --region <region-code> \
    --cluster <cluster-name> \
    --approve

# 🧪 Example
eksctl utils associate-iam-oidc-provider \
    --region us-east-1 \
    --cluster eksdemo1 \
    --approve
```

## 🗝️ Step-03: Create EC2 Keypair 🗝️

Create a new EC2 Keypair with the name `kube-demo`. This keypair will be used when creating the EKS NodeGroup and helps in logging into the EKS Worker Nodes using Terminal.

## 🌐 Step-04: Create Node Group with Additional Add-Ons in Public Subnets 🌐

These add-ons will create the respective IAM policies for us automatically within our Node Group role.

```shell
# 🌐 Create Public Node Group   
eksctl create nodegroup --cluster=eksdemo1 \
                       --region=us-east-1 \
                       --name=eksdemo1-ng-public1 \
                       --node-type=t3.medium \
                       --nodes=2 \
                       --nodes-min=2 \
                       --nodes-max=4 \
                       --node-volume-size=20 \
                       --ssh-access \
                       --ssh-public-key=kube-demo \
                       --managed \
                       --asg-access \
                       --external-dns-access \
                       --full-ecr-access \
                       --appmesh-access \
                       --alb-ingress-access 
```

## 🕵️ Step-05: Verify Cluster & Nodes 🕵️

1. 🔍 Verify NodeGroup subnets to confirm EC2 Instances are in Public Subnet.
2. ➡️ Go to AWS Console > Services > EKS > eksdemo > eksdemo1-ng1-public.
3. ✅ Click on the associated subnet in the Details tab.
4. 🌐 Click on the Route Table Tab, you should see the internet route via Internet Gateway (0.0.0.0/0 -> igw-xxxxxxxx).
5. ✅ Verify Cluster, NodeGroup in EKS Management Console by going to Services -> Elastic Kubernetes Service -> eksdemo1.


6. 📋 List Worker Nodes:

    ```shell
    # List EKS clusters
    eksctl get cluster

    # List NodeGroups in a cluster
    eksctl get nodegroup --cluster=<clusterName>

    # List Nodes in the current kubernetes cluster
    kubectl get nodes -o wide

    # Your kubectl context should be automatically changed to the new cluster
    kubectl config view --minify
    ```

7. 📜 Verify Worker Node IAM Role and list of Policies. Go to Services -> EC2 -> Worker Nodes, and click on IAM Role associated with EC2 Worker Nodes.
8. 🛡️ Verify Security Group associated with Worker Nodes by going to Services -> EC2 -> Worker Nodes and clicking on Security Group associated with the EC2 Instance.
9. 🔍 Verify CloudFormation Stacks.
10. 🗝️ Login to Worker Node using Key pair `kube-demo`:

    ```shell
    # For MAC, Linux, or Windows10
    ssh -i kube-demo.pem ec2-user@<Public-IP-of-Worker-Node>

    # For Windows 7
    Use putty
    ```

## 🛡️ Step-06: Update Worker Nodes Security Group to Allow All Traffic 🛡️

It is necessary to allow All Traffic on worker node security group.

## 📚 Additional References 📚

- 📑 [Enable IAM Roles for Service Accounts](https://docs.aws.amazon.com/eks/latest/userguide/enable-iam-roles-for-service-accounts.html)
- 📑 [Create Service Account IAM Policy and Role](https://docs.aws.amazon.com/eks/latest/userguide/create-service-account-iam-policy-and-role.html)
