FROM python:3.8.8-slim

WORKDIR /usr/app/src

COPY pyproject.toml poetry.lock ./

RUN pip install poetry==1.1.5
RUN poetry config virtualenvs.create false \
    && poetry install

COPY app ./
COPY data ../

CMD ["sh", "-c", "streamlit run --server.port $PORT /usr/app/src/main.py"]