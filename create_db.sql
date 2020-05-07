CREATE TABLE requests (
  id INTEGER PRIMARY KEY,
  request TEXT NOT NULL,
  success BOOLEAN NOT NULL CHECK (success IN (0,1)),
  response_file TEXT,
  timestamp DATETIME NOT NULL
);
