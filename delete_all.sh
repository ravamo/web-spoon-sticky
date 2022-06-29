#!/bin/bash

kubectl delete -f .
kubectl delete configmap webspoon-config-cm
kubectl delete secret webspoon-secret
