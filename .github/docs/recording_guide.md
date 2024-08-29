1. Use the same project from `SD1.2`
1. Install the necessary packages `express, cors, sequelize, pg, dotenv`
1. Install dev dependencies `sequelize-cli, nodemon`
1. Setup `start` & `dev` scripts in `package.json`
1. Explain what `nodemon` does
1. Create supabase project and fetch the connection URL
1. Create `.env` file
1. Rename the `/config/config.json` to `config.js` to store the database connection details
    1. By default the `sequelize-cli init` command creates a `config.json` file.
1. Run the migration command to create the tables according to the defined models
1. Run the seed command to insert dummy data into the database
1. Start the dev server and visit `http://localhost:3000/users`

> Note: The `migrations, models, seeders` folders and the files inside them will be provided by us as a starter template. Teach them how to work with these files
