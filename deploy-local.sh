#!/bin/bash
kubectl config use-context k3d-micro-shop-local 
docker build -t ui:latest -f docker/micro-shop-products.Dockerfile . --no-cache
k3d image import --cluster micro-shop-local ui:latest
kubectl rollout restart deployment ui-deployment -n default