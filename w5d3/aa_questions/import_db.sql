DROP TABLE users;
DROP TABLE questions;
DROP TABLE question_follows;
DROP TABLE replies;
DROP TABLE question_likes; 

PRAGMA foreign_keys = ON;

--users
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

--questions
CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body VARCHAR(255) NOT NULL,
  author_id INTEGER FOREIGN KEY REFERENCES users(id)
);

--question_follows
CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER FOREIGN KEY REFERENCES users(id),
  question_id INTEGER FOREIGN KEY REFERENCES questions(id)
);

--replies
CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER FOREIGN KEY REFERENCES questions(id),
  parent_reply_id INTEGER FOREIGN KEY REFERENCES replies(id),
  author_id INTEGER FOREIGN KEY REFERENCES users(id),
  body TEXT NOT NULL,
);

--question_likes
CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER FOREIGN KEY REFERENCES users(id),
  question_id INTEGER FOREIGN KEY REFERENCES questions(id)
);

INSERT INTO 
  users (fname, lname)
VALUES 
  ("Jadin", "Press"), ("Sky", "Kumtong");

INSERT INTO 
  questions (title, body)
VALUES 
  ("adsfh;kjl", "asfhdladsh"), ("App", "Academy")



