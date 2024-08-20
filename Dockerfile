# Use the official Postgres image as a base image
FROM postgres:latest

# Set environment variables for Postgres
ENV POSTGRES_USER=admin
ENV POSTGRES_PASSWORD=admin
ENV POSTGRES_DB=postgres

# Install the build dependencies (if needed for extensions)
USER root
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    postgresql-server-dev-all \
    && rm -rf /var/lib/apt/lists/*

# Clone, build, and install the pgvector extension
RUN cd /tmp \
    && git clone --branch v0.5.0 https://github.com/pgvector/pgvector.git \
    && cd pgvector \
    && make \
    && make install

# Copy custom pg_hba.conf to the appropriate directory
COPY pg_hba.conf /docker-entrypoint-initdb.d/pg_hba.conf

# Ensure correct permissions
RUN chmod 644 /docker-entrypoint-initdb.d/pg_hba.conf

# Optionally, you can add a command to reload the configuration if needed
