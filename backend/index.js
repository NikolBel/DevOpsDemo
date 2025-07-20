const express = require('express');
const fs = require('fs');
const path = require('path');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 5000;
const NOTES_FILE = path.join(__dirname, 'notes.json');

app.use(cors({
  origin: process.env.CORS_ORIGIN || 'http://localhost:80'
}));
app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

app.get('/api/notes', (req, res) => {
    const notes = JSON.parse(fs.readFileSync(NOTES_FILE, 'utf-8'));
    res.json(notes);
});

app.post('/api/notes', (req, res) => {
    const notes = JSON.parse(fs.readFileSync(NOTES_FILE, 'utf-8'));
    const newNote = { id: Date.now(), text: req.body.text };
    notes.push(newNote);
    fs.writeFileSync(NOTES_FILE, JSON.stringify(notes, null, 2));
    res.status(201).json(newNote);
});

app.get('/health', (req, res) => res.send('ok'));

app.listen(PORT, () => console.log(`Server started on port ${PORT}`));