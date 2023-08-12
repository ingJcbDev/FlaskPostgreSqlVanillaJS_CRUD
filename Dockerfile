# inicio python

# Python base image
FROM python:3.7-alpine

# Set the working directory
WORKDIR /code

# Flask environment variables
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

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


