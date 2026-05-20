import pandas as pd
from sqlalchemy import create_engine
from dotenv import load_dotenv
import os
load_dotenv()

# =========================
# LOAD CSV
# =========================

file_path = r"dataset/DataCoSupplyChainDataset.csv"

df = pd.read_csv(
    file_path,
    encoding='latin1'
)

print("DATA LOADED")
print(df.head())

print("\nROWS & COLUMNS:")
print(df.shape)

print("\nCOLUMN NAMES:")
print(df.columns)

# =========================
# POSTGRES CONNECTION
# =========================

username = os.getenv("DB_USER")
password = os.getenv("DB_PASSWORD")
host = os.getenv("DB_HOST")
port = os.getenv("DB_PORT")
database = os.getenv("DB_NAME")

engine = create_engine(
    f'postgresql+psycopg2://{username}:{password}@{host}:{port}/{database}'
)

# =========================
# EXPORT TO POSTGRES
# =========================

df.to_sql(
    'supply_chain_data',
    engine,
    if_exists='replace',
    index=False
)

print("\nSUCCESS: Data imported to PostgreSQL")