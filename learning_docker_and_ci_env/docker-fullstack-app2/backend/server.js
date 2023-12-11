require('dotenv').config();
const express = require('express');
const dbConn = require('./db');

const PORT = 3333;
const app = express();

app.use(express.json())

app.use(async function (req, res, next) {
	const db = await dbConn();
	req.db = db;
	next();
});

app.get('/', async function (req, res) {
	res.send('hihi2');
});

app.get('/user', async function (req, res) {
  const [users] = await req.db.execute(
    `
			SELECT
				*
			FROM
				\`User\`
		`
  );

	res.json({ users });
});

app.get('/user/:id', async function (req, res) {
	const id = req.params.id;

	const [userResult] = await req.db.execute(
		`
			SELECT
				*
			FROM
				\`User\`
			WHERE
				id = ?
			LIMIT
				1
		`,
		[id]
	);

	res.json({ user: userResult.length > 0 ? userResult[0] : null });
});

app.post('/user', async function (req, res) {
	const { name } = req.body;

	const [result] = await req.db.execute(
    `
			INSERT INTO
				\`User\`
					(
						name
					)
			VALUES
				(
					?
				)
		`,
		[name]
  );

	res.json({ userId: result.insertId });
});

app.listen(PORT, ()=> console.log(`🚀listeing on port: ${PORT}`));
