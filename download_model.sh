#!/bin/bash

# download_model.sh - Download model from Google Drive at runtime

MODEL_DIR="/app/model"
GDRIVE_FILE_ID="${GDRIVE_FILE_ID:-1t-X6C2vL94D-m4e2Thd2HDclcbaPLN47}"

echo "🔍 Checking for model files..."

if [ ! -d "$MODEL_DIR" ] || [ -z "$(ls -A $MODEL_DIR)" ]; then
    echo "📥 Model not found. Downloading from Google Drive..."
    echo "📍 File ID: $GDRIVE_FILE_ID"
    echo "⏱️  This may take 2-3 minutes on first startup..."
    
    # Download with fuzzy flag to handle Google's virus scan warning
    gdown --id "$GDRIVE_FILE_ID" --fuzzy -O /app/model.zip
    
    if [ $? -eq 0 ]; then
        echo "📦 Extracting model files..."
        unzip -q /app/model.zip -d /app/
        
        # Clean up zip file to save space
        rm /app/model.zip
        
        echo "✅ Model downloaded and extracted successfully!"
        echo "📊 Model size: $(du -sh $MODEL_DIR | cut -f1)"
    else
        echo "❌ Failed to download model from Google Drive"
        echo "🔧 Please check:"
        echo "   1. GDRIVE_FILE_ID environment variable is set correctly"
        echo "   2. Google Drive file is publicly accessible"
        echo "   3. Internet connection is stable"
        exit 1
    fi
else
    echo "✅ Model already exists at $MODEL_DIR"
    echo "📊 Model size: $(du -sh $MODEL_DIR | cut -f1)"
    echo "⏭️  Skipping download..."
fi

echo "🚀 Starting application..."
