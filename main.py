from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "hello, world :)"}

@app.get("/version")
async def version():
    return {"version": "4.0.0"}

import uvicorn

if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)