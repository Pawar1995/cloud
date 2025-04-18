#!/bin/bash

# Exit on any error
set -e

echo "📦 Updating system packages..."
sudo apt update

echo "☕ Installing Java (OpenJDK 11)..."
sudo apt install -y openjdk-11-jdk

echo "🔑 Adding Jenkins repository key..."
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "📚 Adding Jenkins repository to sources.list.d..."
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "🔄 Updating package list (with Jenkins repo)..."
sudo apt update

echo "⬇️ Installing Jenkins..."
sudo apt install -y jenkins

echo "🚀 Starting Jenkins service..."
sudo systemctl start jenkins

echo "🔄 Enabling Jenkins to start on boot..."
sudo systemctl enable jenkins

echo "✅ Jenkins installation complete!"
echo "🌐 Access it at: http://your-server-ip:8080"

echo "🔑 To unlock Jenkins, use the following command:"
echo "    sudo cat /var/lib/jenkins/secrets/initialAdminPassword"

