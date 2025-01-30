#!/usr/bin/env sh

# Разработчик-User1
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: dev-role-binding
  namespace: PropDevelopment
subjects:
- kind: User
  name: user1
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: dev
  apiGroup: rbac.authorization.k8s.io
EOF

# DevOps-User2
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: devops-role-binding
  namespace: PropDevelopment
subjects:
- kind: User
  name: user2
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: devops
  apiGroup: rbac.authorization.k8s.io
EOF


# Security-User3
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: security-role-binding
  namespace: PropDevelopment
subjects:
- kind: User
  name: user3
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: security
  apiGroup: rbac.authorization.k8s.io
EOF