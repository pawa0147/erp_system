const mysql = require('mysql2/promise');

async function testConnection(host) {
  try {
    const connection = await mysql.createConnection({
      host: host,
      user: 'root',
      password: 'Deepak@07',
    });
    console.log(`Connected to MySQL successfully via ${host}!`);
    await connection.end();
  } catch (error) {
    console.error(`Error connecting to MySQL via ${host}:`, error.message);
  }
}

async function run() {
  await testConnection('localhost');
  await testConnection('127.0.0.1');
}

run();
