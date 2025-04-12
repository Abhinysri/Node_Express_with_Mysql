const mysql  = require('mysql');

const db = mysql.createConnection({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '',
    database: 'mydb'
});

db.connect((error) => {
    if(error) throw error;
    else
        console.log('Connected to database');
});

module.exports = db;