# Proyecto Biblioteca Fullstack en Kubernetes sobre GKE

Este proyecto permite registrar y consultar libros desde un frontend web, pasando por un backend Flask y almacenando en una base de datos MySQL.

## 📦 Estructura
```
k8s_fullstack_example/
├── backend/
│   ├── app.py
│   └── Dockerfile
├── frontend/
│   ├── index.html
│   └── Dockerfile
├── mysql/
│   └── init.sql
└── k8s/
    ├── mysql-deployment.yaml
    ├── backend-deployment.yaml
    ├── frontend-deployment.yaml
    └── ingress.yaml
```

## 🚀 Instrucciones de despliegue

### 1. Crear el clúster en GKE
```bash
gcloud container clusters create my-cluster --num-nodes=3 --region=us-central1
gcloud container clusters get-credentials my-cluster --region=us-central1
```

### 2. Crear y subir imágenes
```bash
# Backend
cd backend
docker build -t gcr.io/PROJECT_ID/backend:v1 .
docker push gcr.io/PROJECT_ID/backend:v1

# Frontend
cd ../frontend
docker build -t gcr.io/PROJECT_ID/frontend:v1 .
docker push gcr.io/PROJECT_ID/frontend:v1
```

### CREAR ARBOL MYSQL

kubectl create configmap mysql-init --from-file=../mysql/init.sql

# verificar
kubectl get configmaps mysql-init
kubectl describe configmap mysql-init


### 3. Aplicar manifiestos de Kubernetes
```bash
cd ../k8s
kubectl apply -f mysql-deployment.yaml
kubectl apply -f backend-deployment.yaml
kubectl apply -f frontend-deployment.yaml
###  kubectl apply -f ingress-dom.yaml  
kubectl apply -f ingress-ip.yaml

```

### 4. Instalar NGINX Ingress Controller (si no está instalado)
```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.1/deploy/static/provider/cloud/deploy.yaml
```

### 5. Configurar DNS
- Obtén la IP externa del Ingress:

kubectl get svc -n ingress-nginx

  ```bash
  kubectl get ingress fullstack-ingress
  ```
- Asocia la IP a tu dominio (ej. `biblioteca.example.com`) o usa un servicio como `nip.io`.




### 6. Acceder a la aplicación

Visita: [http://biblioteca.example.com](http://biblioteca.example.com)

---

Este ejemplo muestra cómo una app completa puede comunicarse entre frontend, backend y base de datos en Kubernetes usando GKE e Ingress.
