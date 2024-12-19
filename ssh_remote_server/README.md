# Linux Server Setup and SSH Configuration

This project focuses on learning and practicing the basics of Linux by setting up a remote Linux server and configuring SSH connections. By the end of this project, you will have a server that supports secure access via SSH keys.

---

## Requirements

1. **A Remote Host**:
   - Register and configure a Linux server on any cloud provider (e.g., [DigitalOcean](https://www.digitalocean.com/) or [AWS](https://aws.amazon.com/)).

2. **OpenSSH Server Installed on Remote Host**:
   - Ensure the OpenSSH server is installed on the remote host.
     ```bash
     sudo apt update && sudo apt install openssh-server -y
     ```

---

## Steps

### 1. Setup a Remote Host on AWS (Optional)

1. **Launch an EC2 Instance**:
   - Log in to your [AWS Management Console](https://aws.amazon.com/console/).
   - Navigate to **EC2** and click **Launch Instances**.
   - Select an Ubuntu AMI (Amazon Machine Image).
   - Choose the instance type (e.g., `t2.micro` for Free Tier).
   - Configure the instance with default VPC and subnet settings.
   - Add a Security Group that allows SSH access on port 22.
   - Generate or select an existing key pair for the instance.

2. **Retrieve the Public IP Address**:
   - After the instance launches, note the public IP address of the instance.

3. **Connect to the Instance**:
   - Use the key pair to SSH into the instance:
     ```bash
     ssh -i <path-to-key>.pem ubuntu@<instance-public-ip>
     ```

---

### 2. Create SSH Key Pairs

1. **Create First SSH Key Pair**:
   ```bash
   ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa_1st_key
   ```

2. **Create Second SSH Key Pair**:
   ```bash
   ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa_2nd_key
   ```

### 3. Update Public Keys to Remote Host

1. **Copy First Key to Remote Host**:
   ```bash
   ssh-copy-id -i ~/.ssh/id_rsa_1st_key.pub ubuntu@<server-ip>
   ```

2. **Copy Second Key to Remote Host**:
   ```bash
   ssh-copy-id -i ~/.ssh/id_rsa_2nd_key.pub ubuntu@<server-ip>
   ```

### 4. Test Access with Keys

1. **Check Access Using the First Key**:
   ```bash
   ssh -i ~/.ssh/id_rsa_1st_key ubuntu@<server-ip>
   ```

2. **Check Access Using the Second Key**:
   ```bash
   ssh -i ~/.ssh/id_rsa_2nd_key ubuntu@<server-ip>
   ```

### 5. Configure SSH to Allow Only Key-Based Authentication

1. **Edit the SSH Configuration File on Remote Host**:
   ```bash
   sudo nano /etc/ssh/sshd_config
   ```

2. **Update the Configuration to Match the Following**:
   ```
   PubkeyAuthentication yes
   AuthorizedKeysFile .ssh/authorized_keys
   ```

3. **Restart the SSH Service**:
   ```bash
   sudo systemctl restart ssh
   ```

### 6. Optional: Configure `~/.ssh/config` for Easier Access

1. **Edit the SSH Config File**:
   ```bash
   nano ~/.ssh/config
   ```

2. **Add Server Aliases**:
   ```
   Host aws-server-1
       HostName <aws-instance-public-ip>
       User ubuntu
       IdentityFile ~/.ssh/id_rsa_1st_key

   Host aws-server-2
       HostName <aws-instance-public-ip>
       User ubuntu
       IdentityFile ~/.ssh/id_rsa_2nd_key
   ```

3. **Save and Test**:
   - Connect using the alias:
     ```bash
     ssh aws-server-1
     ssh aws-server-2
     ```

### 7. Stretch Goal: Install and Configure `fail2ban`

1. **Install `fail2ban`**:
   ```bash
   sudo apt update && sudo apt install fail2ban -y
   ```

2. **Configure `fail2ban`**:
   - Copy the default configuration file:
     ```bash
     sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
     ```
   - Edit the `jail.local` file:
     ```bash
     sudo nano /etc/fail2ban/jail.local
     ```
     - Ensure SSH protection is enabled:
       ```
       [sshd]
       enabled = true
       ```

3. **Start and Enable `fail2ban`**:
   ```bash
   sudo systemctl start fail2ban
   sudo systemctl enable fail2ban
   ```

4. **Verify `fail2ban` Status**:
   ```bash
   sudo fail2ban-client status
   sudo fail2ban-client status sshd
   ```

---

## Outcome

- You should be able to SSH into your server using both key pairs.
- SSH is configured to allow only key-based authentication.
- (Optional) `fail2ban` is installed and configured to enhance server security.

---

Happy learning and practicing Linux basics!
