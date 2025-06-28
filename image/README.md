# AWS Community Day 2025 Flask Application

A simple Flask web application that displays "Hello AWS Community Day 2025!" message.

## 🚀 Features

- Simple Flask web application
- Health check endpoint
- Docker containerization
- Multi-architecture support (AMD64 & ARM64)

## 📁 Project Structure

```
image/
├── main.py          # Flask application
├── req.txt          # Python dependencies
├── Dockerfile       # Docker configuration
├── build.sh         # Build and push script
└── README.md        # This file
```

## 🛠️ Local Development

### Prerequisites

- Python 3.11+
- pip

### Installation

1. **Navigate to the image directory:**
   ```bash
   cd image
   ```

2. **Install dependencies:**
   ```bash
   pip install -r req.txt
   ```

3. **Run the application:**
   ```bash
   python main.py
   ```

4. **Access the application:**
   - Main page: http://localhost:8080
   - Health check: http://localhost:8080/health

## 🐳 Docker Usage

### Build Docker Image

1. **Build the image:**
   ```bash
   docker build -t aws-community-day-app .
   ```

2. **Run the container:**
   ```bash
   docker run -p 8080:8080 aws-community-day-app
   ```

3. **Access the application:**
   - Main page: http://localhost:8080
   - Health check: http://localhost:8080/health

### Build and Push to Docker Hub

Use the provided build script to build and push multi-architecture images to Docker Hub:

```bash
./build.sh <dockerhub_username> <dockerhub_password> <image_name>
```

**Example:**
```bash
./build.sh myusername mypassword aws-community-day-app
```

This will:
- Build images for both AMD64 and ARM64 architectures
- Push to Docker Hub as `myusername/aws-community-day-app:latest`
- Automatically handle Docker Hub authentication

## 🔧 API Endpoints

| Endpoint | Method | Description | Response |
|----------|--------|-------------|----------|
| `/` | GET | Main page | "Hello AWS Community Day 2025!" |
| `/health` | GET | Health check | `{"status": "healthy"}` |

## 🏗️ Multi-Architecture Support

The application supports multiple CPU architectures:
- **linux/amd64**: For x86_64 systems
- **linux/arm64**: For ARM64 systems (Apple Silicon, ARM servers)

## 📋 Requirements

- **Python**: 3.11+
- **Flask**: 3.0.0
- **Docker**: For containerization
- **Docker Hub account**: For pushing images

## 🔍 Troubleshooting

### Common Issues

1. **Port already in use:**
   ```bash
   # Use a different port
   docker run -p 8081:8080 aws-community-day-app
   ```

2. **Docker build fails:**
   - Ensure Docker is running
   - Check if all files are present in the image directory

3. **Docker Hub push fails:**
   - Verify Docker Hub credentials
   - Check internet connection
