/* 
What are the required skills for the top_paying jobs for Data Scientist? 
-Use the 10 top_paying Data Scientist jobs from first query
-Add the specific skills required for this role
-Why? it provides a detailed look at which highest paying jobs demand certain skills,
helping job seeker understand which skills to develop that align with top salaries
*/

WITH top_10_paying_jobs AS (
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
    LIMIT 10
    ) 
SELECT 
    top_10_paying_jobs.*,
    skills

FROM top_10_paying_jobs

INNER JOIN skills_job_dim ON top_10_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;


/* 
Average Salary: The average salary across these top data scientist positions is $301,500 per year.
Most Common Skills:
Python: Required in 7 of the top positions.
SQL and R: Each appears in 4 roles.
Spark: Found in 3 listings.
Excel and Express: Each in 2 listings.
Other skills such as Azure, Go, Solidity, C, Scala, Asana, and C++ appear once.
Unique Job Titles: There are 9 unique job titles in this list of top roles.
These insights suggest that Python, SQL, and R are highly valued skills among high-paying data scientist roles. ​
*/



/* 
[
  {
    "job_id": 551617,
    "job_title": "Geographic Information Systems Analyst - GIS Analyst",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "585000.0",
    "job_posted_date": "2023-12-27",
    "companies_name": "ReServe",
    "skills": "excel"
  },
  {
    "job_id": 470044,
    "job_title": "Principal Data Scientist",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-03-04",
    "companies_name": "UBS",
    "skills": "sql"
  },
  {
    "job_id": 470044,
    "job_title": "Principal Data Scientist",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-03-04",
    "companies_name": "UBS",
    "skills": "python"
  },
  {
    "job_id": 470044,
    "job_title": "Principal Data Scientist",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-03-04",
    "companies_name": "UBS",
    "skills": "azure"
  },
  {
    "job_id": 470044,
    "job_title": "Principal Data Scientist",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-03-04",
    "companies_name": "UBS",
    "skills": "spark"
  },
  {
    "job_id": 470044,
    "job_title": "Principal Data Scientist",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-03-04",
    "companies_name": "UBS",
    "skills": "excel"
  },
  {
    "job_id": 601528,
    "job_title": "Engineering Data Scientist, Ad Ranking",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-01-15",
    "companies_name": "Snap Inc",
    "skills": "sql"
  },
  {
    "job_id": 601528,
    "job_title": "Engineering Data Scientist, Ad Ranking",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-01-15",
    "companies_name": "Snap Inc",
    "skills": "python"
  },
  {
    "job_id": 601528,
    "job_title": "Engineering Data Scientist, Ad Ranking",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-01-15",
    "companies_name": "Snap Inc",
    "skills": "r"
  },
  {
    "job_id": 601528,
    "job_title": "Engineering Data Scientist, Ad Ranking",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-01-15",
    "companies_name": "Snap Inc",
    "skills": "express"
  },
  {
    "job_id": 51177,
    "job_title": "Director - Business Data Science",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "314000.0",
    "job_posted_date": "2023-06-22",
    "companies_name": "Figma",
    "skills": "go"
  },
  {
    "job_id": 123805,
    "job_title": "Director of Data Science",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "275000.0",
    "job_posted_date": "2023-07-12",
    "companies_name": "Nord Group",
    "skills": "python"
  },
  {
    "job_id": 123805,
    "job_title": "Director of Data Science",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "275000.0",
    "job_posted_date": "2023-07-12",
    "companies_name": "Nord Group",
    "skills": "r"
  },
  {
    "job_id": 123805,
    "job_title": "Director of Data Science",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "275000.0",
    "job_posted_date": "2023-07-12",
    "companies_name": "Nord Group",
    "skills": "solidity"
  },
  {
    "job_id": 939315,
    "job_title": "Engineering Data Scientist, Ad Ranking (Greater NYC Area, NY)",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "265500.0",
    "job_posted_date": "2023-03-27",
    "companies_name": "Snap Inc.",
    "skills": "sql"
  },
  {
    "job_id": 939315,
    "job_title": "Engineering Data Scientist, Ad Ranking (Greater NYC Area, NY)",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "265500.0",
    "job_posted_date": "2023-03-27",
    "companies_name": "Snap Inc.",
    "skills": "python"
  },
  {
    "job_id": 939315,
    "job_title": "Engineering Data Scientist, Ad Ranking (Greater NYC Area, NY)",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "265500.0",
    "job_posted_date": "2023-03-27",
    "companies_name": "Snap Inc.",
    "skills": "r"
  },
  {
    "job_id": 939315,
    "job_title": "Engineering Data Scientist, Ad Ranking (Greater NYC Area, NY)",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "265500.0",
    "job_posted_date": "2023-03-27",
    "companies_name": "Snap Inc.",
    "skills": "c"
  },
  {
    "job_id": 939315,
    "job_title": "Engineering Data Scientist, Ad Ranking (Greater NYC Area, NY)",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "265500.0",
    "job_posted_date": "2023-03-27",
    "companies_name": "Snap Inc.",
    "skills": "express"
  },
  {
    "job_id": 1591629,
    "job_title": "Data Scientist, Dependency Planning",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "259000.0",
    "job_posted_date": "2023-09-04",
    "companies_name": "Asana",
    "skills": "sql"
  },
  {
    "job_id": 1591629,
    "job_title": "Data Scientist, Dependency Planning",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "259000.0",
    "job_posted_date": "2023-09-04",
    "companies_name": "Asana",
    "skills": "python"
  },
  {
    "job_id": 1591629,
    "job_title": "Data Scientist, Dependency Planning",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "259000.0",
    "job_posted_date": "2023-09-04",
    "companies_name": "Asana",
    "skills": "scala"
  },
  {
    "job_id": 1591629,
    "job_title": "Data Scientist, Dependency Planning",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "259000.0",
    "job_posted_date": "2023-09-04",
    "companies_name": "Asana",
    "skills": "asana"
  },
  {
    "job_id": 310226,
    "job_title": "Principal Data Scientist - BCG X & BCG Fed",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "253000.0",
    "job_posted_date": "2023-11-19",
    "companies_name": "Boston Consulting Group",
    "skills": "python"
  },
  {
    "job_id": 310226,
    "job_title": "Principal Data Scientist - BCG X & BCG Fed",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "253000.0",
    "job_posted_date": "2023-11-19",
    "companies_name": "Boston Consulting Group",
    "skills": "spark"
  },
  {
    "job_id": 69856,
    "job_title": "Full Stack Data Scientist",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-09-21",
    "companies_name": "Oakridge Staffing",
    "skills": "python"
  },
  {
    "job_id": 69856,
    "job_title": "Full Stack Data Scientist",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-09-21",
    "companies_name": "Oakridge Staffing",
    "skills": "r"
  },
  {
    "job_id": 69856,
    "job_title": "Full Stack Data Scientist",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-09-21",
    "companies_name": "Oakridge Staffing",
    "skills": "c++"
  },
  {
    "job_id": 69856,
    "job_title": "Full Stack Data Scientist",
    "job_location": "New York, NY",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-09-21",
    "companies_name": "Oakridge Staffing",
    "skills": "spark"
  }
]
*/ 
