const express = require('express');
const redis = require('redis');

const PORT = 8080;

const client = redis.createClient({
    socket: {
        host: "redis-server",
        port: 6379
    }
});

const app = express();

app.get('/', async (req, res) => {
    try {
        await client.connect();

        let number = await client.get('number');

        if (number === null) {
            number = 0;
        }

        await client.set("number", String(parseInt(number) + 1))

        await client.disconnect();

        res.send("숫자가 1씩 올라갑니다. 숫자: " + number)
    } catch (error) {
        console.log(error);
    }
})

app.listen(PORT, () => console.log("server is running on port:8080"));
