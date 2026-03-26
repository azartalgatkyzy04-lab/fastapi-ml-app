FROM python:3.10-slim
# FROM — қай базалық образды қолданамыз
# python:3.10-slim — жеңіл Python 3.10 образы (аз орын алады)

WORKDIR /app
# WORKDIR — контейнер ішінде жұмыс папкасын /app деп белгілейміз

COPY requirements.txt .
# COPY — requirements.txt файлын контейнерге көшіреміз

RUN pip install --no-cache-dir -r requirements.txt
# RUN — контейнер ішінде команда орындаймыз
# --no-cache-dir — кэшсіз орнату, образ өлшемін кішірейтеді

COPY . .
# Қалған барлық файлдарды (main.py, model.pkl) контейнерге көшіреміз

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
# CMD — контейнер іске қосылғанда орындалатын команда
# port 8080 — Cloud Run міндетті түрде 8080 портын күтеді
