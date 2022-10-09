This project contains Google Cloud resources and Kubernetes deployment files. In order to deploy our application successfully, numerical order needs to be followed (01,02,03,04).

Before running scripts, create Service Account and place it under root folder.
If you don't want to create service account, you can download gcloud cli and run 'gcloud auth application-default login' command, it will automatically use your GCP credentials to provision resources.

- On the 01-state/ folder, we are provisioning Cloud Storage bucket for storing remote state files.
- On the 02-network/ folder, we are configuring our VPC and subnets which GKE will be deployed in.
- 03-gke/ folder contains revelant scripts to provision Private Google Kubernetes Engine cluster.
- And finally 04-nginx/ folder. It contains Kubernetes Deployment and Service manifests, for deploying nginx:alpine image to the private cluster which we have created on 3rd step.

02-network, 03-gke and 04-nginx terraform scripts have their remote backend located on Google Cloud Storage.

#Questions
- Discuss briefly the pros an cons of the chosen solution. What benefits does it have? What kind of limitations or tradeoffs?

Pros

- Private cluster doesn’t assign public IP addresses to the nodes and the master node which is Google-managed communicates with nodes via VPC peering. It reduces the attack surface and the risk of compromising the workloads. This also creates the need to reserve static IP and network range.
- Terraform lets us, script once and use that code multiple times, thus, saving time and effort while keeping complete control. If we want to provision development and production environment seperately, we just can use terraform workspaces and provision them faster.
- Using a managed Kubernetes cluster like GKE will provide us with less workload on the infrastructure side. It will offer a more dynamic environment in terms of scalability and security. But this will also reduce our control over the cluster.
- I used least privilege principle while provisioning.

Cons

- Terraform does not support GitOps on default, when we deleted any resource by accident from console, this can cause trouble.
- Using Terraform while running Kubernetes deployments can be limiting in many ways. Using CD tools for this can offer us a more comprehensive capability for application management.

How would you expand this solution to a real world production deployment, taking into consideration the sensitive nature of healthcare sector and its strict compliance and data security requirements?

At the moment We only have one environment. I'd start with creating Development and Staging environment. Deployment to the production environment would only possible with CI/CD pipeline and Kubernetes manifests would be controlled with Helm charts. The locations of data centers may be regulated in some cases. For these cases, it may be necessary to store data in certain edge locations. There are a number of technical requirements that practices in the health sector must comply with. Firewall rules, malware scans, virus protection and updating the software when required are the essential steps of protection of personal data against cyber attacks. For this reason, access to databases should be restricted and audited. The data held in these databases should be masked and anonymized. The network where the application is located should be checked regularly and subjected to penetration tests.

ISO/IEC 27001 outlines and provides the requirements for an information security management system, specifies a set of best practices, and details the security controls that can help manage information risks. Google Cloud services are certified as ISO/IEC 27001 compliant. Storing sensitive data on Google Cloud Platform would comply with data security requirements.
