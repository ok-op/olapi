FROM python:3.9-slim

   # Install system dependencies
   RUN apt-get update && apt-get install -y python3-distutils

   # Copy your application code
   COPY . /app
   WORKDIR /app

   # Install Python dependencies
   RUN pip install --no-cache-dir -r requirements.txt

   # Expose the port your app runs on
   EXPOSE 5000

   # Run your application
   CMD ["gunicorn", "api.index:app", "--bind", "0.0.0.0:5000"]
