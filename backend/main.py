from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import Optional

app = FastAPI(title="InternShield API")

# Allows Member 1's app to talk to your server
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"], 
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Defines the exact data coming from Member 1
class JobRequest(BaseModel):
    url: Optional[str] = ""
    text: str

@app.post("/analyze")
async def analyze_job(request: JobRequest):
    # Dummy data for Member 1 to build the UI right now
    return {
        "score": 82,
        "risk": "HIGH",
        "red_flags": [
            "Registration fee requested",
            "Bank details requested",
            "Guaranteed internship"
        ],
        "positive_signals": [
            "HTTPS enabled"
        ],
        "recommendation": "Verify the employer independently before proceeding. Do not make payments."
    }

@app.get("/")
async def root():
    return {"message": "InternShield Backend is Running!"}