const mysql = require('mysql2/promise');


async function dbConn () {
	return mysql.createConnection({
		host: process.env.DATABASE_URL,
		database: process.env.DATABASE_NAME,
		user: process.env.DATABASE_USER,
		password: process.env.DATABASE_PASSWORD,
		timezone: 'Z',
	});
}

module.exports = dbConn;