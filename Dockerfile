FROM python:3.12-slim

WORKDIR /app

RUN apt-get update && apt-get install -y gcc libpq-dev

COPY . .

RUN pip install uv

RUN uv pip install --system django djangorestframework django-cors-headers psycopg[binary]
EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]