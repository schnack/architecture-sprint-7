#!/usr/bin/env sh

# Роль разработчиков
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: PropDevelopment
  name: dev
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "list", "watch"]
EOF

# Роль DevOps специалистов
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: PropDevelopment
  name: devops
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["create", "delete", "list"]
EOF

# Роль ИБ
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: PropDevelopment
  name: security
rules:
- apiGroups: [""]
  resources: ["secrets"]
  verbs: ["get", "list"]
EOF