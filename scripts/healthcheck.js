import http from 'http';
import { setTimeout as wait } from 'timers/promises';

const start = Date.now();

// (Optionally check DB connection etc.)
const server = http.createServer(async (_req,res) => {
  // Warm-up allowance
  if (Date.now() - start < 3000) {
    res.statusCode = 503;
    return res.end('warming');
  }
  res.end('ok');
});

server.listen(5001); // separate internal port if desired