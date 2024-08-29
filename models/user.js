// models/user.js

const { DataTypes } = require('sequelize');
const sequelize = require('../lib/sequelize');

const userModel = sequelize.define(
    'user',
    {},
    {
        tableName: 'users',
        timestamps: true,
    }
);

module.exports = userModel;
