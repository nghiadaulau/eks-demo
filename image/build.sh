#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Usage: $0 <dockerhub_username> <dockerhub_password> <image_name>"
    echo "Example: $0 myusername mypassword aws-community-day-app"
    exit 1
fi

DOCKERHUB_USERNAME=$1
DOCKERHUB_PASSWORD=$2
IMAGE_NAME=$3
TAG="latest"
FULL_IMAGE_NAME="${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${TAG}"

echo "Building and pushing multi-architecture Docker image..."
echo "Image: ${FULL_IMAGE_NAME}"

echo "Logging in to Docker Hub..."
echo "${DOCKERHUB_PASSWORD}" | docker login -u "${DOCKERHUB_USERNAME}" --password-stdin

if [ $? -ne 0 ]; then
    echo "Failed to login to Docker Hub"
    exit 1
fi

echo "Setting up Docker buildx..."
docker buildx create --name multiarch-builder --use || docker buildx use multiarch-builder

echo "Building multi-architecture image..."
docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --tag "${FULL_IMAGE_NAME}" \
    --push \
    .

if [ $? -eq 0 ]; then
    echo "✅ Successfully built and pushed multi-architecture image: ${FULL_IMAGE_NAME}"
    echo "Supported architectures: linux/amd64, linux/arm64"
else
    echo "❌ Failed to build and push image"
    exit 1
fi

echo "Logging out from Docker Hub..."
docker logout

echo "🎉 Build and push completed successfully!"
