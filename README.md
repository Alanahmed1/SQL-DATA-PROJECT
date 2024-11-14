# Introduction
📊 **Exploring the Data Science Job Market!**  
This project provides insights into Data Scientist roles, highlighting 💰 **top-paying jobs**, 🔥 **high-demand skills**, and 📈 where **high demand meets high salary** in data science. Dive in to uncover the skills and opportunities defining today’s data science landscape!

🔍 SQL queries? Check them out here: [project_SQL folder](/project_SQL/)

# Background

This project was created to help navigate the Data Scientist job market more effectively. Its goal is to identify top-paying positions and in-demand skills, making it easier for job seekers to find optimal opportunities.

The data used in this project comes from my [SQL Course](https://lukebarousse.com/sql). It provides valuable insights into job titles, salaries, locations, and the essential skills needed in the data science field.

### The questions I wanted to answer through my SQL queries were:

1. What are the top-paying Data Scientist jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for Data Scientist?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I Used

To dive deep into the data scientist job market, I utilized several key tools:

- **SQL:** The core of my analysis, enabling me to query the database and extract critical insights.
- **PostgreSQL:** The database management system I chose, ideal for managing and analyzing job posting data.
- **Visual Studio Code:** My preferred editor for writing and executing SQL queries, as well as managing database tasks.
- **Git & GitHub:** Essential for version control, collaboration, and sharing SQL scripts and analysis throughout the project.

# The Analysis

Each query in this project was designed to explore specific aspects of the data scientist job market. Below is an overview of the approach taken for each key question:

### 1. Top Paying Data Scientist Jobs
To identify the highest-paying roles, I filtered data scientist positions based on average yearly salary and location, specifically focusing on New York, NY. This analysis highlights the most lucrative opportunities in the field.

```sql
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
```
### Key Insights:
- The highest-paying data scientist role in this list is the **Geographic Information Systems Analyst** at **ReServe**, with a salary of **$585,000**.
- The majority of roles are full-time, indicating a strong demand for full-time data scientist positions.
- Snap Inc. offers multiple high-paying roles for **Engineering Data Scientists**, showcasing the company's continued investment in data science talent.

### 2. Skills for Top Paying Jobs

To understand the skills required for the highest-paying data scientist roles, I joined job postings with skill data. This analysis provides valuable insights into the key competencies employers prioritize for high-compensation positions in the data science field.
```sql
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
```
### Key Insights:

- **Average Salary**: The average salary across the top data scientist positions is **$301,500** per year.
  
- **Most Common Skills**:
  - **Python**: Required in **7** of the top roles.
  - **SQL** and **R**: Each appears in **4** listings.
  - **Spark**: Found in **3** roles.
  - **Excel** and **Express**: Each appears in **2 roles.
  - Other notable skills such as **Azure**, **Go**, **Solidity**, **C**, **Scala**, **Asana**, and **C++** appear once each.


These insights suggest that **Python**, **SQL**, and **R** are the most highly valued skills among high-paying data scientist roles, with other technical skills like **Spark** and **Excel** also being important.

![Top Paying Roles](assets\skills_in_top_paying_jobs.jpg)
*Bar graph visualizing the salary for the top 10 salaries for data scientist; ChatGPT generated this graph from my SQL query results*



## 3. In-Demand Skills for Data Scientists

This project analyzes the most frequently requested skills in job postings for Data Scientist roles. The goal is to provide insights into the skills that are currently in high demand within the field. 

```sql
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
```
### Key Insights:


- **High Demand for Core Skills**: Python (1,487 postings) and SQL (1,146 postings) are in the highest demand, marking them as essential skills for data professionals.
  
- **Data Analysis and Visualization**: R (826 postings) and Tableau (394 postings) have significant demand, highlighting the importance of statistical analysis and data visualization in data roles.

- **Cloud Computing Growth**: AWS appears in 360 job postings, indicating the rising need for cloud skills as data projects increasingly require scalable infrastructure.

- **Skill Prioritization**: For those entering data science or analytics, Python and SQL should be top priorities, followed by R and cloud skills like AWS, to align with industry demands.

## Skills Demand Table

| Skill    | Number of Job Postings |
|----------|------------------------|
| Python   | 1,487                  |
| SQL      | 1,146                  |
| R        | 826                    |
| Tableau  | 394                    |
| AWS      | 360                    |



*Table of the demand for the top 5 skills in data secientist job postings*

### 4. Skills Based on Salary
Exploring the average salaries associated with different skills revealed which skills are the highest paying.

```sql
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
```
### Breakdown of the Top-Paying Skills for Data Scientists

- **High Compensation for Specialized Tech & AI Expertise**: The highest-paying skills are dominated by advanced technologies such as **Solidity**, **Kafka**, and **Hugging Face**. These reflect the demand for expertise in blockchain development, distributed systems, and cutting-edge AI tools that enable predictive analytics, machine learning, and deep learning.
  
- **Growing Value of Project Management & Automation Tools**: Tools like **Asana**, **Airtable**, and **Confluence** highlight the increasing intersection of data science with project management and operational efficiency. Skills in these platforms indicate strong potential for data scientists working in collaborative, fast-paced environments that require organizational and automation expertise.

- **Proficiency in Programming & Data Infrastructure**: Expertise in languages and tools like **PHP**, **C**, **Scala**, **Spark**, and **Redis** signifies a lucrative trend where programming skills and robust data infrastructure knowledge are highly sought after. This trend points to the increasing importance of data scientists who can build and manage scalable data pipelines and perform complex analyses.

### Average Salary Table for Top-Paying Data Scientist Skills

| Skills         | Average Salary ($) |
|----------------|-------------------:|
| Solidity       |          275,000.0 |
| Asana          |          259,000.0 |
| Airtable       |          233,500.0 |
| Kafka          |          212,500.0 |
| Express        |          208,674.6 |
| Redis          |          200,000.0 |
| PHP            |          200,000.0 |
| C              |          195,625.0 |
| Hugging Face   |          189,666.7 |
| RedHat         |          189,500.0 |

*This table reflects the average salaries for the top-paying skills for **Data Scientists**. These skills highlight the high demand for expertise in **advanced technologies**, **data infrastructure**, and **automation tools**, all of which contribute to significant earning potential in the field of data science.*

### 5. Most Optimal Skills to Learn

Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.

```sql
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
```
### Key Insights

#### High-Demand Skills
- **Python** (226 job postings), **SQL** (168 job postings), and **R** (126 job postings) are in the highest demand. These skills are foundational for securing roles in data science.
- **Cloud computing skills** like **AWS** (46 job postings), **Azure** (20 job postings), and **GCP** (18 job postings) are also important, indicating a shift toward cloud-based data infrastructure.

#### High Salary Skills
- The highest-paying skill is **Scala** ($174,818), followed by **Spark** ($172,805) and **PyTorch** ($170,688), indicating a premium for these specialized skills.
- **Go**, **Scikit-learn**, and **Snowflake** are also high-paying, suggesting their importance in areas like big data, machine learning, and data engineering.

#### Skills with Balanced Demand and Salary
- **SQL** and **Python** offer a balance of high demand and competitive salaries, making them crucial skills for aspiring data scientists.
- **TensorFlow**, **PyTorch**, and **Pandas** are excellent for those interested in machine learning and data manipulation.

#### Emerging or Niche Skills
- **Databricks**, **Keras**, and **Looker** have lower demand but command high salaries, indicating that expertise in these areas can be a valuable niche.

#### Cloud and Big Data Skills
- **AWS**, **Azure**, and **GCP** are highly valued in data science, reflecting the growing importance of cloud platforms.
- Big data tools like **Hadoop**, **Spark**, and **Snowflake** are essential for working with large-scale data infrastructures.

## Table: Demand and Salary Comparison for Data Science Skills

| Skill         | Demand (Job Postings) | Average Salary ($) |
|---------------|-----------------------|---------------------|
| Scala         | 11                    | 174,818.2          |
| Spark         | 34                    | 172,805.3          |
| PyTorch       | 26                    | 170,688.5          |
| Snowflake     | 16                    | 168,808.8          |
| Go            | 16                    | 166,012.4          |
| Scikit-learn  | 17                    | 164,811.2          |
| Azure         | 20                    | 163,312.5          |
| Hadoop        | 18                    | 160,001.6          |
| Python        | 226                   | 159,675.3          |
| SQL           | 168                   | 158,365.0          |
| PySpark       | 12                    | 158,012.1          |
| TensorFlow    | 24                    | 154,555.4          |
| R             | 126                   | 153,911.5          |
| Databricks    | 12                    | 153,174.6          |
| Matlab        | 12                    | 151,369.0          |
| Java          | 18                    | 148,977.8          |
| AWS           | 46                    | 148,970.4          |
| Excel         | 22                    | 146,856.5          |
| GCP           | 18                    | 144,944.4          |
| Looker        | 15                    | 140,696.0          |
| Keras         | 12                    | 137,083.3          |
| Pandas        | 30                    | 135,945.5          |
| Git           | 15                    | 135,200.0          |
| SAS           | 19                    | 132,416.7          |
*Table of the most optimal skills for data scientist sorted by salary*

# What I Learned

Throughout this project, I’ve significantly strengthened my SQL skills and gained some valuable tools for data analysis:

- **🧩 Advanced Query Crafting**: Mastered complex SQL query techniques, including multi-table joins and using `WITH` clauses to create temporary tables for streamlined, efficient queries.
- **📊 Data Aggregation Mastery**: Developed a strong command of `GROUP BY` and aggregate functions like `COUNT()` and `AVG()`, transforming them into powerful tools for summarizing and analyzing data.
- **💡 Analytical Problem Solving**: Enhanced my ability to tackle real-world challenges by turning data questions into insightful and actionable SQL queries, bridging the gap between raw data and decision-making.

This project has been a rewarding experience, turning foundational SQL techniques into a robust toolkit for real-world data challenges.

### Insights
From the analysis, several general insights emerged:

1. **Top-Paying Data Analyst Jobs**: The ***highest-paying role is $585,000**** annually, showcasing niche data science fields' earning potential.Demand for permanent data science positions higher than contract or part-time work, providing job stability.

2. **Skills for Top-Paying Jobs**: **Python**, **SQL**, and **R** are the most highly valued skills among high-paying data scientist roles, with other technical skills like **Spark** and **Excel** also being important.

3. **Most In-Demand Skills**: **Python**  and **SQL** are in the highest demand, marking them as essential skills for data professionals.

4. **Skills with Higher Salaries**: increasing demand for blockchain expertise (like Solidity), data engineering tools, and traditional programming languages, all of which come with premium compensation for their respective fields.

5. **Optimal Skills for Job Market Value**: **Python**  and **SQL**  offer a balance of high demand and competitive salaries, making them crucial skills for aspiring data scientists.


### Closing Thoughts

## Final Thoughts

This course helped me progress from SQL fundamentals to advanced techniques, significantly enhancing my data analysis capabilities. My project on the Job Market for Data Scientist provided valuable insights into high-paying roles and the key skills that are in demand. The findings serve as a roadmap for skill development, enabling aspiring data analysts to focus on the most sought-after skills in the job market. By prioritizing these high-demand, high-salary skills, professionals can position themselves more competitively. This project reinforced the importance of continuous learning and staying adaptable to evolving trends in data analytics.

