"""Simple FastAPI app that recommends the closest movie from a list."""

from typing import Dict, List, Tuple, Union

from fastapi import FastAPI
from pydantic import BaseModel
from rapidfuzz import process

app = FastAPI()
API_VERSION = "1.0.0"

MOVIE_LIST = ["Space Odyssey", "Gladiator", "7 years in Tibet"]


class RecommendRequest(BaseModel):
    movie: List[str]


def recommend_movie(text: str) -> Tuple[str, float]:
    """Return the best match and its score for `text` against MOVIE_LIST.

    Uses rapidfuzz.process.extractOne which returns (match, score, index).
    """
    best = process.extractOne(text, MOVIE_LIST)
    return (best[0], float(best[1]))


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

