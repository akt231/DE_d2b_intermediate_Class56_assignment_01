# Use the official Ubuntu as the base image
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required packages
RUN apt-get update -y && apt-get install -y \
    python3 \
    python3-pip

# Copy your Python application code to the container
COPY hello.py /app/hello.py
COPY overridehello.py /app/overridehello.py

# Set the working directory
WORKDIR /app

# Install Python dependencies (if you have a requirements.txt file)
# RUN pip3 install -r requirements.txt

# Command to run your Python program
CMD ["python3", "hello.py"]