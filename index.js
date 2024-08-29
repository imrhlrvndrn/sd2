// app.js

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
        const user = await userModel.findOne({ where: { id: userId } });

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
