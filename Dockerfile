# Usa una imagen base oficial de Python
FROM python:3.9-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos requeridos
COPY requirements.txt requirements.txt

# Instala las dependencias
RUN pip install -r requirements.txt

# Copia el resto de los archivos
COPY . .

# Expone el puerto en el que la aplicación se ejecutará
EXPOSE 5000

# Define el comando por defecto para ejecutar la aplicación
CMD ["python", "app.py"]
