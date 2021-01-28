const { postgres_passw } = require('./local');
const { Pool } = require('pg');

const pool = new Pool({
  user: 'postgres',
  password: postgres_passw,
  host: 'localhost',
  database: 'bootcampx',
});

const cohort = (process.argv.slice(2))[0].toUpperCase();
const values = [`%${cohort}%`];

const query = `
SELECT DISTINCT teacher, cohort FROM (
  SELECT teachers.name as teacher, cohorts.name as cohort 
  FROM teachers 
  JOIN assistance_requests ON teachers.id = assistance_requests.teacher_id
  JOIN students ON assistance_requests.student_id = students.id
  JOIN cohorts ON students.cohort_id = cohorts.id
  WHERE cohorts.name LIKE $1
) as table_teachers
ORDER BY teacher;
`;

pool.query(query, values)
  .then((res) => {
    console.log(res.rows);
  })
  .catch(err => console.error('query error', err.stack));
