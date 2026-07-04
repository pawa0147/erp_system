const fs = require('fs');
const path = require('path');

function walk(dir) {
  let results = [];
  const list = fs.readdirSync(dir);
  list.forEach(file => {
    file = path.join(dir, file);
    const stat = fs.statSync(file);
    if (stat && stat.isDirectory()) {
      results = results.concat(walk(file));
    } else if (file.endsWith('.jsx')) {
      const content = fs.readFileSync(file, 'utf8');
      const tags = content.match(/<(button|Button)[^>]*>/g);
      if (tags) {
        const missing = tags.filter(t => !t.includes('onClick') && !t.includes('type="submit"'));
        if (missing.length > 0) {
          results.push({ file, count: missing.length, tags: missing });
        }
      }
    }
  });
  return results;
}
console.log(JSON.stringify(walk('d:/Webwork studios/erp_system/frontend/src'), null, 2));
