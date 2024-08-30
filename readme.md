# Connect PostgreSQL DB w/ PGAdmin on Docker

This repository provides a simple setup to run PostgreSQL and pgAdmin using Docker. It includes a `docker-compose.yml` file to manage the services and an `init.sql` file to initialize the PostgreSQL database with predefined schemas or data.

## Getting Started

These instructions will help you set up the PostgreSQL database and pgAdmin on your local machine using Docker.

### Prerequisites

Ensure you have the following installed on your machine:

-   [Docker](https://www.docker.com/get-started)
-   [Docker Compose](https://docs.docker.com/compose/install/)

### Directory Structure

```
├── docker-compose.yml
└── init.sql
```

-   **docker-compose.yml**: This file defines the services for PostgreSQL and pgAdmin, their respective configurations, and how they interact with each other.
-   **init.sql**: SQL script that initializes the PostgreSQL database with the required schema or data.

### Installation and Usage

Follow these steps to get the PostgreSQL and pgAdmin services running:

1. **Clone the repository**:

    ```bash
    git clone https://github.com/yourusername/your-repo-name.git
    cd your-repo-name
    ```

2. **Place your SQL initialization script**:

    If you haven't done so already, place your SQL script in the `init.sql` file to set up the initial database schema or data.

3. **Start the services**:

    Run the following command to start PostgreSQL and pgAdmin:

    ```bash
    docker compose up -d
    ```

    This command will download the necessary Docker images (if not already downloaded) and start the containers.

4. **Accessing PostgreSQL**:

    PostgreSQL will be accessible on port `5432`. You can connect to it using any PostgreSQL client. The default credentials are defined in the `docker-compose.yml` file.

    ```yaml
    POSTGRES_USER: admin
    POSTGRES_PASSWORD: admin
    POSTGRES_DB: postgres
    ```

    These can be changed according to your requirements.

5. **Accessing pgAdmin**:

    pgAdmin will be accessible at `http://localhost:8080`. Use the credentials provided in the `docker-compose.yml` file to log in:

    ```yaml
    PGADMIN_DEFAULT_EMAIL: admin@gmail.com
    PGADMIN_DEFAULT_PASSWORD: admin
    ```

    After logging in, you can set up a server connection to your PostgreSQL instance using the credentials defined above.

6. **Stopping the services**:

    To stop the running containers, execute:

    ```bash
    docker compose down
    ```

    This will stop and remove the containers but will keep the data intact.

### Troubleshooting

-   **Container Fails to Start**: Ensure that the ports `5432` and `8080` are not already in use. You may also need to check the logs of the containers to debug issues:

    ```bash
    docker compose logs
    ```

-   **Database Not Initialized**: Make sure your `init.sql` script is valid and correctly placed in the root directory of the repository.
