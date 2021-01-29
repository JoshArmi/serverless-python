FROM python:alpine3.12

WORKDIR /usr/src/app

COPY . .

RUN pip install pipenv && pipenv lock -r > requirements.txt && pip install -r requirements.txt

EXPOSE 8080

CMD exec gunicorn --bind :8080 --workers 1 --threads 8 --timeout 0 app:app
