# Proyecto Biblioteca Fullstack en Kubernetes sobre GKE

Este proyecto permite registrar y consultar libros desde un frontend web, pasando por un backend Flask y almacenando en una base de datos MySQL.

##  Estructura
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

##  Instrucciones de despliegue

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

### 3. Crear arbol MYSQL
```bash
# crear
cd ../mysql
kubectl create configmap mysql-init --from-file=init.sql

# verificar
kubectl get configmaps mysql-init
kubectl describe configmap mysql-init
```

### 4. Editar la ruta de las imagenes en los arcivos deployment

image: gcr.io/PROJECT_ID/frontend:v1

```
k8s_fullstack_example/
└── k8s/
    ├── backend-deployment.yaml
    └── frontend-deployment.yaml
```

### 5. Aplicar manifiestos de Kubernetes
```bash
cd ../k8s
kubectl apply -f mysql-deployment.yaml
kubectl apply -f backend-deployment.yaml
kubectl apply -f frontend-deployment.yaml

# Usar con dominio
kubectl apply -f ingress-dom.yaml  

# usar con IP
kubectl apply -f ingress-ip.yaml

```

### 6. Instalar NGINX Ingress Controller (si no está instalado)
```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.1/deploy/static/provider/cloud/deploy.yaml
```

### 7. Obtener IP (si se utilizo ingress-ip.yaml)
- Obtén la IP externa del Ingress:

  ```bash
  kubectl get svc -n ingress-nginx

  ```

### 8. Configurar DNS (si se utilizo ingress-dom.yaml)
- Obtén la IP externa del Ingress:

  ```bash
  kubectl get ingress fullstack-ingress
  ```
- Asocia la IP a tu dominio (ej. `biblioteca.example.com`) o usa un servicio como `nip.io`.

# Para realizar pruebas localmente

- Agrega el dominio a tu archivo host con la IP obenida de tu ingress.

IP-INGRESS biblioteca.example.com


### 9. Acceder a la aplicación

Visita: [http://biblioteca.example.com](http://biblioteca.example.com)

Visita: IP-INGRESS

---

Este ejemplo muestra cómo una app completa puede comunicarse entre frontend, backend y base de datos en Kubernetes usando GKE e Ingress.



# Fullstack Library Project on Kubernetes using GKE

This project allows you to register and query books from a web frontend, through a Flask backend, and store the data in a MySQL database.

##  Structure
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

##  Deployment Instructions

### 1. Create the Cluster in GKE
```bash
gcloud container clusters create my-cluster --num-nodes=3 --region=us-central1
gcloud container clusters get-credentials my-cluster --region=us-central1
```

### 2. Build and Push Images
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

### 3. Create MySQL Config
```bash
# Create
cd ../mysql
kubectl create configmap mysql-init --from-file=init.sql

# Verify
kubectl get configmaps mysql-init
kubectl describe configmap mysql-init
```

### 4. Edit Image Paths in Deployment Files

image: gcr.io/PROJECT_ID/frontend:v1

```
k8s_fullstack_example/
└── k8s/
    ├── backend-deployment.yaml
    └── frontend-deployment.yaml
```

### 5. Apply Kubernetes Manifests
```bash
cd ../k8s
kubectl apply -f mysql-deployment.yaml
kubectl apply -f backend-deployment.yaml
kubectl apply -f frontend-deployment.yaml

# Use with domain
kubectl apply -f ingress-dom.yaml  

# Use with IP
kubectl apply -f ingress-ip.yaml
```

### 6. Install NGINX Ingress Controller (if not installed)
```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.1/deploy/static/provider/cloud/deploy.yaml
```

### 7. Get External IP (if using ingress-ip.yaml)
- Retrieve the external IP of the Ingress:
  ```bash
  kubectl get svc -n ingress-nginx
  ```

### 8. Configure DNS (if using ingress-dom.yaml)
- Retrieve the external IP of the Ingress:
  ```bash
  kubectl get ingress fullstack-ingress
  ```
- Associate the IP with your domain (e.g., `biblioteca.example.com`) or use a service like `nip.io`.

# For Local Testing

- Add the domain to your hosts file with the IP obtained from your ingress.

```
IP-INGRESS biblioteca.example.com
```

### 9. Access the Application

Visit: [http://biblioteca.example.com](http://biblioteca.example.com)

Or visit: IP-INGRESS

---

This example shows how a complete application can communicate between frontend, backend, and database on Kubernetes using GKE and Ingress.




