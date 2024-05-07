/*
Question: What skills are required for the top-paying business analyst jobs?
- Use the top 10 highest paying business analyst jobs from first query
- Add the specific skills required for these roles
- Outcome - provides a detailed look at the skills required for top paying business analyst jobs in United States
*/

WITH top_paying_jobs as (
    SELECT
        job_id,
        company_dim.name as company_name,
        job_title,
        salary_year_avg
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
        10
)

SELECT
    top_paying_jobs.*,
    skills_dim.skills as skill_name
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim on top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;
