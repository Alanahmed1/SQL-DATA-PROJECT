/*
What are the the top skills based on salary?
-look at the avrage salary associated with each skills for Data Scientist
-Foucus on roles with specified salaries, regardless of location
-Why? it reveals how different skills impact salary levels for Data scientist and 
helps identify the most fainacial rewarding skills to aquire and improve. 
*/

SELECT
    skills,
   round(AVG(salary_year_avg) ,1) AS avarage_salary
FROM 
    job_postings_fact

INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE 
    job_title_short='Data Scientist'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home IS FALSE
    AND job_location = 'New York, NY'

GROUP BY
    skills

ORDER BY
        avarage_salary DESC

LIMIT 25;

/* These top-paying skills for data scientists reflect a blend of data privacy,
advanced programming languages, specialized databases, and machine learning tools.
The high salaries correlate with specialized or emerging tools that support data privacy,
real-time data applications, machine learning automation, and complex data relationships.
Data scientists who aim to command higher salaries should focus on developing expertise in 
these areas, as they align with modern data challenges across industries.
*/
