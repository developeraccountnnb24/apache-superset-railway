FROM apache/superset:latest

USER root

# Install system dependencies for database drivers
RUN apt-get update && apt-get install -y --no-install-recommends \
    pkg-config \
    libmariadb-dev \
    default-libmysqlclient-dev \
    libpq-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install database drivers using uv pip (official method for Superset 4+)
SHELL ["/bin/bash", "-c"]
RUN source /app/.venv/bin/activate && \
    uv pip install --no-cache \
    psycopg2-binary \
    mysqlclient

# Copy configuration files
COPY config/superset_init.sh /app/superset_init.sh
RUN chmod +x /app/superset_init.sh

COPY config/superset_config.py /app/superset_config.py
ENV SUPERSET_CONFIG_PATH=/app/superset_config.py

USER superset

ENTRYPOINT ["/app/superset_init.sh"]
