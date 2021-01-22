-- If a query returns a single value, we can use it in our SELECT statement just like any other value.

-- Get the total number of incomplete assignment submissions for a student

SELECT (
  SELECT count(assignments)
  FROM assignments
)-count(assignment_submissions) as total_incomplete
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';