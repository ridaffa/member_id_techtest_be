const { Pool } = require('pg');
const pool = new Pool({
  connectionString: `postgres://${process.env.DATABASE_USERNAME}:${process.env.DATABASE_PASSWORD}@${process.env.DATABASE_HOST}:${process.env.DATABASE_PORT}/${process.env.DATABASE_NAME}`
});

pool.on('connect', () => {
  console.log('Connected to DB');
});

module.exports = {
  query: (text, params) => pool.query(text, params),
};