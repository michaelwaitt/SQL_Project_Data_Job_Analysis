 /*
 What are the most in-demand skills for Data Analyst roles?
     - What are the top 5 skills
     - Focus on all job postings, from Dallas
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact 
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'  AND
    job_location = 'Dallas, TX'
GROUP BY
    skills 
ORDER BY
    demand_count DESC
LIMIT 5;