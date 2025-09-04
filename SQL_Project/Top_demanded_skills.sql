SELECT 
    skills,
    Count(skills_job_dim) as skills_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
where 
    job_title_short = 'Data Analyst' and 
    job_location = 'Anywhere'
GROUP BY skills
ORDER BY skills_count DESC
LIMIT 5;