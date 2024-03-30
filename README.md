# FastAPI Microservice Skeleton

This project is a basic skeleton for building microservices using FastAPI, designed to run in Docker containers. It's optimized for production environments with a focus on asynchronous functions for efficient I/O operations.

#### Project Structure

Here's an overview of the project structure:

- `/app`: Contains the FastAPI application code.
  - `__init__.py`: Allows Python to recognize the directory as a package.
  - `main.py`: The entry point to the FastAPI app, defining routes and logic.
- `/tests`: Houses test suites for the application.
  - `__init__.py`: Allows Python to recognize the directory as a package.
  - `test_main.py`: Contains test cases for the app functionality.
- `Dockerfile`: Instructions for Docker to build the application image.
- `docker-compose.yml`: Defines and runs multi-container Docker applications.
- `requirements.txt`: Lists the Python dependencies needed for the app.
- `README.md`: Provides documentation for the project (this file).

#### Getting Started

To run this project, you'll need Docker installed on your system. If you're new to Docker, it's a platform that allows you to package your application and its dependencies into a container, which can run on any system that supports Docker. This ensures consistency across different development and deployment environments.

### Building and Running with Docker

#### Build the Docker Image

_Note: Replace `fastapi-microservice` with the name of your service._

Navigate to the project root in your terminal and run:

`docker build -t fastapi-microservice .`

This command tells Docker to build an image from the Dockerfile in the current directory, tagging it (-t) as fastapi-microservice.

#### Run the Docker Container

After the image is built, start a container from that image:

`docker run -d --name myfastapiapp -p 8000:80 fastapi-microservice`
Here, -d runs the container in detached mode (in the background), --name assigns a name to the container, and -p maps port 80 in the container to port 8000 on your host.

##### Access the Application

Visit [localhost:8000](localhost:8000) in your web browser to access the FastAPI application.

You can also view the SwaggerUI generated docs at [localhost:8000/docs](localhost:8000/docs).

#### Using Docker Compose

Alternatively, you can use Docker Compose to build and start the service:

`docker-compose up --build`
This command reads the docker-compose.yml file and sets up the application according to its specifications.

#### Running Tests

This project uses pytest and pytest-asyncio for testing. To run the tests, ensure you have the test dependencies installed and execute:

`pytest` in the project root. This will discover and run all tests in the /tests directory.
