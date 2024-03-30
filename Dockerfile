# Use the official Python image from the Docker Hub
FROM python:3-slim

# Set the working directory in the container
WORKDIR /code

# Copy the dependencies file to the working directory
COPY requirements.txt .

# Install any dependencies
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Copy the content of the local src directory to the working directory
COPY ./app /code/app

# Command to run the application using Gunicorn with Uvicorn workers. This command starts Gunicorn with:
# - "app.main:app" tells Gunicorn to load the FastAPI app from main.py in the app directory
# - "-w 4" sets the number of worker processes for handling requests. 2-4 x (number of CPU cores) is a common rule of thumb for the number of workers to use.
# - "-k uvicorn.workers.UvicornWorker" specifies to use Uvicorn's ASGI workers to run the app, combining Gunicorn's ability to manage multiple workers with Uvicorn's async capabilities
# - "--bind 0.0.0.0:80" binds Gunicorn to port 80 on all network interfaces, allowing the container to listen for incoming requests on port 80
CMD ["gunicorn", "app.main:app", "-w", "4", "-k", "uvicorn.workers.UvicornWorker", "--bind", "0.0.0.0:80"]
