# PulseDesk AI  
An AI-powered customer support ticket classifier built with **DistilBERT**, **FastAPI**, **Docker**, and **AWS EC2**.  
PulseDesk AI automatically analyzes customer messages and assigns them to the correct support category such as **Technical**, **Billing**, **Account**, or **General**.

This improves support workflow efficiency, automates triage, and gives teams a fast, intelligent system for prioritizing issues.

---

## 🌍 Live Demo

### **PulseDesk AI UI**  
**http://23.23.72.235/**  
✓ Fully deployed on AWS EC2  
✓ Dockerized UI and API  
✓ Real-time classification  

### **API Endpoint**  
http://23.23.72.235:8000/predict

Send JSON such as:

```json
{
  "text": "I can't access my account"
}


⸻

✨ Key Features

🤖 AI-Powered Classification
	•	Built on fine-tuned DistilBERT
	•	Predicts support categories with confidence scores
	•	Handles noisy or incomplete messages

⚡ FastAPI Backend
	•	/predict endpoint
	•	JSON in, structured prediction out
	•	Highly optimized, production-ready

🎨 Clean User Interface
	•	Modern UI for testing classifications
	•	Ticket history
	•	Auto-scrolling + color-coded labels
	•	“Clear history” feature

🐳 Containerized Deployment
	•	Dockerized API
	•	Dockerized UI
	•	Fast deploy, consistent environment

☁️ Cloud Hosted
	•	Deployed on AWS EC2
	•	Publicly available
	•	Ready for CI/CD (GitHub Actions → EC2)

⸻

🏗 Project Structure

pulse-desk-ai/
│── app.py                 # FastAPI backend
│── requirements.txt       # Python dependencies
│── Dockerfile             # Backend Docker file
│── ui/                    # Frontend UI
│── model/ (excluded)      # Model stored on EC2, not in repo
│── README.md
└── .gitignore


⸻

🔥 How It Works

1️⃣ User enters a support message

Example:

“My login isn’t working”

2️⃣ FastAPI receives the message

Located at /predict

3️⃣ DistilBERT model processes it

Loaded directly from the EC2 filesystem (not GitHub)

4️⃣ PulseDesk AI outputs

{
  "label": "account",
  "confidence": 0.92
}

5️⃣ UI updates history
	•	Shows prediction
	•	Saves ticket temporarily
	•	Allows clearing tickets with one click

⸻

🐳 Running Locally With Docker

Build the backend

docker build -t pulsedesk-api .

Run API

docker run -d -p 8000:8000 --name pulsedesk pulsedesk-api

Run UI

docker run -d -p 80:80 --name pulsedesk-ui groupd-ui:latest

Visit:

http://localhost


⸻

🧪 API Usage Example

curl -X POST "http://23.23.72.235:8000/predict" \
  -H "Content-Type: application/json" \
  -d '{"text":"The app is not sending confirmation emails"}'


⸻

📚 Technologies Used

Layer	Technology
Model	DistilBERT (fine-tuned)
Backend	FastAPI
Frontend	HTML/JS/CSS
Container	Docker
Cloud	AWS EC2
Versioning	Git & GitHub
Deployment	Manual or CI/CD


⸻

🚀 Future Improvements
	•	GitHub Actions CI/CD pipeline
	•	Email / Slack integration
	•	Admin dashboard
	•	Multi-label classification
	•	Automatic knowledge-base suggestions
	•	User authentication for teams

⸻

👤 Author

David Osei Kumi
Cloud Engineer • AI/ML Developer
GitHub: https://github.com/dkumi12
LinkedIn: https://www.linkedin.com/in/david-osei-kumi/

⸻

🏁 Final Notes

PulseDesk AI is a production-deployed prototype demonstrating:
	•	Real-world ML model deployment
	•	End-to-end infrastructure
	•	Dockerized API + UI
	•	Cloud hosting
	•	Practical AI for business support systems


