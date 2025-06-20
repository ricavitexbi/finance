FROM python:3.10-slim
WORKDIR /app

# Copia o requirements unificado
COPY requirements.txt ./

# Instala dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia APIs e modelos
COPY ml/ ./ml
COPY ml_models/ ./ml_models

EXPOSE 8000
CMD ["uvicorn", "ml.cashflow.model:app", "--host", "0.0.0.0", "--port", "8000"]
