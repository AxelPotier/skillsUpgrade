import os
import sys
from fastapi.testclient import TestClient

# Ensure the package root (software_engineering) is on sys.path so tests can import `src`
ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
if ROOT not in sys.path:
    sys.path.insert(0, ROOT)

from src.movie_recommendations import app

client = TestClient(app)

def test_health():
    r = client.get("/health")
    assert r.status_code == 200
    assert r.json()["status"] == "ok"

def test_recommend():
    r = client.post("/recommend", json={"movie": ["Space Odysse"]})
    assert r.status_code == 200
    data = r.json()
    assert "Space Odysse" in data
    assert isinstance(data["Space Odysse"]["match"], str)
    assert isinstance(data["Space Odysse"]["score"], (int, float))