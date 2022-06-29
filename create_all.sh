#!/bin/bash
echo "kubctl create configmap"
kubectl create configmap webspoon-config-cm \
  --from-file=config/web.xml \
  --from-file=config/catalina.policy \
  -n webspoon 

echo "Check security.xml"
[ ! -s config/security.xml ] && cp config/security.xml{.back,}

echo "create secret"
kubectl create secret generic webspoon-secret \
  --from-file=config/security.xml \
  -n webspoon

echo "apply"
kubectl apply -f .

kubectl get all -n webspoon
