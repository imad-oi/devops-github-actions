FROM python:3.9-slim

WORKDIR /app

# Install MySQL client dependencies
RUN apt-get update && \
    apt-get install -y default-libmysqlclient-dev pkg-config build-essential && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]