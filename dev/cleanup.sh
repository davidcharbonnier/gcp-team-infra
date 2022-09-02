#!/bin/bash

for namespace in $(kubectl get ns -o json | jq -r '.items[].metadata.name')
do
  for pod in $(kubectl -n $namespace get po -o json | jq -r '.items[] | select(.status.phase != "Running") | .metadata.name')
  do 
    kubectl -n $namespace delete po $pod
  done
done
