# inicio python

# Python base image
FROM python:3.11-alpine

# Set the working directory
WORKDIR /code

# Flask environment variables
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Update pip to the latest version
RUN pip install --no-cache-dir --upgrade pip

# Install required packages
RUN apk add --no-cache gcc musl-dev linux-headers

# Copy and install Python dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copy the application code
COPY . .

# Run the Flask app
CMD ["flask", "run", "--host=0.0.0.0"]

# Fin python
