FROM cimg/python:3.9.4

COPY . .

# RUN python -m venv venv && \
#     source venv/bin/activate && \
#     python -m pip install --upgrade pip && \
#     python -m pip install "setuptools==57.4.0" && \
#     python -m pip install --upgrade wheel && \
#     pip install --use-feature=2020-resolver -e ".[dev]" && \
#     pip install -U spacy && \
#     python -m spacy download en_core_web_sm

RUN sudo apt-get update && \
    sudo apt-get install -y postgresql-client

CMD psql postgresql://test:test@postgres/sl_pg < .circleci/test-db/schema.sql
