/*
What are the top_paying jobs data Scientist jobs?
-identify the top 10 highest-paying Data Scientist roles that are available in New York, NY.
-foucus on job postings with specified salaries (remove null)
-why? Highlight the top paying oppertunities for Data Analsyst, offering insights into employment 
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date ::DATE,
    name AS companies_name
    
FROM 
    job_postings_fact
LEFT JOIN company_dim AS company_jobs ON job_postings_fact.company_id = company_jobs.company_id
WHERE
    job_title_short ='Data Scientist' AND
    job_location ='New York, NY' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;

