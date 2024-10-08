
# PGVectorDB Boilerplate

A template to run a PostgreSQL database with `pgvector` for use with embeddings models.

## Prerequisites

Before using this template, ensure you have the following installed:

- Docker
- Docker Compose
- Visual Studio Code (VSCode)
- pgAdmin

## How to Run

1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   ```

2. **Navigate to the Root Directory**:
   ```bash
   cd pgvectordb-boilerplate
   ```

3. **Build and Run the Docker Containers**:
   ```bash
   docker-compose build
   docker-compose up
   ```
   This will create a `./data` folder in the root directory.

## How to Access the Database from pgAdmin

1. **Register a New Server** in pgAdmin:
   - **General**:
     - Name: `[insert your server name]`
   - **Connection**:
     - Hostname: `localhost`
     - Port: `5432`
     - Maintenance Database: `postgres`
     - Username: `admin`
     - Password: `admin`

2. **Connect** to the server using the credentials provided.

## **Tear down**

run the following command from the terminal: 
   ```bash
   docker-compose down
   ```