// server.test.js
const request = require('supertest');
const app = require('../server.js');

test('Server serves index.html', async () => {
  const response = await request(app).get('/');
  expect(response.status).toBe(200);
  expect(response.text).toContain('<h1>Hello World!</h1>');
});