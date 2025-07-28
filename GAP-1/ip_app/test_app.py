import uvicorn
import psycopg2 as pg

from fastapi import FastAPI
from subprocess import check_output

conn = pg.connect(dbname="postgres",
                      user="postgres",
                      password="qwerty123",
                      host="pgsql",
                      port="5432")
cur = conn.cursor()
conn.autocommit = True

def get_ip():
    res = check_output(["hostname" , "-i"]).decode("utf-8")
    cur.execute(f"INSERT INTO history VALUES (gen_random_uuid(), '{res}')")
    return res

def pgql_creation():
    cur.execute("CREATE TABLE IF NOT EXISTS history("
                "id UUID NOT NULL,"
                "text VARCHAR(500)"
                ");")

app = FastAPI()

@app.get("/")
async def get():
    return {"ip": get_ip()}

if __name__ == '__main__':
    pgql_creation()
    uvicorn.run(app, host='0.0.0.0', port=7000)