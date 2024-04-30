CREATE DATABASE todoApp;

USE todoApp;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) ,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) 
    );

CREATE TABLE todos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) ,
    completed BOOLEAN DEFAULT false,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
    );

CREATE TABLE shared_todos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    todo_id INT,
    user_id INT,
    shared_with_id INT,
    FOREIGN KEY (todo_id) REFERENCES todos(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (shared_with_id) REFERENCES users(id)
);

    -- insert two users into the users table
INSERT INTO users (name, email, password) VALUES ('Mateo Bodini', 'mateobodini1@gmail.com', 'password1');
INSERT INTO users (name, email, password) VALUES ('Marcelo Benitez', 'marcebenitez@gmail.com', 'password2');

INSERT INTO todos (title, user_id) 
VALUES 
    ('Learn GraphQL', 1),
    ("Go for a morning run", 1),
    ("Work on project presentation", 1),
    ("Write a blog post", 1),
    ("Design a new logo", 1);

INSERT INTO shared_todos (todo_id, user_id, shared_with_id) 
VALUES (6, 1, 2);

--get todos including shared todos by id
SELECT todos.*, shared_todos.shared_with_id
FROM todos 
LEFT JOIN shared_todos ON todos.id = shared_todos.todo_id
WHERE todos.user_id = 2 OR shared_todos.shared_with_id = 2;

