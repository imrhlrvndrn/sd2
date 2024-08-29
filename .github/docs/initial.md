# Setting up Express API w/ Supabase DB & Sequelize ORM

[Back to main doc](../../readme.md)

I'll walk you through setting up an Express.js API that connects to a Supabase PostgreSQL database using Sequelize ORM. This will cover everything from initializing Sequelize, defining models, and connecting to the Supabase database.

## Step 1: Set Up Your Project

1. **Initialize your project**:

    ```bash
    mkdir express-supabase-sequelize
    cd express-supabase-sequelize
    npm init -y
    ```

2. **Install necessary dependencies**:

    ```bash
    npm install express sequelize pg cors dotenv
    npm install --save-dev sequelize-cli nodemon
    ```

## Step 2: Initialize Sequelize

1. **Initialize Sequelize**:

    ```bash
    npx sequelize-cli init
    ```

    This command creates the following structure in your project:

    ```
    config/
      config.js
    models/
      index.js
    migrations/
    seeders/
    ```

## Step 3: Configure Sequelize to Connect to Supabase

1. **Create a `.env` file** in the root of your project to store your Supabase connection details:

    ```plaintext
    DB_USER=your_supabase_user
    DB_PASSWORD=your_supabase_password
    DB_NAME=your_supabase_db_name
    DB_HOST=your_supabase_host
    DB_PORT=5432
    PORT=3000
    ```

2. **Configure Sequelize** to use these environment variables by editing `config/config.js`:

    ```javascript
    require('dotenv').config();

    module.exports = {
        development: {
            username: process.env.DB_USER,
            password: process.env.DB_PASSWORD,
            database: process.env.DB_NAME,
            host: process.env.DB_HOST,
            port: process.env.DB_PORT,
            dialect: 'postgres',
            logging: false,
        },
        production: {
            username: process.env.DB_USER,
            password: process.env.DB_PASSWORD,
            database: process.env.DB_NAME,
            host: process.env.DB_HOST,
            port: process.env.DB_PORT,
            dialect: 'postgres',
            logging: false,
        },
    };
    ```

## Step 4: Define the Sequelize Instance

1. **Create a `sequelize.js` file** in a `lib` directory to initialize Sequelize:

    ```javascript
    // lib/sequelize.js

    const { Sequelize } = require('sequelize');
    const config = require('../config/config.js')[process.env.NODE_ENV || 'development'];

    const sequelize = new Sequelize(config.database, config.username, config.password, {
        host: config.host,
        dialect: 'postgres',
        port: config.port,
        logging: config.logging,
    });

    module.exports = sequelize;
    ```

## Step 5: Define the User Model

1. **Create a `user` model** in `models/user.js`:

    ```javascript
    // models/user.js

    const { DataTypes } = require('sequelize');
    const sequelize = require('../lib/sequelize');

    const user = sequelize.define(
        'user',
        {
            username: {
                type: DataTypes.STRING,
                allowNull: false,
                unique: true,
            },
            name: {
                type: DataTypes.STRING,
                allowNull: false,
            },
            repoCount: {
                type: DataTypes.INTEGER,
                allowNull: false,
            },
            location: {
                type: DataTypes.STRING,
                allowNull: false,
            },
        },
        {
            tableName: 'users',
            timestamps: true,
        }
    );

    module.exports = user;
    ```

## Step 6: Create a Migration for the User Model

1. **Generate a migration** file for the `user` model:

    ```bash
    npx sequelize-cli migration:generate --name create-user
    ```

2. **Edit the generated migration** file in `migrations/` (e.g., `XXXXXXXXXXXXXX-create-user.js`) to create the `users` table:

    ```javascript
    // migrations/XXXXXXXXXXXXXX-create-user.js

    'use strict';

    module.exports = {
        up: async (queryInterface, Sequelize) => {
            await queryInterface.createTable('users', {
                id: {
                    allowNull: false,
                    autoIncrement: true,
                    primaryKey: true,
                    type: Sequelize.INTEGER,
                },
                username: {
                    type: Sequelize.STRING,
                    allowNull: false,
                    unique: true,
                },
                name: {
                    type: Sequelize.STRING,
                    allowNull: false,
                },
                repoCount: {
                    type: Sequelize.INTEGER,
                    allowNull: false,
                },
                location: {
                    type: Sequelize.STRING,
                    allowNull: false,
                },
                createdAt: {
                    allowNull: false,
                    type: Sequelize.DATE,
                    defaultValue: Sequelize.fn('now'),
                },
                updatedAt: {
                    allowNull: false,
                    type: Sequelize.DATE,
                    defaultValue: Sequelize.fn('now'),
                },
            });
        },

        down: async (queryInterface, Sequelize) => {
            await queryInterface.dropTable('users');
        },
    };
    ```

## Step 7: Run the Migration

1. **Run the migration** to create the `users` table in your Supabase database:

    ```bash
    npx sequelize-cli db:migrate
    ```

## Step 8: Update the Express API to Use Sequelize

Now, modify your existing Express API to interact with the Supabase database using Sequelize.

1. **Update `index.js`**:

    ```javascript
    // index.js

    require('dotenv').config();
    const express = require('express');
    const cors = require('cors');
    const sequelize = require('./lib/sequelize');
    const userModel = require('./models/user');

    const app = express();
    app.use(cors());
    app.use(express.json());

    // Sync the database
    sequelize
        .sync()
        .then(() => {
            console.log('Database connected and synchronized.');
        })
        .catch((err) => {
            console.error('Unable to connect to the database:', err);
        });

    // Endpoint to get all users
    app.get('/users', async (req, res) => {
        try {
            const users = await userModel.findAll();
            res.json({ users });
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: 'Failed to fetch users' });
        }
    });

    // Endpoint to get a user by ID
    app.get('/users/:id', async (req, res) => {
        const userId = parseInt(req.params.id);
        try {
            const user = await userModel.findByPk(userId);

            if (user) {
                res.json({ user });
            } else {
                res.status(404).json({ message: 'User not found' });
            }
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: 'Failed to fetch user' });
        }
    });

    // Start the server
    const PORT = process.env.PORT || 3000;
    app.listen(PORT, () => {
        console.log(`Server is running on port ${PORT}`);
    });
    ```

## Step 9: Start Your Server

1. **Run your Express server**:

    ```bash
    npm run dev
    ```

## Step 10: Testing Your API

-   **To retrieve all users**: Send a `GET` request to `/users`.
-   **To retrieve a specific user by ID**: Send a `GET` request to `/users/:id`.

## Conclusion

With this setup:

-   Your Express.js API is connected to a Supabase PostgreSQL database using Sequelize ORM.
-   The `sequelize.js` file in the `lib` directory initializes the Sequelize instance and connects to Supabase.
-   The `User` model is defined in the `models/user.js` file and is used to interact with the `users` table in your Supabase database.
-   Migrations are created manually using Sequelize CLI, which allows you to control the database schema changes.
