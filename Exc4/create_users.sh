#!/usr/bin/env sh

# Пользователь разработчик
openssl genrsa -out user1.key 2048
openssl req -new -key user1.key -out user1.csr -subj "/CN=user1/O=PropDevelopment"

cat <<EOF | kubectl apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: user1-csr
spec:
  request: $(cat user1.csr | base64 | tr -d '\n')
  signerName: kubernetes.io/kube-apiserver-client
  usages:
  - client auth
EOF

kubectl certificate approve user1-csr

kubectl get csr user1-csr -o jsonpath='{.status.certificate}' | base64 --decode > user1.crt

# Пользователь DevOps
openssl genrsa -out user2.key 2048
openssl req -new -key user2.key -out user2.csr -subj "/CN=user2/O=PropDevelopment"

cat <<EOF | kubectl apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: user2-csr
spec:
  request: $(cat user2.csr | base64 | tr -d '\n')
  signerName: kubernetes.io/kube-apiserver-client
  usages:
  - client auth
EOF

kubectl certificate approve user2-csr

kubectl get csr user2-csr -o jsonpath='{.status.certificate}' | base64 --decode > user2.crt

# ИБ
openssl genrsa -out user3.key 2048
openssl req -new -key user3.key -out user3.csr -subj "/CN=user3/O=PropDevelopment"

cat <<EOF | kubectl apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: user3-csr
spec:
  request: $(cat user3.csr | base64 | tr -d '\n')
  signerName: kubernetes.io/kube-apiserver-client
  usages:
  - client auth
EOF

kubectl certificate approve user3-csr

kubectl get csr user3-csr -o jsonpath='{.status.certificate}' | base64 --decode > user3.crt
