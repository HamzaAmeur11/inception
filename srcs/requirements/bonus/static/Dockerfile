FROM debian:stable

RUN apt update -y

RUN apt install -y python3 python3-pip python3.11-venv
RUN python3 -m venv /venv
ENV PATH="/env/bin:$PATH"

COPY static/ .
COPY server.py .

RUN /venv/bin/pip install Flask

EXPOSE 8080

CMD ["python3", "server.py"]