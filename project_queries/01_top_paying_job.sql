/*
Question: What are the top-paying business analyst jobs?
- Identify the top 10 highes-paying business analyst roles
- Focuses on job postings with not null salaries
*/

SELECT
    job_id,
    company_dim.name as company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN
    company_dim on job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Business Analyst'
    and job_country = 'United States'
    and salary_year_avg is not NULL
ORDER BY
    salary_year_avg DESC
LIMIT
    10;