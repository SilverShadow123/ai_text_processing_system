from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel, EmailStr
import httpx
import uuid
import os
from dotenv import load_dotenv

load_dotenv()

app = FastAPI(title="AI Text Processing API")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

N8N_WEBHOOK_URL = os.getenv("N8N_WEBHOOK_URL")


class ProcessRequest(BaseModel):
    email: EmailStr
    text: str = ""
    url: str = ""


@app.get("/")
def root():
    return {"status": "AI Text Processing API is running"}


@app.post("/process")
async def process(request: ProcessRequest):

    # Validate — must have either text or url
    if not request.text.strip() and not request.url.strip():
        raise HTTPException(
            status_code=400,
            detail="Either text or url must be provided"
        )

    # Generate unique session ID
    session_id = str(uuid.uuid4())[:8]

    # Build payload for n8n
    payload = {
        "email": request.email,
        "text": request.text.strip(),
        "url": request.url.strip(),
        "session_id": session_id,
    }

    # Forward to n8n webhook
    try:
        async with httpx.AsyncClient(timeout=30.0) as client:
            response = await client.post(N8N_WEBHOOK_URL, json=payload)
            response.raise_for_status()
    except httpx.TimeoutException:
        raise HTTPException(status_code=504, detail="n8n workflow timed out")
    except httpx.HTTPError as e:
        raise HTTPException(status_code=502, detail=f"n8n error: {str(e)}")

    return {
        "success": True,
        "session_id": session_id,
        "message": "Processing started. Check your email shortly."
    }
