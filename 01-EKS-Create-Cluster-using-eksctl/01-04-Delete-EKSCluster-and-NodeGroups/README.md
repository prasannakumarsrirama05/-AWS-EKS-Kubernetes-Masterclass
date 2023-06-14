# 🗑️ Delete EKS Cluster & Node Groups 🗑️

Learn how to delete an EKS cluster and its associated node groups.

## 🚀 Step-01: Delete Node Group 🚀

1. List EKS Clusters
```shell
eksctl get clusters
```

2. Capture Node Group name
```shell
eksctl get nodegroup --cluster=<clusterName>
eksctl get nodegroup --cluster=eksdemo1
```

3. Delete Node Group
```shell
eksctl delete nodegroup --cluster=<clusterName> --name=<nodegroupName>
eksctl delete nodegroup --cluster=eksdemo1 --name=eksdemo1-ng-public1
```

## 🌪️ Step-02: Delete Cluster 🌪️

1. Delete Cluster
```shell
eksctl delete cluster <clusterName>
eksctl delete cluster eksdemo1
```

## 📝 Important Notes 📝

### Note-1: Rollback any Security Group Changes

- When we create an EKS cluster using `eksctl`, it creates the worker node security group with only port 22 access.
- During the course, we will be creating many **NodePort Services** to access and test our applications via a browser.
- If you have made any additional changes to the security group, rollback those changes before deleting the cluster.
- This ensures that the cluster can be deleted without any issues.

### Note-2: Rollback any EC2 Worker Node Instance Role - Policy changes

- During the "EBS Storage Section with EBS CSI Driver," we add a custom policy to the worker node IAM role.
- Before deleting the cluster, rollback any changes made to the worker node IAM role policies.
- This avoids any issues during cluster deletion.

Keep these important notes in mind to ensure smooth deletion of your EKS cluster and associated resources.
