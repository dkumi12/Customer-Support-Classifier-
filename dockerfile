# -------------------------------
# Base Image
# -------------------------------
FROM python:3.10

# -------------------------------
# Set Working Directory
# -------------------------------
WORKDIR /app

# -------------------------------
# Copy Requirements
# -------------------------------
COPY requirements.txt .

# -------------------------------
# Install Dependencies
# -------------------------------
RUN pip install --no-cache-dir -r requirements.txt

# -------------------------------
# Copy Application Files
# -------------------------------
COPY app.py /app/app.py

# Copy model folder into container
COPY model /app/model

# Create MLflow tracking directory
RUN mkdir -p /app/mlruns

# -------------------------------
# Expose API Port
# -------------------------------
EXPOSE 8000

# -------------------------------
# Run Application
# -------------------------------
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
