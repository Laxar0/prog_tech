FROM python:3

ADD app.py /

EXPOSE 8080

CMD ["python", "./main.py"]