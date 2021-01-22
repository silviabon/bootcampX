-- Total Teacher Assistance Requests
-- Get the total number of assistance_requests for a teacher.

SELECT teachers.name, COUNT(assistance_requests.*) as total_assistances
FROM teachers
JOIN assistance_requests
ON teachers.id = assistance_requests.teacher_id
WHERE teachers.name = 'Waylon Boehm'
GROUP BY teachers.id;
