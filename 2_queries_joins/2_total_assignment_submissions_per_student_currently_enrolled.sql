--  total number of assignment_submissions for each currently enrolled student
-- A currently enrolled student has a null end_date.
-- only students who's total submissions are less than 100

-- The HAVING clause is like WHERE but works on aggregated data.

SELECT students.name AS student, count(assignment_submissions) AS total_submissions
FROM students
INNER JOIN assignment_submissions
ON assignment_submissions.student_id = students.id 
WHERE students.end_date IS NULL 
GROUP BY students.id 
HAVING count(assignment_submissions) < 100
ORDER BY students.name;