FROM python:3.9

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app


ENV NEW_RELIC_CONFIG_FILE=/code/newrelic.ini 

CMD ["newrelic-admin", "run-program", "uvicorn", "app.main:f_app", "--host", "0.0.0.0", "--port", "8080"]
