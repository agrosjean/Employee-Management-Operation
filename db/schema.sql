DROP DATABASE IF EXISTS employees_db;
CREATE DATABASE employees_db;

USE employees;

CREATE TABLE department (
  -- CREATE id, name COLUMNS
  -- MAKE id AS PRIMARY KEY
  -- YOUR CODE HERE

  id INT AUTO_INCREMENT NOT NULL,
  department_name VARCHAR(30) NULL,
  PRIMARY KEY (id)
);

CREATE TABLE role (
  -- CREATE id AS INTERGER, title AS VARCHAR, salary AS DECIMAL, deplartment_id AS INTEGER
  -- MAKE id As PRIMARY KEY
  -- MAKE department_id AS FOREIGN KEY REFERENCING department TABLE AND
  -- MAKE CONSTRAINT 'ON DELETE CASCADE' (WITHOUT QUOTES) ON THIS FOREIGN KEY
  -- YOUR CODE HERE

  id INT AUTO_INCREMENT NOT NULL,
  title VARCHAR(30) NULL,
  salary INT NULL,
  department_id INT NULL,

  PRIMARY KEY (id),
  FOREGIN KEY (department_id) REFERENCES department (id) ON DELETE CASCADE

);

CREATE TABLE employee (
  -- CREATE COLUMNS, id AS INT, first_name AS VARCHAR, last_name AS VARCHAR, role_id AS INTEGER, AND manager_id AS INT.
  -- MAKE id As PRIMARY KEY
  -- MAKE role_id AS FOREIGN KEY REFERENCING role TABLE AND MAKE CONSTRAINT ON DELETE CASCADE ON THIS FOREIGN KEY
  -- MAKE manager_id AS FOREIGN KEY REFERENCING employee TABLE ITSELF AND MAKE CONSTRAINT ON DELETE SET NULL ON THIS FOREIGN KEY
  -- YOUR CODE HERE

  id INT AUTO_INCREMENT NOT NULL,
  first_name VARCHAR(30) NULL,
  last_name VARCHAR(30) NULL,
  role_id INT NULL,
  manager_id INT NULL,

  PRIMARY KEY (id),
  FOREGIN KEY (role_id) REFERENCES role (id) ON DELETE CASCADE,
  FOREGIN KEY (manager_id) REFERENCES employee (id) ON DELETE SET NULL

);

-- Department(6, 'Management')       -- 1
--                                      |
-- Role(12, 'Director A', 4000, 6)     -- N
-- Role(13, 'Director B', 2000, 6)


-- Employee(4, 'Adam', 'Junior', 13, NULL)
-- Employee(9, 'John', 'Doe', 12, 4)