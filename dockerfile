# -------------------------------
# Base Image
# -------------------------------
FROM python:3.10-slim

# -------------------------------
# Set Working Directory
# -------------------------------
WORKDIR /app

# -------------------------------
# Install system dependencies
# -------------------------------
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# -------------------------------
# Copy Requirements First (for layer caching)
# -------------------------------
COPY requirements.txt .

# -------------------------------
# Install Python Dependencies
# -------------------------------
RUN pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir gdown

# -------------------------------
# Copy Application Files ONLY
# (No model download during build)
# -------------------------------
COPY app.py /app/app.py
COPY download_model.sh /app/download_model.sh

# Make download script executable
RUN chmod +x /app/download_model.sh

# Create MLflow tracking directory
RUN mkdir -p /app/mlruns

# -------------------------------
# Expose API Port
# -------------------------------
EXPOSE 8000

# -------------------------------
# Run Application
# Download model at RUNTIME (not build time), then start server
# -------------------------------
CMD ["/bin/bash", "-c", "/app/download_model.sh && uvicorn app:app --host 0.0.0.0 --port 8000"]
