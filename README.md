# cloudformation-ec2-vpc

AWS CloudFormation script that creates SecurityGroup and an EC2 Instance with an Apache Webserver

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

`create.sh` - Shell script to run

`ec2-security-group-parameters.json` - Parameters for the Subnet, VPC and AMI

`ec2-security-group.yml` - AWS CloudFormation IaC Code

`LICENSE` - License

`README.md` - README file with instructions

## Requirements

* AWS Account Required

* AWS CLI installed

* AWS Default VPC with subnet created in account

## How to use

TBD


## Useful Links

* [AWS::EC2::Instance](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html)

* [CloudFormation User Guide](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html) 
