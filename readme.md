🚀 PulseDesk AI — Customer Support Ticket Classifier

PulseDesk AI is a lightweight, production-ready machine-learning customer support classifier designed to automatically categorize incoming support messages into predefined ticket types.

It features:
	•	🔥 DistilBERT-based classifier (fine-tuned)
	•	🌐 Modern responsive UI
	•	🐳 Dockerized backend + frontend
	•	☁️ Live deployment on AWS EC2
	•	🔄 Fully automated CI/CD with GitHub Actions
	•	⚡ 1-click deploys on every push to main
	•	📈 Real-time prediction confidence
	•	🗂️ Ticket history + clearing

Live Demo
👉 http://23.23.72.235/

⸻

🧠 How PulseDesk AI Works
	1.	User enters a customer message.
	2.	The backend (/predict) loads the DistilBERT model and predicts:
	•	Category (e.g., Account, Technical, Payments, etc.)
	•	Confidence score
	•	Raw probability distribution
	3.	The UI displays the result + adds it to ticket history.
	4.	You can clear history instantly.

⸻

🏗️ Project Architecture

PulseDesk AI
│
├── Backend API  (FastAPI + DistilBERT)
│     ├── Dockerfile
│     ├── app/
│     │    ├── main.py
│     │    └── model loader + classifier
│     └── model/ (ignored in repo)
│
├── Frontend UI (HTML/CSS/JS)
│     ├── index.html
│     ├── Dockerfile
│     └── assets/
│
├── CI/CD (GitHub Actions)
│     └── deploy.yml
│
└── AWS EC2 Deployment
      ├── Backend → port 8000
      └── UI → port 80


⸻

🐳 Running Locally (Docker)

1. Build API

docker build -t pulsedesk-api .
docker run -p 8000:8000 pulsedesk-api

2. Build UI

docker build -t pulsedesk-ui ./ui
docker run -p 80:80 pulsedesk-ui


⸻

🌍 Live Deployment — AWS EC2

PulseDesk AI is deployed using:
	•	Amazon EC2 (Ubuntu)
	•	Docker Engine
	•	Automatically started with CI/CD
	•	Hosted at:

👉 http://23.23.72.235/

Every deployment includes:
	•	🚀 Build backend image
	•	🚀 Build UI image
	•	🔁 Stop old containers
	•	♻️ Prune unused images

No manual login needed.

⸻

🔄 CI/CD Pipeline (GitHub Actions)

Every push to main triggers the pipeline:

Set up job → Checkout → SSH Setup → Rsync to EC2 → Build images → Restart containers

Secrets used:

Name	Purpose
EC2_HOST	Public IP of server
EC2_USERNAME	Usually ubuntu
EC2_SSH_KEY	Private key for SSH auth

Pipeline file:
.github/workflows/deploy.yml

⸻

🧪 API Usage Example

POST /predict

curl -X POST "http://23.23.72.235:8000/predict" \
  -H "Content-Type: application/json" \
  -d '{"text": "My account is not working"}'

Sample response:

{
  "label": "Account",
  "confidence": 0.74,
  "all_probabilities": [0.74, 0.10, 0.08, 0.08]
}


⸻

📁 Repository Structure

.
├── app/
│   ├── main.py
│   ├── inference.py
│   ├── utils.py
│
├── ui/
│   ├── index.html
│   └── static/
│
├── Dockerfile
├── .dockerignore
├── .gitignore
├── README.md
└── .github/workflows/deploy.yml


⸻

🛑 Model Files & Deployment

The DistilBERT model is **automatically downloaded from Google Drive** during container startup.

### For Local Development:

**Option 1: Let Docker handle it (Recommended)**
```bash
docker build -t pulsedesk-api .
docker run -p 8000:8000 pulsedesk-api
```
The container will automatically download the model on first run.

**Option 2: Manual download**
```bash
# Install gdown
pip install gdown

# Download model
gdown 1t-X6C2vL94D-m4e2Thd2HDclcbaPLN47 --fuzzy -O model.zip
unzip model.zip
rm model.zip
```

### For Production Deployment:

The model is automatically downloaded during deployment via the `download_model.sh` script.

**GitHub Secrets Required:**
- `EC2_HOST` - Public IP of your server
- `EC2_USERNAME` - Usually `ubuntu`
- `EC2_SSH_KEY` - Private SSH key for authentication
- `GDRIVE_FILE_ID` - Google Drive file ID (default: `1t-X6C2vL94D-m4e2Thd2HDclcbaPLN47`)

### Deploying to Other Platforms:

This setup works on **any** platform that supports Docker:
- ✅ AWS ECS/Fargate, Lambda (via container)
- ✅ Google Cloud Run
- ✅ Azure Container Instances
- ✅ Railway, Render, Fly.io
- ✅ DigitalOcean App Platform
- ✅ Heroku Container Registry

Simply set the `GDRIVE_FILE_ID` environment variable during deployment.

⸻

🚀 Roadmap
	•	✔ Auto ticket flagging
	•	✔ Confidence scoring
	•	⬜ Admin dashboard
	•	⬜ Batch classification API
	•	⬜ Add email → ticket ingestion
	•	⬜ Add S3-hosted model versioning
	•	⬜ Migrate UI to React

⸻

👨🏾‍💻 Author

David Osei Kumi
AI/ML Engineer • Cloud Enthusiast • DevOps-in-Progress
GitHub: https://github.com/dkumi12/
