cat <<EOF | tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF
sleep 5


yum install yum-utils -y

yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo


yum install containerd.io -y

CONTAINDERD_CONFIG_PATH=/etc/containerd/config.toml && \
rm "${CONTAINDERD_CONFIG_PATH}" && \
containerd config default > "${CONTAINDERD_CONFIG_PATH}" && \
sed -i "s/SystemdCgroup = false/SystemdCgroup = true/g"  "${CONTAINDERD_CONFIG_PATH}"

sleep 5

systemctl enable --now containerd && \
systemctl restart containerd
sleep 5

echo "containerd installation completed"