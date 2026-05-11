import pandas as pd
import os
import glob
from sqlalchemy import create_engine, text

DB_URL = "postgresql://postgres:willis@localhost:5432/cyclistic"
CSV_FOLDER = "/Users/willis/1_Programming/cyclistic_case_study/data/raw"

def load_all_files():
    files = sorted(glob.glob(os.path.join(CSV_FOLDER, "2025*.csv")))

    if not files:
        return

    engine = create_engine(DB_URL)        

    total_rows = 0
    for i, filepath in enumerate(files, 1):
        filename = os.path.basename(filepath)
        print(f"\n [{i}/{len(files)}] Loading {filename}...")

        df = pd.read_csv(filepath)
        df.to_sql("trips", con=engine, if_exists="append", index=False)
        
        total_rows += len(df)
        print(f" Done - {len(df):,} rows (total so far: {total_rows:,})")

    print(f"\n All files loaded. Total rows insertedL {total_rows:,}")

    with engine.connect() as conn:
        result = conn.execute(text("SELECT COUNT(*) FROM trips")).fetchone()
        print(f"Rows confirmed in database: {result[0]:,}")

if __name__ == "__main__":
    load_all_files()