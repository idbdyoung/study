const express = require('express');
const bodyParser = require('body-parser');

// const db = require('./db');

const app = express();


app.get('/', (req, res) => res.send('Hello World!'));

// db.pool.query(
//     `
//         CREATE TABLE lists (
//             id INTEGER AUTO_INCREMENT,
//             value TEXT,
//             PRIMARY KEY (id)
//         )
//     `,
//     (err, results, fields) => {
//         console.log('results: ', results)
//     }
// )


// app.get('/api/values', function (req, res) {
//     db.pool.query(
//         `
//             SELECT * FROM lists
//         `,
//         (err, results, fields) => {
//             if (err) {
//                 return res.status(500).send(err);
//             } else {
//                 return res.json(results);
//             }
//         }
//     )
// });

// app.post('/api/value', function (req, res) {
//     db.pool.query(
//         `
//             INSERT INTO list (value) VALUES("${req.body.value}")
//         `,
//         (err, results, fields) => {
//             if (err) {
//                 return res.status(500).send(err);
//             } else {
//                 return res.json({ success: true, value: req.body.value });
//             }
//         }
//     )
// });

app.use(bodyParser.json());

app.listen(3333, () => console.log('server is running on port: 3000'));
