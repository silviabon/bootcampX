const args = process.argv.slice(2);
const { postgres_passw } = require('./local');
const { Pool } = require('pg');

const pool = new Pool({
  user: 'postgres',
  password: postgres_passw,
  host: 'localhost',
  database: 'bootcampx',
});

const cohort = args[0].toUpperCase();
const max_results = args[1] || 5;
// Store all potentially malicious values in an array.
const values = [`%${cohort}%`, max_results];

const queryString = `
  SELECT students.id as student_id, students.name as name, cohorts.name as cohort
  FROM students
  JOIN cohorts ON cohorts.id = cohort_id
  WHERE cohorts.name LIKE $1
  LIMIT $2;
  `;

pool.query(queryString, values)
  .then((res) => {
  // console.log(res.rows);
    res.rows.forEach((user) => {
      console.log(`${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort.`);
    });
  })
  .catch(err => console.error('query error', err.stack));
