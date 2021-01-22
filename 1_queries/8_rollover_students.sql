SELECT students.name, cohorts.name AS cohort, students.start_date AS student_start_date,  cohorts.start_date AS cohort_start_date
FROM students
LEFT JOIN cohorts
ON students.cohort_id = cohorts.id
WHERE students.start_date <> cohorts.start_date
ORDER BY cohort_start_date;