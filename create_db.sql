CREATE TABLE requests (
  id INTEGER PRIMARY KEY,
  request TEXT NOT NULL
);

CREATE TABLE responses (
  id INTEGER PRIMARY KEY,
  request_id INTEGER NOT NULL,
  success BOOLEAN NOT NULL CHECK (success IN (0,1)),
  response_file TEXT,
  timestamp DATETIME NOT NULL,
  FOREIGN KEY(request_id) REFERENCES requests(request)
);

