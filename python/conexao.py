import mysql.connector
import pandas as pd

def carregar_corridas():
    con = mysql.connector.connect(
        host="localhost",
        user="root",
        password="123@",
        database="logistica_99"
    )

    df = pd.read_sql("SELECT * FROM corridas", con)
    con.close()
    return df

# --- CHAMADA DA FUNÇÃO ---
df = carregar_corridas()
print(df)
