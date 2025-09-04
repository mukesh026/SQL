with skills_demand As (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        Count(skills_job_dim) as skills_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    where 
        job_title_short = 'Data Analyst' and 
        job_location = 'Anywhere' AND
        salary_year_avg is not null
    GROUP BY skills_dim.skill_id
), skills_average_salary as (
    SELECT 
        skills_job_dim.skill_id,
        round(avg(salary_year_avg),0) as Average_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    where 
        job_title_short = 'Data Analyst' and 
        salary_year_avg IS NOT NULL and
        job_location = 'Anywhere'
    GROUP BY skills_job_dim.skill_id
)
SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    skills_count,
    Average_salary
from skills_demand
INNER JOIN skills_average_salary on skills_demand.skill_id = skills_average_salary.skill_id
where skills_count>10
ORDER BY 
    Average_salary DESC,
    skills_count DESC
limit 20;