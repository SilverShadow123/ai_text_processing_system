# 🤖 AI Text Processing System

> A comprehensive AI-powered text processing platform with a modern Flutter frontend and FastAPI backend, integrated with N8N for advanced workflow automation.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-3.11+-blue.svg)](https://flutter.dev/)
[![Python](https://img.shields.io/badge/Python-3.8+-green.svg)](https://www.python.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-Latest-green.svg)](https://fastapi.tiangolo.com/)

## 📹 Demo Video

<video width="100%" controls>
  <source src="ai-text-processing-demo.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>

**Direct Download**: [ai-text-processing-demo.mp4](ai-text-processing-demo.mp4)

## Overview

The **AI Text Processing System** is a full-stack application that enables users to process text content through AI-powered workflows. Users can input text directly or provide a URL, and the system will process the content through an automated N8N workflow, delivering processed results via email.

### Key Capabilities
- ✨ **Text Input Processing**: Direct text input processing with real-time feedback
- 🌐 **URL-based Processing**: Automatic content extraction from URLs
- 📧 **Email Delivery**: Automatic email notifications with processed results
- 🎨 **Modern UI**: Beautiful Flutter-based mobile and desktop interface
- ⚡ **High Performance**: Built with FastAPI for rapid API response times
- 🔄 **N8N Integration**: Powerful workflow automation using N8N platform

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────┐
│                  Flutter Frontend                        │
│        (Mobile, Desktop, Web Applications)               │
└──────────────────────┬──────────────────────────────────┘
                       │ HTTP/REST API
┌──────────────────────▼──────────────────────────────────┐
│               FastAPI Backend                            │
│          (Python REST API Server)                        │
├──────────────────────────────────────────────────────────┤
│  • Request validation (Pydantic)                         │
│  • CORS enabled for cross-origin requests                │
│  • Session management & UUID generation                  │
│  • N8N webhook integration                               │
└──────────────────────┬──────────────────────────────────┘
                       │ Webhook
┌──────────────────────▼──────────────────────────────────┐
│               N8N Workflow                               │
│     (Text Processing & Automation Pipeline)              │
├──────────────────────────────────────────────────────────┤
│  1. Webhook Trigger                                      │
│  2. URL Content Extraction (HTTP Request)                │
│  3. HTML Parsing & Text Cleaning (JavaScript)            │
│  4. Merge & Route Processing                             │
│  5. Email Notification                                   │
└──────────────────────────────────────────────────────────┘
```

---

## 🚀 Features

### Frontend (Flutter)
- 📱 Cross-platform support (iOS, Android, Web, Windows, macOS)
- 🎯 Intuitive user interface with mode toggle (Text/URL)
- 📝 Input validation and error handling
- 🔔 Real-time status updates
- 🎨 Dark theme with custom color scheme
- ⚙️ State management using GetX pattern

### Backend (FastAPI)
- 🔐 CORS middleware for secure cross-origin requests
- ✅ Request validation using Pydantic models
- 📨 Email integration support
- 🔗 N8N webhook integration
- 🆔 Session tracking with UUID generation
- 🌍 RESTful API design

### Workflow (N8N)
- 🌐 HTTP request handling for URL-based content
- 📄 HTML parsing and text extraction
- 🧹 Content cleaning and normalization
- 📤 Email notification delivery
- 🔀 Conditional routing and branching

---

## 🛠️ Tech Stack

### Frontend
- **Flutter** 3.11+ - Cross-platform mobile/desktop framework
- **GetX** 4.7.3 - State management and routing
- **Dio** 5.9.2 - HTTP client for API communication

### Backend
- **Python** 3.8+
- **FastAPI** - Modern async web framework
- **Uvicorn** - ASGI web server
- **Pydantic** - Data validation using Python type annotations
- **HTTPX** - Async HTTP client
- **python-dotenv** - Environment configuration management

### Workflow Automation
- **N8N** - Visual workflow builder and automation platform

---

## 📋 Prerequisites

### System Requirements
- **Python**: 3.8 or higher
- **Flutter**: 3.11.4 or higher
- **Node.js/N8N**: For workflow automation
- **Git**: For version control

### Environment Setup
- An N8N instance running (self-hosted or cloud)
- Email service configured (SMTP)
- Internet connection for API calls

---

## ⚙️ Installation & Setup

### Backend Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/AITextProcessingSystem.git
   cd AITextProcessingSystem
   ```

2. **Create a Python virtual environment**
   ```bash
   python -m venv venv
   
   # On Windows:
   venv\Scripts\activate
   
   # On macOS/Linux:
   source venv/bin/activate
   ```

3. **Install dependencies**
   ```bash
   cd backend
   pip install -r requirements.txt
   ```

4. **Configure environment variables**
   ```bash
   # Create a .env file in the backend directory
   cat > .env << EOF
   N8N_WEBHOOK_URL=your_n8n_webhook_url_here
   EOF
   ```

5. **Run the FastAPI server**
   ```bash
   python main.py
   ```
   The API will be available at: `http://localhost:8000`
   
   📚 **API Documentation**: Visit `http://localhost:8000/docs` (Swagger UI)

### Frontend Setup

1. **Navigate to the frontend directory**
   ```bash
   cd frontend
   ```

2. **Get Flutter dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure API endpoint**
   - Update the backend URL in `lib/services/api_services.dart` to match your backend server

4. **Run the Flutter app**
   ```bash
   # For development (Android/iOS)
   flutter run
   
   # For web
   flutter run -d web
   
   # For Windows
   flutter run -d windows
   
   # For macOS
   flutter run -d macos
   ```

---

## 📱 Usage

### Step-by-Step Guide

1. **Launch the Application**
   - Start the Flutter app on your preferred platform

2. **Select Processing Mode**
   - Toggle between **Text Input** and **URL Input** modes

3. **Enter Your Data**
   - **Text Mode**: Paste or type the text you want to process
   - **URL Mode**: Provide a URL to extract and process content from

4. **Provide Email Address**
   - Enter your email address to receive the processed results

5. **Submit for Processing**
   - Click the "Submit" button to start processing
   - Wait for the success confirmation

6. **Receive Results**
   - Check your email for the processed content

### API Endpoints

#### Health Check
```
GET /
Response: {"status": "AI Text Processing API is running"}
```

#### Process Text/URL
```
POST /process
Content-Type: application/json

Request Body:
{
  "email": "user@example.com",
  "text": "Your text here (optional)",
  "url": "https://example.com (optional)"
}

Response:
{
  "session_id": "abc12345",
  "status": "Processing started",
  "message": "Your request is being processed. Results will be sent to your email."
}
```

**Note**: Either `text` or `url` must be provided, but not both empty.

---

## 📁 Project Structure

```
AITextProcessingSystem/
├── backend/
│   ├── main.py              # FastAPI application & route definitions
│   ├── requirements.txt      # Python dependencies
│   └── .env                 # Environment configuration (create this)
│
├── frontend/
│   ├── lib/
│   │   ├── main.dart        # App entry point & theme configuration
│   │   ├── bindings/
│   │   │   └── app_binding.dart    # GetX dependency injection
│   │   ├── controllers/
│   │   │   └── process_controllers.dart  # Business logic
│   │   ├── screens/
│   │   │   └── home_screen.dart    # Main UI screen
│   │   ├── services/
│   │   │   └── api_services.dart   # API communication
│   │   └── widgets/
│   │       ├── input_field.dart    # Text input widget
│   │       ├── mode_toggle.dart    # Mode selector widget
│   │       ├── submit_button.dart  # Submit action widget
│   │       └── success_card.dart   # Success display widget
│   ├── pubspec.yaml         # Flutter dependencies & project config
│   ├── analysis_options.yaml # Lint rules configuration
│   └── [platform-specific]/  # iOS, Android, Windows, macOS, Web
│
├── AI text processing workflow.json  # N8N workflow export
├── README.md                # This file
└── .gitignore             # Git ignore rules
```

---

## 🔄 N8N Workflow Details

The N8N workflow handles the following operations:

1. **Webhook Trigger**: Listens for incoming requests from FastAPI
2. **Conditional Routing**: Branches based on whether URL or text input is provided
3. **URL Content Extraction**: 
   - Fetches content from provided URLs
   - Extracts and cleans HTML content
4. **Text Normalization**:
   - Removes HTML tags
   - Decodes HTML entities
   - Collapses whitespace
5. **Data Merging**: Combines all data with processed text
6. **Email Notification**: Sends processed results to user's email

**To import the workflow:**
1. Open your N8N instance
2. Go to Workflows → Import
3. Select the `AI text processing workflow.json` file
4. Configure your email node with SMTP credentials
5. Deploy the workflow

---

## 🐛 Troubleshooting

### Backend Issues

**Port already in use (8000)**
```bash
# Use a different port
python -c "import uvicorn; uvicorn.run('main:app', host='0.0.0.0', port=8001)"
```

**N8N webhook not triggering**
- Verify the webhook URL in `.env`
- Check N8N instance is running and accessible
- Review N8N logs for error messages

**CORS errors**
- Ensure frontend URL is correct in backend
- Check CORS middleware configuration in `main.py`

### Frontend Issues

**"Failed to connect to backend"**
- Verify backend is running at the configured URL
- Check network connectivity
- Ensure API endpoint in `api_services.dart` is correct

**Flutter dependencies not found**
```bash
flutter clean
flutter pub get
```

**Build errors**
```bash
flutter clean
flutter pub upgrade
```

---

## 🔐 Security Considerations

- **CORS**: Currently allows all origins. Update before production:
  ```python
  allow_origins=["https://yourdomain.com"]
  ```

- **Environment Variables**: Never commit `.env` file
  - Add to `.gitignore`
  - Use secure secret management in production

- **Email Validation**: Uses Pydantic's `EmailStr` for validation

- **Input Validation**: All inputs validated before N8N processing

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. **Fork the repository**
   ```bash
   git clone https://github.com/yourusername/AITextProcessingSystem.git
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes**
   - Follow existing code style
   - Add comments for complex logic
   - Update tests if applicable

4. **Commit your changes**
   ```bash
   git commit -m "Add: description of your changes"
   ```

5. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```

6. **Submit a Pull Request**
   - Provide a clear description of changes
   - Reference any related issues

### Code Style Guidelines
- **Python**: Follow PEP 8
- **Flutter/Dart**: Follow Flutter style guide
- **Commits**: Use conventional commit messages

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## 👥 Author

**Your Name/Organization**

- GitHub: [@yourusername](https://github.com/yourusername)
- Email: your.email@example.com

---

## 🙏 Acknowledgments

- [Flutter](https://flutter.dev/) - For the amazing cross-platform framework
- [FastAPI](https://fastapi.tiangolo.com/) - For the modern Python web framework
- [N8N](https://n8n.io/) - For visual workflow automation
- [GetX](https://github.com/jonataslaw/getx) - For state management

---

## 📞 Support

For issues, questions, or suggestions:

1. **Open an Issue**: [GitHub Issues](https://github.com/yourusername/AITextProcessingSystem/issues)
2. **Discussions**: [GitHub Discussions](https://github.com/yourusername/AITextProcessingSystem/discussions)
3. **Email**: taosifseaum@gmail.com

---

## 🔄 Roadmap

- [ ] Add user authentication & profiles
- [ ] Implement batch processing
- [ ] Add advanced text analysis (sentiment, keywords)
- [ ] Support multiple language processing
- [ ] Create mobile app for iOS/Android
- [ ] Add API rate limiting
- [ ] Implement caching mechanism
- [ ] Create admin dashboard

---

**Last Updated**: May 13, 2026