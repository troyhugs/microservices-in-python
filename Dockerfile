FROM python:3.12.0-alpine3.18
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY src src
EXPOSE 5005
HEALTHCHECK --interval=30s --timeout=30s --start-period=30s --retries=5 \
            CMD curl -f http://localhost:5005/health || exit 1
ENTRYPOINT [ "python3", "./src/app.py"]



