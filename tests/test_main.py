from fastapi.testclient import TestClient
from app.main import app

def test_read_main():
    with TestClient(app) as client:
        response = client.get("/")
        assert response.status_code == 200
        assert response.json() == {"Hello": "World"}
