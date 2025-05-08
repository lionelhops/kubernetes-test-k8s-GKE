FROM python:3.11-slim
WORKDIR /app
COPY . .
RUN pip install flask mysql-connector-python flask-cors
CMD ["python", "app.py"]
