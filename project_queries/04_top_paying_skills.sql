/*
Question: What skills are getting paid top dollar?
*/

SELECT 
    skills_dim.skills as skill_name,
    round(avg(job_postings_fact.salary_year_avg), 0) as average_salary_for_skill
From job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Business Analyst'
    and job_postings_fact.salary_year_avg is not NULL
    and job_postings_fact.job_country = 'United States'
GROUP BY
    skill_name
Order BY
    average_salary_for_skill DESC
LIMIT
    25;

/*
The dataset contains information on the top paying skills for business analysts, including the skill name and the average salary associated with each skill. Here are some key insights and trends based on the top 25 skills from the list:

Technical Proficiency in High Demand: Skills like "chef", "airflow", "numpy", and "pandas" suggest a high demand for technical proficiency in programming, data manipulation, and automation. These skills command the highest salaries, indicating the importance of technical expertise in the business analysis field.
Programming Languages: Traditional programming skills like "C" are also highly valued. This indicates a continuous demand for business analysts who can understand and possibly manipulate complex systems or contribute to software development.
Data Science and Machine Learning: Skills associated with data science and machine learning (e.g., "numpy" and "pandas" for Python data manipulation) highlight the trend towards more data-driven decision making in businesses. Business analysts with the ability to apply these tools to real-world business problems are able to command higher salaries.
Automation and Workflow Tools: The presence of "airflow", a tool used for workflow automation, suggests that there is a premium on the ability to optimize and automate business processes, a key competency for increasing efficiency in operations.
These insights reflect the growing intersection between business acumen and advanced technical skills, where business analysts are expected not only to interpret and analyze data but also to have hands-on technical skills to implement solutions directly
*/