# README

# User Campaign Manager

This project is a Ruby on Rails API application with a Vue.js frontend for managing users and their campaign lists. It uses Elasticsearch for efficient searching and is containerized using Docker and Docker Compose for easy setup and development.

## Prerequisites

Before you begin, ensure you have the following installed on your machine:

- Docker
- Docker Compose

## Setup

1. **Clone the repository:**

    ```sh
    git clone https://github.com/anshu1992/user_campaign_manager.git
    cd user_campaign_manager/
    ```

2. **Build the Docker containers:**

    ```sh
    docker compose --file=docker-compose.yml build
    ```

3. **Run the containers in daemon mode:**

    ```sh
    docker compose --file=docker-compose.yml up -d
    ```

## Seeding the Database

To seed the database with initial data:

1. **Run the seed command from your terminal:**

    ```sh
    docker compose exec web bundle exec rails db:seed
    ```

## Creating Elasticsearch Index

To create the Elasticsearch index for the User model and index all users in the table:

1. **Run the rake task:**

    ```sh
    docker compose exec web bundle exec rake elasticsearch:recreate_user_index
    ```

## Running the Application

The application should now be running and accessible at the following addresses:

- **Backend (Rails API)**: `http://localhost:3000`
- **Frontend (Vue.js)**: `http://localhost:5173`

## API Endpoints

### List Users

- **Endpoint**: `GET /users`
- **Description**: Retrieve all users from the database.

### Add New User

- **Endpoint**: `POST /users`
- **Description**: Add a new user to the database with name, email, and campaigns_list.
- **Request Body Example**:

    ```json
    {
      "user": {
        "name": "Alice",
        "email": "alice@gmail.com",
        "campaigns_list": [
          {"campaign_name": "cam4", "campaign_id": "id4"}
        ]
      }
    }
    ```

### Filter Users by Campaign Names

- **Endpoint**: `GET /users/filter`
- **Description**: Retrieve users whose campaigns_list contains any of the specified campaign names.
- **Query Parameters**: `campaign_names` (comma-separated list of campaign names)
- **Example**:

    ```sh
    GET /users/filter?campaign_names=cam1,cam2
    ```

## Frontend

The frontend is built with Vue.js and provides a simple UI to:

- List all users.
- Add new user records.
- Filter users by campaign names.
