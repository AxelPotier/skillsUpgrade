"""Pure domain logic for movie recommendations — no web framework dependency."""

from typing import Tuple

from rapidfuzz import process

MOVIE_LIST = ["Space Odyssey", "Gladiator", "7 years in Tibet"]


def recommend_movie(text: str) -> Tuple[str, float]:
    """Return the best match and its score for `text` against MOVIE_LIST.

    Uses rapidfuzz.process.extractOne which returns (match, score, index).
    """
    best = process.extractOne(text, MOVIE_LIST)
    return (best[0], float(best[1]))
