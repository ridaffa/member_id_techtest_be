const express = require('express');
const cors = require('cors');
const app = express();
const index = require('./routes/index');
const userRoute = require('./routes/user.routes');
const awardRoute = require('./routes/award.routes');

app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(express.json({ type: 'application/vnd.api+json' }));
app.use(cors());

app.use(index);
app.use('/api/user', userRoute);
app.use('/api/awards', awardRoute);

module.exports = app;