#! /bin/bash
# Instance Identity Metadata Reference - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-identity-documents.html
sudo su
yum update -y
yum install -y httpd
systemctl enable httpd
service httpd start  
echo '<h1>Welcome to StackSimplify - APP-1</h1>' |  tee /var/www/html/index.html
mkdir /var/www/html/app1
echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>Welcome to Sanjeev Terraform practice - APP-1</h1> <p>Terraform Demo</p> <p>Application Version: V1</p> </body></html>' |  tee /var/www/html/app1/index.html
# curl http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/app1/metadata.html
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` 
curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/app1/metadata.html

# the write to file metadata.html seems not working when passed from here
# however, the commands in test-metadata.sh file is working when explicitly run from within the instance. 

