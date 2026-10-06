"""FastAPI app exposing the movie recommendation endpoints."""

from typing import Dict, List, Union

from fastapi import FastAPI
from pydantic import BaseModel

from .domain import recommend_movie

app = FastAPI()
API_VERSION = "1.0.0"


class RecommendRequest(BaseModel):
    movie: List[str]


@app.get("/health")
def get_health():
    return {"status": "ok", "version": API_VERSION}


@app.post("/recommend")
async def recommend_movies(request: RecommendRequest) -> Dict[str, Dict[str, Union[str, float]]]:
    """Accepts JSON like {"movie": ["some title", ...]} and returns recommendations.

    Response format: { "input title": {"match": "Best Match", "score": 95.0}, ... }
    """
    result: Dict[str, Dict[str, float]] = {}
    for movie in request.movie:
        match_title, score = recommend_movie(movie)
        result[movie] = {"match": match_title, "score": score}
    return result
