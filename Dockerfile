# Use the official Python slim image as a base
FROM python:3.8-slim

# Set the working directory
WORKDIR /workspace

# Install build tools, compilers, and necessary packages
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    graphviz \
    && rm -rf /var/lib/apt/lists/*

# Install pylint and pyreverse via pip
RUN pip install pylint

# Install requirements from the provided requirements.txt file
COPY requirements.txt .
RUN pip install -r requirements.txt

# Expose the Jupyter Notebook port
EXPOSE 8888

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
