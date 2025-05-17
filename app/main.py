import logging
import os
from typing import Any, Dict, List

from fastapi import FastAPI, HTTPException
from pydantic import BaseModel


logger = logging.getLogger("uvicorn")
logger.setLevel(logging.INFO)


f_app = FastAPI()



class HelloResponseModel(BaseModel):
    hello: str


@f_app.get("/hello/{name}")
def hello(name: str) -> HelloResponseModel:
    return HelloResponseModel(hello=name)
