#!/bin/bash

# Apache Tomcat Installation Script

# STEP 1: Install Java (Tomcat requires Java to run)
sudo dnf install -y java-17-amazon-corretto
java -version


# STEP 2: Create a dedicated tomcat user (security best practice)
# -r : system user
# -m : create home directory
# -s : disable shell login
sudo useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat


# STEP 3: Download Apache Tomcat
# Download the required Tomcat version from Apache
cd /tmp
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.113/bin/apache-tomcat-9.0.113.tar.gz

# STEP 4: Extract Tomcat to /opt/tomcat
# --strip-components=1 removes the top-level directory
sudo mkdir -p /opt/tomcat
sudo tar -xzf apache-tomcat-9.0.102.tar.gz -C /opt/tomcat --strip-components=1


# STEP 5: Set ownership to tomcat user
# This ensures Tomcat runs with correct permissions
sudo chown -R tomcat:tomcat /opt/tomcat


# STEP 6: Create a systemd service file for Tomcat
# File location: /etc/systemd/system/tomcat.service
# (Service file creation is intentionally documented, not automated)


# STEP 7: Reload systemd to recognize the Tomcat service
# sudo systemctl daemon-reload


# STEP 8: Start and enable Tomcat service
# sudo systemctl start tomcat
# sudo systemctl enable tomcat


# STEP 9: Verify Tomcat is running
# systemctl status tomcat
# or
# systemctl is-active tomcat


# STEP 10: Access Tomcat in browser
# http://<server-ip>:8080

echo "Tomcat installation steps completed/documented. Happy Hosting!"

