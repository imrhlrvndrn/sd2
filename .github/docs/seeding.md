# Seeding the Supabase DB with dummy data for testing

[Back to main doc](../../readme.md)

To seed data into your Supabase PostgreSQL database using Sequelize, you'll need to follow these steps:

## Step 1: Create a Seeder File

1. **Generate a seeder file** using the Sequelize CLI:

    ```bash
    npx sequelize-cli seed:generate --name demo-users
    ```

    This command will create a new seeder file in the `seeders` directory. The file will be named something like `XXXXXXXXXXXXXX-demo-users.js`, where `XXXXXXXXXXXXXX` is a timestamp.

## Step 2: Edit the Seeder File

2. **Open the generated seeder file** and populate it with demo user data:

    ```javascript
    // seeders/XXXXXXXXXXXXXX-demo-users.js

    'use strict';

    module.exports = {
        up: async (queryInterface, Sequelize) => {
            return queryInterface.bulkInsert(
                'users',
                [
                    {
                        username: 'octocat',
                        name: 'The Octocat',
                        repoCount: 8,
                        location: 'San Francisco',
                        createdAt: new Date(),
                        updatedAt: new Date(),
                    },
                    {
                        username: 'torvalds',
                        name: 'Linus Torvalds',
                        repoCount: 25,
                        location: 'Portland',
                        createdAt: new Date(),
                        updatedAt: new Date(),
                    },
                    {
                        username: 'gaearon',
                        name: 'Dan Abramov',
                        repoCount: 50,
                        location: 'London',
                        createdAt: new Date(),
                        updatedAt: new Date(),
                    },
                    {
                        username: 'addyosmani',
                        name: 'Addy Osmani',
                        repoCount: 42,
                        location: 'Mountain View',
                        createdAt: new Date(),
                        updatedAt: new Date(),
                    },
                    {
                        username: 'tj',
                        name: 'TJ Holowaychuk',
                        repoCount: 150,
                        location: 'Victoria',
                        createdAt: new Date(),
                        updatedAt: new Date(),
                    },
                ],
                {}
            );
        },

        down: async (queryInterface, Sequelize) => {
            return queryInterface.bulkDelete('users', null, {});
        },
    };
    ```

## Step 3: Run the Seeder

3. **Execute the seeder to insert data into the database**:

    ```bash
    npx sequelize-cli db:seed:all
    ```

    This command runs all seeder files in the `seeders` directory. The users defined in the seeder file will be inserted into the `users` table in your Supabase database.

## Step 4: Verify the Data

4. **Check the data** to ensure that it was inserted correctly. You can use the Supabase dashboard to view the `users` table and verify the records.

## Step 5: Run the Express Server

5. **Start your Express server**:

    ```bash
    node index.js
    ```

## Step 6: Test the API Endpoints

6. **Use a tool like Postman or curl to test the `/users` and `/users/:id` endpoints**:

    - **Get all users**:

        Send a `GET` request to:

        ```
        http://localhost:3000/users
        ```

        You should receive a JSON response with the list of all users seeded into the database.

    - **Get a specific user by ID**:

        Send a `GET` request to:

        ```
        http://localhost:3000/users/1
        ```

        Replace `1` with the actual ID of the user you want to retrieve. You should receive a JSON response with the details of the specified user.
