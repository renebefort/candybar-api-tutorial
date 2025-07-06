from fastapi import FastAPI, HTTPException, Query
from pydantic import BaseModel

app = FastAPI()

# Define the CandyBar model
class Candy(BaseModel):
    id: int
    name: str
    flavor: str
    price: float

# In-memory database for candy bars
candy_bar: dict[int, Candy] = {}

# Root endpoint
@app.get("/")
def root() -> dict[str, str]:
    return {"message": "Welcome to the CandyBar API"}

# Get all candy bars or filter by flavor
@app.get("/candybar", summary="Get all candies", tags=["CandyBar"])
def get_candy_bars(flavor: str = Query(None, description="Filter by flavor")) -> dict[str, dict[int, Candy]]:
    if flavor:
        filtered = {k: v for k, v in candy_bar.items() if v.flavor.lower() == flavor.lower()}
        return {"candies": filtered}
    return {"candies": candy_bar}

# Get a specific candy bar by ID
@app.get("/candybar/{candy_id}", summary="Get a candy by ID from the Candy Bar", tags=["Candy"])
def get_candy_bar(candy_id: int) -> Candy:
    if candy_id not in candy_bar:
        raise HTTPException(status_code=404, detail="Candy not found in the Candy Bar")
    return candy_bar[candy_id]

# Add a new candy bar
@app.post("/candybar", summary="Add a new candy to the Candy Bar", tags=["Candy"])
def add_candy_bar(candy: Candy) -> dict[str, str]:
    if candy.id in candy_bar:
        raise HTTPException(status_code=400, detail="Candy with this ID already exists")
    if candy.price >= 10:
        raise HTTPException(status_code=400, detail="Candy price must be less than 10")
    candy_bar[candy.id] = candy
    return {"message": "Candy added successfully to the Candy Bar"}

# Update an existing candy
@app.put("/candybar/{candy_id}", summary="Update a candy from the Candy Bar", tags=["Candy"])
def update_candy_bar(candy_id: int, candy: Candy) -> dict[str, str]:
    if candy_id not in candy_bar:
        raise HTTPException(status_code=404, detail="Candy not found")
    candy_bar[candy_id] = candy
    return {"message": "Candy updated successfully"}

# Delete a candy
@app.delete("/candybar/{candy_id}", summary="Delete a candy from the Candy Bar", tags=["Candy"])
def delete_candy_bar(candy_id: int) -> dict[str, str]:
    if candy_id not in candy_bar:
        raise HTTPException(status_code=404, detail="Candy not found")
    del candy_bar[candy_id]
    return {"message": "Candy deleted successfully"}