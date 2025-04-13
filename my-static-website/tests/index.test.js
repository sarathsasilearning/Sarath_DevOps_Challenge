
const fs = require('fs');
const path = require('path');

test('index.html contains "Hello World!"', () => {
  const indexPath = path.join(__dirname, '..', 'index.html');
  const content = fs.readFileSync(indexPath, 'utf8');
  expect(content).toContain('<h1>Hello World!</h1>');
});