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
  body VARCHAR(255) NOT NULL
);

--question_follows
CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER FOREIGN KEY,
  question_id INTEGER FOREIGN KEY
);

--replies
CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER FOREIGN KEY,
  parent_reply_id INTEGER FOREIGN KEY,
  author_id INTEGER FOREIGN KEY,
  body TEXT NOT NULL,
);

--question_likes
CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER FOREIGN KEY,
  question_id INTEGER FOREIGN KEY
);
