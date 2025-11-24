#!/bin/bash

CONSUL_SERVER="192.168.32.140:8500"
HOST_IP=$(hostname -I | awk '{print $1}')

register_service() {
  local name=$1
  local port=$2
  local id="${name}-${HOST_IP}"

  echo "Registering service: ${name} (${HOST_IP}:${port})"

  curl -sf -X PUT "http://${CONSUL_SERVER}/v1/agent/service/register" \
    -d '{
      "ID": "'${id}'",
      "Name": "'${name}'",
      "Address": "'${HOST_IP}'",
      "Port": '${port}',
      "Check": {
        "TCP": "'${HOST_IP}:${port}'",
        "Interval": "10s",
        "Timeout": "1s"
      }
    }'
}

register_service "node-exporter" 9100

# cAdvisor (порт 8081)
# register_service "cadvisor" 8081

# RabbitMQ (порт 5672)
# register_service "rabbitmq" 5672

# rabbitmq_exporter (порт 9419)
# register_service "rabbitmq-exporter" 9419

# Nginx (порт 80)
register_service "nginx" 80

# nginx-prometheus-exporter (порт 9113)
register_service "nginx-exporter" 9113

echo "Registration complete."
