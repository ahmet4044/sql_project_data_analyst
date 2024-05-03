/*
Question: What are the most in-demand skills for Business Analyst?
*/

SELECT 
    skills_dim.skills as skill_name,
    count(skills_job_dim.job_id) as demand_count
From job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Business Analyst'
    and job_postings_fact.job_country = 'United States'
GROUP BY
    skill_name
Order BY
    demand_count DESC
LIMIT
    5;