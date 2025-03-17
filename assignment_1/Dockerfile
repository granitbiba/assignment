FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the application files
COPY app.py requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 8080 for Flask
EXPOSE 8080

# Run the Flask application
CMD ["python", "app.py"]