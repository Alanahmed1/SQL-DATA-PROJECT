/* 
What are the most in_Demanded skills for Data Scientist?
-Join job_postings to inner join table simmlar to query 2
-Identify the top in-demanded skills for Data Scientist
-foucus on all job postings
-Why? Retrieves the top 5 skills with the highest demand in the job market,
provide insights into the most valuble skills for job seekers.
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_numb_skills

FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE 
    job_title_short='Data Scientist' 
AND
    job_location = 'New York, NY'
GROUP BY 
    skills
ORDER BY
    demand_numb_skills DESC
LIMIT 5;