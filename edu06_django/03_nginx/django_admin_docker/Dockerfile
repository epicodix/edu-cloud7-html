# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set environment variables to ensure Python runs in an unbuffered mode
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install git for cloning the repository
RUN apt-get update && apt-get install -y git

# Set the working directory in the container
WORKDIR /app

# Clone the repository into the working directory
RUN git clone https://github.com/eugen1j/django-admin-example.git .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Copy the entrypoint script that will set up and run the app
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Run the entrypoint script when the container launches
ENTRYPOINT ["/app/entrypoint.sh"]
