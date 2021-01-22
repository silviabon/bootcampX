-- Total Student Assistance Requests
-- Get the total number of assistance_requests for a student.

SELECT students.name, COUNT(assistance_requests.*) as total_assistances
FROM assistance_requests
JOIN students
ON assistance_requests.student_id = students.id
WHERE students.name = 'Elliot Dickinson'
GROUP BY students.name;