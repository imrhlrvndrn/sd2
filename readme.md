# Managed Databases w/ Sequelize ORM

Here’s a sample `README.md` for your repository:

# Express Server with Sequelize & Supabase Starter Template

This repository provides a starter template for building an Express server that connects to a Supabase database using Sequelize ORM. This template is designed to help students get started quickly with building and extending the server by providing a pre-configured setup, including migrations, seeders, and an empty user model.

## Table of Contents

-   [Getting Started](#getting-started)
-   [Project Structure](#project-structure)
-   [Setup Instructions](#setup-instructions)
-   [Tasks](#tasks)
-   [Available Scripts](#available-scripts)

## Getting Started

To get started with this project, fork the repository to your own GitHub account, then clone it to your local machine.

```bash
git clone https://github.com/your-username/repo-name.git
cd repo-name
```

## Project Structure

```plaintext
.
├── config
│   └── config.js        # Sequelize configuration file
├── migrations
│   └── <timestamp>-create-user.js  # Migration file for the User model
├── models
│   ├── index.js           # Sequelize initialization file
│   └── user.js            # Empty User model (to be defined by students)
├── seeders
│   └── <timestamp>-user-seeder.js  # Seeder file for the User model
├── lib
│   └── index.js           # Where you will instantiate your models and add custom logic
├── .env.example           # Example environment variables file
├── index.js               # Entry point of the Express server
└── package.json           # Node.js dependencies and scripts
```

## Setup Instructions

### 1. Install Dependencies

Before you start, make sure you have Node.js and npm installed. You can install the project dependencies by running:

```bash
npm install
```

## Tasks

1. **Define the User Model:** Fill out the `models/user.js` file with appropriate fields.
2. **Instantiate Models:** Create instances of your model in `lib/index.js` and explore Sequelize's features.
3. **Build Endpoints:** Create RESTful endpoints in `index.js` to interact with your User model.
4. **Run Migrations:** Apply the database migrations using Sequelize CLI.

## Available Scripts

-   `npm start` - Start the Express server.
-   `npm run migrate` - Run Sequelize migrations and create tables in Supabase DB
-   `npm run seed` - Seed the database with data.
