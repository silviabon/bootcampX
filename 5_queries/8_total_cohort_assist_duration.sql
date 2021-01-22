-- Total Cohort Assistance Duration
-- Get the total duration of all assistance requests for each cohort.

SELECT cohorts.name as cohort, SUM(completed_at - started_at) as total_duration
FROM assistance_requests
JOIN students ON assistance_requests.student_id = students.id
JOIN cohorts ON students.cohort_id = cohorts.id
GROUP BY cohort 
ORDER BY total_duration