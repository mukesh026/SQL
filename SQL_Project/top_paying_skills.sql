SELECT 
    skills,
    round(avg(salary_year_avg),0) as Average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
where 
    job_title_short = 'Data Analyst' and 
    salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY  Average_salary DESC
LIMIT 20;

--Programming & Niche Tech
--Cloud, DevOps & Infrastructure 
-- AI & Data Science