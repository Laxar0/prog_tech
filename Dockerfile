FROM python:3
WORKDIR /
EXPOSE 8080

RUN python main.py
