#!/bin/bash

OUTDIR=${1:-build}
mkdir -p "$OUTDIR"

OUTPUT=$OUTDIR/gluster-exporter.service

cat >"$OUTPUT" <<EOF
[Unit]
Description=Gluster Prometheus Exporter

[Service]
ExecStart=${SBINDIR}/gluster-exporter --config=${SYSCONFDIR}/gluster-exporter/gluster-exporter.toml
KillMode=process
StartLimitInterval=60
StartLimitBurst=5
Restart=on-failure
RestartSec=10s
MemoryLimit=100M

[Install]
WantedBy=multi-user.target

EOF
