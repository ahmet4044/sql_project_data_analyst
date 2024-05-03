/*
Question: What are the skills that are on high demand and high paying?
*/

WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        count(skills_job_dim.job_id) as demand_count
    From job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_postings_fact.job_title_short = 'Business Analyst'
        and job_postings_fact.salary_year_avg is not NULL
        and job_postings_fact.job_country = 'United States'
    GROUP BY
        skills_dim.skill_id
), average_salary as (
    SELECT 
        skills_job_dim.skill_id,
        round(avg(job_postings_fact.salary_year_avg), 0) as average_salary_for_skill
    From job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_postings_fact.job_title_short = 'Business Analyst'
        and job_postings_fact.salary_year_avg is not NULL
        and job_postings_fact.job_country = 'United States'
    GROUP BY
        skills_job_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    average_salary_for_skill
From
    skills_demand
INNER JOIN
    average_salary on skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 10
ORDER BY
    average_salary_for_skill DESC,
    demand_count DESC
LIMIT
    25;
