/*
Question: What skills are required for the top-paying business analyst jobs?
- Use the top 10 highest paying business analyst jobs from first query
- Add the specific skills required for these roles
- Outcome - provides a detailed look at the skills required for top paying business analyst jobs
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


/*
The analysis of the "skill_name" column from the job postings for business analyst roles in 2023 shows the following insights:

SQL, Python, and Tableau are the top skills, each appearing in 5 job postings. These skills are crucial for data manipulation, analysis, and visualization, indicating their high demand in the business analyst field.
Excel and Snowflake are also frequently mentioned, appearing in 3 postings each. Excel remains a fundamental tool for data analysis, while Snowflake is gaining importance due to its capabilities in cloud data warehousing.
Skills like R, Go, Phoenix, Hadoop, and Looker appear in 2 postings each, suggesting moderate demand for these technologies.
Other skills like MySQL, Azure, NoSQL, BigQuery, Chef, C, Power BI, GDPR, Airflow, Spark, and MicroStrategy each appear once, indicating specific niche requirements or preferences in certain job roles.
*/