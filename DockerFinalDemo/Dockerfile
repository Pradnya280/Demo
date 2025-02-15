# Use an official lightweight Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy only requirements first (better caching)
COPY requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Now copy the rest of the app
COPY . /app/

# Create a non-root user and switch to it
RUN useradd -m flaskuser
USER flaskuser

# Expose port 5000 (optional, just for documentation)
EXPOSE 5000

# Command to run the app
CMD ["python", "app.py"]
