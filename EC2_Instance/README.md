# AWS EC2 Instance Setup and Static Website Deployment

This guide provides step-by-step instructions for setting up an EC2 instance on AWS and deploying a static website.

## Prerequisites

1. **AWS Account**: Create an [AWS account](https://aws.amazon.com/) if you don’t have one.
2. **AWS Management Console**: Familiarize yourself with the [AWS Management Console](https://aws.amazon.com/console/).

---

## Steps

### 1. Launch an EC2 Instance

1. **Login to AWS Management Console**
   - Navigate to the [EC2 dashboard](https://console.aws.amazon.com/ec2/).

2. **Create an Instance**
   - Click on **Launch Instance**.
   - Set the following configurations:
     - **AMI**: Select Ubuntu Server AMI (e.g., Ubuntu 20.04 LTS).
     - **Instance Type**: Choose `t2.micro` (eligible for AWS Free Tier).
     - **Network Settings**:
       - Use the default VPC and subnet for your region.
       - Ensure **Auto-assign Public IP** is enabled.
     - **Security Group**:
       - Allow inbound traffic on:
         - **Port 22** (SSH)
         - **Port 80** (HTTP)
     - **Key Pair**:
       - Create a new key pair or use an existing one for SSH access.

3. **Launch Instance**
   - Review the settings and click **Launch**.

### 2. Connect to Your EC2 Instance

1. **Download Key Pair**
   - Ensure you have the `.pem` file for your key pair.

2. **Connect Using SSH**
   - Run the following command in your terminal:
     ```bash
     ssh -i /path/to/your-key.pem ubuntu@<EC2-PUBLIC-IP>
     ```
   - Replace `<EC2-PUBLIC-IP>` with the public IP address of your instance.

### 3. Update System Packages and Install a Web Server

1. **Update System Packages**
   - Run:
     ```bash
     sudo apt update && sudo apt upgrade -y
     ```

2. **Install Nginx**
   - Run:
     ```bash
     sudo apt install nginx -y
     ```

3. **Start Nginx Service**
   - Run:
     ```bash
     sudo systemctl start nginx
     ```

### 4. Deploy a Static Website

1. **Create an HTML File**
   - Create a simple HTML file:
     ```bash
     echo "<html><body><h1>Welcome to Your Static Website!</h1></body></html>" | sudo tee /var/www/html/index.html
     ```

2. **Restart Nginx (if needed)**
   - Run:
     ```bash
     sudo systemctl restart nginx
     ```

### 5. Access Your Website

1. **Public IP Address**
   - Open a browser and navigate to `http://<EC2-PUBLIC-IP>`.
   - Replace `<EC2-PUBLIC-IP>` with your instance’s public IP.

You should see your static website displayed in the browser.

---

## Notes

- Ensure that your security group settings allow inbound HTTP traffic on port 80.
- Keep your `.pem` key file secure and do not share it.

## Cleanup

To avoid unnecessary charges:

1. Stop or terminate the EC2 instance when you’re done.
2. Delete any associated resources, such as the security group and key pair, if not needed.
