const express = require('express');

const PORT = 8080;

const app = express();

app.get('/', async (req, res) => {
    res.send('hello');
});

app.listen(PORT, () => console.log('@@server is runnig!!@@'));