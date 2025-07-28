FROM python:3.12-alpine
LABEL author="developer"

COPY . /app
WORKDIR /app
USER root
RUN pip install "fastapi[standard]" psycopg2-binary && apk add --update curl 

CMD ["python3", "test_app.py"]

