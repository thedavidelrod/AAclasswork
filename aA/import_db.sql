PRAGMA foreign_keys = ON;

CREATE TABLE users(
id INTEGER PRIMARY KEY,
fname VARCHAR NOT NULL, 
lname VARCHAR NOT NULL
);

CREATE TABLE questions (
id INTEGER PRIMARY KEY,
title VARCHAR NOT NULL,
body VARCHAR NOT NULL,
user_id INTEGER NOT NULL,
FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
id INTEGER PRIMARY KEY,
user_id INTEGER NOT NULL,
question_id INTEGER NOT NULL,
FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
id INTEGER PRIMARY KEY,
question_id INTEGER NOT NULL,
parent_reply_id INTEGER,
user_id INTEGER NOT NULL,
body VARCHAR NOT NULL,
FOREIGN KEY (question_id) REFERENCES questions(id),
FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes(
likes_id INTEGER PRIMARY KEY,
likes INTEGER,
user_id INTEGER NOT NULL,
questions_id INTEGER NOT NULL,
FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (questions_id) REFERENCES questions(id)
);

INSERT INTO
    users (fname, lname)
VALUES
    ('Michael', "Chen"), ("David", "Elrod");

INSERT INTO
    questions (title, body, user_id)
VALUES
    ('q1', 'b1', 1);

INSERT INTO
    question_fllows(user_id, question_id)
VALUES
    (1,1);

INSERT INTO
    question_likes(likes, user_id, question_id)
VALUES
    (1,1,1);
    
INSERT INTO
replies (question_id, parent_reply_id, user_id, body)
VALUES
(1,1,1,"body!");

