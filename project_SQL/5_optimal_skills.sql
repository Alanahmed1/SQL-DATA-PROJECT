/*
What are the most optimal(High demanded and High salary) skills to learn?
-identify skills in demanded associated with high AVG salary for Data Scientist role
-Concentrate on 'New York, NY' with specified salaries 
WHY? targeting Optimal skills offers stratgic insights for a career development in Data scientist 
*/
WITH demanded_skills AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_numb_skills

    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

    WHERE 
        job_title_short='Data Scientist' 
        AND job_location = 'New York, NY'
    GROUP BY 
        skills_dim.skill_id,
        skills_dim.skills
    
), 
average_salary AS (
    
    SELECT
       skills_dim.skill_id,
        round(AVG(salary_year_avg) ,1) AS avg_salary
    FROM 
        job_postings_fact

    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

    WHERE 
        job_title_short='Data Scientist'
        AND salary_year_avg IS NOT NULL
    GROUP BY
            skills_dim.skill_id
    )
SELECT
    demanded_skills.skill_id,
    demanded_skills.skills,
    demand_numb_skills,
    avg_salary
FROM 
    demanded_skills

INNER JOIN average_salary ON demanded_skills.skill_id = average_salary.skill_id
WHERE
    demand_numb_skills > 10
ORDER BY
    avg_salary DESC,
    demand_numb_skills DESC
LIMIT 25;


-- query in more concise way 

SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_numb_skills,
    Round(AVG(job_postings_fact.salary_year_avg),1) AS avg_salary
FROM
    job_postings_fact

INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE
    job_title_short='Data Scientist'
    AND salary_year_avg IS NOT NULL
    AND job_location = 'New York, NY'

GROUP BY
    skills_dim.skill_id

HAVING
    COUNT(skills_job_dim.job_id) > 10

ORDER BY
    avg_salary DESC,
    demand_numb_skills DESC

LIMIT 25;

