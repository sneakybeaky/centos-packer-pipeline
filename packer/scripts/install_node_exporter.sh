#!/usr/bin/env bash
set -e
set -x

adduser -r prometheus

mkdir -p /opt/prometheus/node_exporter

cd /opt/prometheus/node_exporter

mv /tmp/node-exporter-release/node_exporter-*.linux-amd64.tar.gz node_exporter.tgz
rm -rf  /tmp/node-exporter-release

tar xzvf node_exporter.tgz --strip 1

cat << EOF > /etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter

[Service]
User=prometheus
ExecStart=/opt/prometheus/node_exporter/node_exporter

[Install]
WantedBy=default.target
EOF

systemctl daemon-reload
systemctl enable node_exporter.service
systemctl start node_exporter.service

