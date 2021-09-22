FROM python:3.9.2

WORKDIR /myapp
COPY pyproject.toml .
COPY poetry.toml .
COPY poetry.lock .

RUN pip install poetry
RUN poetry install --no-dev

COPY . /myapp

EXPOSE 5002

ENTRYPOINT [ "poetry", "run"]
CMD ["gunicorn", "-b0.0.0.0:5002", "app:app" ]