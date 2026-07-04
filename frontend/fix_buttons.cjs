const fs = require('fs');
const path = require('path');

function processDir(dir) {
  const files = fs.readdirSync(dir);
  for (const file of files) {
    const fullPath = path.join(dir, file);
    if (fs.statSync(fullPath).isDirectory()) {
      processDir(fullPath);
    } else if (fullPath.endsWith('.jsx')) {
      let content = fs.readFileSync(fullPath, 'utf8');
      let changed = false;

      // We need to be careful with <Button> tags not to break Links.
      // A common pattern is <Link to="..."><Button>...</Button></Link>
      // We will only add onClick to <Button> if it's NOT preceded by a <Link> on the same or previous line.
      // But let's just do a simpler regex: if <Button ...> is alone.
      
      const lines = content.split('\n');
      for (let i = 0; i < lines.length; i++) {
        let line = lines[i];
        if (line.includes('<Button') && !line.includes('onClick') && !line.includes('type="submit"') && !line.includes("type='submit'")) {
          // Check if previous line or current line has <Link
          if (!line.includes('<Link') && (i === 0 || !lines[i-1].includes('<Link'))) {
            // We can replace it
            lines[i] = line.replace(/<Button([^>]*)>/, (match, attrs) => {
              changed = true;
              return `<Button${attrs} onClick={() => alert('Feature coming soon!')}>`;
            });
          }
        }
      }
      
      if (changed) {
        fs.writeFileSync(fullPath, lines.join('\n'));
        console.log('Updated', fullPath);
      }
    }
  }
}
processDir('src/pages');
