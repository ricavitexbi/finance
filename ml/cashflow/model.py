import joblib
from fastapi import FastAPI

app = FastAPI()

# Carrega o modelo pré-treinado
modelo = joblib.load("ml_models/cash_flow.pkl")

@app.get("/predict_cashflow/")
def predict(months: int = 1):
    """
    Retorna previsões de fluxo de caixa para os próximos 'months' meses.
    """
    preds = modelo.forecast(months)
    return {"predictions": preds.tolist()}
