# 1) Imagem base
FROM python:3.10-slim

# 2) Diretório de trabalho
WORKDIR /app

# 3) Copia somente o requirements de todas as APIs
COPY ml/cashflow/requirements.txt ml/anomalies/requirements.txt ./

# 4) Instala dependências
RUN pip install --no-cache-dir -r requirements.txt

# 5) Copia o código das APIs e os modelos treinados
COPY ml/ ./ml
COPY ml_models/ ./ml_models

# 6) Expõe a porta que o Uvicorn vai usar
EXPOSE 8000

# 7) Comando padrão para iniciar o servidor
CMD ["uvicorn", "ml.cashflow.model:app", "--host", "0.0.0.0", "--port", "8000"]
