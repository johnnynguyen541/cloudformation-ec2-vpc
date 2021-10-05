# cloudformation-ec2-vpc

AWS CloudFormation script that creates SecurityGroup and an EC2 Instance with an Apache Webserver

## Diagram

![AWS CloudFormation - Draw.io Diagram](https://github.com/johnnynguyen541/cloudformation-ec2-vpc/blob/main/docs/infrastructure-diagram.png?raw=true)

## Constraints

**Resource 1 - AWS::EC2::SecurityGroup**
* Only allows inbound access on TCP port 80
* Allows unrestricted outbound access

**Resource 2 - AWS::EC2::Instance**
* Associate its network interface with security group
* Instance type - t3.micro
    * AMI ID of the base Amazon Linux 2 AMI (HVM), SSD Volume Type
* AssociatePublicIpAddress is True 
    * [server gets assigned a public IP address that you can reach over the internet to verify it’s working correctly.]
* Automatically run script at time of provisioning EC2 instance
    * Apache Web Server software deploy
    * User Data script

        UserData:
            Fn::Base64: !Sub |
                #!/bin/bash
                sudo yum update -y
                sudo yum install -y httpd
                sudo systemctl start httpd
                sudo systemctl enable httpd

## Project Files

`docs/cli-example.txt` - CLI example

`img` - Project Images

`create.sh` - Create AWS CloudFormation Stack

`ec2-security-group-parameters.json` - Parameters for the Subnet, VPC and AMI

`ec2-security-group.yml` - AWS CloudFormation IaC Code

`LICENSE` - License

`README.md` - README file with instructions

`update.sh` - Update AWS CloudFormation Stack

## Requirements

* AWS Account Required

* AWS CLI installed

* AWS Default VPC with subnet created in account

## How to use

See `cli-example.txt` for example run.

To create stack:

`./create.sh [STACK_NAME]] ec2-security-group.yml ec2-security-group-parameters.json`

Check Status:

`aws cloudformation describe-stacks --stack-name [STACK_NAME]`

Access port 80 using http:

`curl http://[EC2-PUBLIC-IP]`

Delete Stack:

`aws cloudformation delete-stack --stack-name ec2-sec-stack`

## Useful Links

* [AWS::EC2::Instance](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html)

* [CloudFormation User Guide](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html) 
