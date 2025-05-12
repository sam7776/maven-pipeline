sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl restart docker
sudo systemctl daemon-reload
sudo systemctl start docker
sudo systemctl enable docker
sudo chown $USER /var/run/docker.sock
sudo chmod 666 /var/run/docker.sock
