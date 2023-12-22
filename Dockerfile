FROM python:3

ARG JAR_FILE=*.py
COPY ${JAR_FILE} app.py
EXPOSE 8080
CMD ["python", "./main.py"]
