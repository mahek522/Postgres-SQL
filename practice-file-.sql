CREATE TABLE courses (
    c_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    fee NUMERIC NOT NULL
);

INSERT INTO courses (name, fee)
VALUES
('Mathematics', 500.00),
('Physics', 600.00),
('Chemistry', 700.00);

CREATE TABLE students (
    s_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO Students (name) VALUES
('Raju'),
('Sham'),
('Alex');

CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    s_id INT NOT NULL,
    c_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (s_id) REFERENCES students(s_id),
    FOREIGN KEY (c_id) REFERENCES courses(c_id)
);

INSERT INTO enrollment (s_id, c_id, enrollment_date)
VALUES
(1, 1, '2024-01-01'), -- Raju enrolled in Mathematics
(1, 2, '2024-01-15'), -- Raju enrolled in Physics
(2, 1, '2024-02-01'), -- Sham enrolled in Mathematics
(2, 3, '2024-02-15'), -- Sham enrolled in Chemistry
(3, 3, '2024-03-25'); -- Alex enrolled in Chemistry


--Join
SELECT
    e.enrollment_id,
    s.name AS student_name,
    c.name AS course_name,
    c.fee,
    e.enrollment_date
FROM
    enrollment e
JOIN
    students s ON e.s_id = s.s_id
JOIN
    courses c ON e.c_id = c.c_id;
