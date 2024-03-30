from fastapi.testclient import TestClient
from httpx import AsyncClient
import pytest
from app.main import app

client = TestClient(app)

@pytest.mark.asyncio
async def test_read_main():
    async with AsyncClient(app=app, base_url="http://test") as ac:
        response = await ac.get("/")
    assert response.status_code == 200
    assert response.json() == {"Hello": "World"}
