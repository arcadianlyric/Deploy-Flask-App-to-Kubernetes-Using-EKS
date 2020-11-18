FROM python:3.7-stretch

COPY . /app
WORKDIR /app

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
# RUN brew install jq


ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]

