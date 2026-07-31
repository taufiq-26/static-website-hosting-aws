# Static Website Hosting on AWS

A static website hosted on AWS using EC2, VPC, S3, and IAM — built to practice core cloud infrastructure and security concepts.

## What it does
Hosts a simple HTML website on an EC2 instance inside a custom VPC. Images are stored in S3 and fetched securely using an IAM role (no hardcoded credentials).

## AWS Services Used
- **VPC** – custom network with a public subnet
- **EC2** – runs the web server (Apache)
- **Security Group** – firewall rules (HTTP open, SSH restricted to my IP)
- **IAM Role** – lets EC2 access S3 securely
- **S3** – stores website images


## How I built it
1. Created a VPC with a public subnet + Internet Gateway
2. Set up a Security Group (allow HTTP/SSH)
3. Created an IAM Role with S3 read access
4. Launched an EC2 instance and installed Apache via a startup script
5. Uploaded images to S3 and pulled them into the server


## What I learned
- How VPC networking (subnets, IGW, routing) works
- Why IAM roles are safer than hardcoded AWS keys
- Difference between Security Groups and NACLs
- Basics of automating server setup with a startup script

## Tech Stack
`AWS` `EC2` `VPC` `S3` `IAM` 
