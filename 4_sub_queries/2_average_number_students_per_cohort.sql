-- average number of students per cohort

-- f we treat this as a table, we essentially want to find the average of the total_students column.

-- The as totals_table part gives an alias to the sub query so that we can use it's name like we would use any other table's name. 

SELECT avg(total_students) as average_students
FROM (
  SELECT count(students) as total_students
  FROM students
  JOIN cohorts on cohorts.id = cohort_id
  GROUP BY cohorts
) as totals_table;