const db = require('./db');

async function checkDB() {
  try {
    const [tables] = await db.query('SHOW TABLES');
    const tableKey = Object.keys(tables[0])[0];
    
    for (const tableObj of tables) {
      const tableName = tableObj[tableKey];
      console.log(`\n--- Table: ${tableName} ---`);
      const [columns] = await db.query(`SHOW COLUMNS FROM ${tableName}`);
      for (const col of columns) {
        console.log(`- ${col.Field} (${col.Type}) ${col.Null === 'NO' ? 'NOT NULL' : 'NULL'} ${col.Key ? col.Key : ''}`);
      }
    }
  } catch (err) {
    console.error('Error checking db:', err);
  } finally {
    process.exit();
  }
}

checkDB();
