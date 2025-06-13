/*
    What are the top skills based on salary for Data Analyst roles?
        - Focus on the top 25 skills for Data Analyst roles 
        - Look at average salary associated with each skill
        - Location specific, Dallas, TX
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary 
FROM job_postings_fact 
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL 
    AND job_location = 'Dallas, TX'
GROUP BY
    skills 
ORDER BY
    avg_salary DESC
LIMIT 25;

/* 
Top Skills for Data Analyst Roles in Dallas, TX (by Average Salary)
Insights: 
---

Cloud & Big Data Platforms Dominate
	•	GCP, AWS, Azure, Databricks, Spark, Hadoop, Snowflake — all top-paying.
	•	These skills suggest that data analysts with cloud engineering and big data experience command premium salaries.

Legacy and Specialized DB Tools Pay Well
	•	MySQL, DB2, Redshift, MongoDB show strong value.
	•	Reflects a demand for analysts who can interface with diverse data systems, both old and new.

Niche BI Tools Are Lucrative
	•	Qlik (2nd highest) and Looker, Alteryx stand out.
	•	Not as common, but high-paying for specialists — great for niche skill positioning.

Technical Programming Skills Pay Off
	•	Bash, Go, Scala, VBA — not always core analyst tools but show higher pay where roles are more technical or hybrid with engineering.

Soft & Office Tools Still Matter
	•	Visio, Sheets, Jira are surprisingly high — indicating value in documentation, collaboration, and project management experience.

--JSON Output
[
  {
    "skills": "gcp",
    "avg_salary": "160000"
  },
  {
    "skills": "qlik",
    "avg_salary": "150000"
  },
  {
    "skills": "mysql",
    "avg_salary": "147500"
  },
  {
    "skills": "databricks",
    "avg_salary": "145000"
  },
  {
    "skills": "aws",
    "avg_salary": "139000"
  },
  {
    "skills": "azure",
    "avg_salary": "136667"
  },
  {
    "skills": "spark",
    "avg_salary": "133750"
  },
  {
    "skills": "sheets",
    "avg_salary": "127500"
  },
  {
    "skills": "bash",
    "avg_salary": "125000"
  },
  {
    "skills": "db2",
    "avg_salary": "122500"
  },
  {
    "skills": "pandas",
    "avg_salary": "118965"
  },
  {
    "skills": "snowflake",
    "avg_salary": "118427"
  },
  {
    "skills": "hadoop",
    "avg_salary": "118088"
  },
  {
    "skills": "scala",
    "avg_salary": "117500"
  },
  {
    "skills": "jira",
    "avg_salary": "115000"
  },
  {
    "skills": "visio",
    "avg_salary": "114333"
  },
  {
    "skills": "mongodb",
    "avg_salary": "111175"
  },
  {
    "skills": "jquery",
    "avg_salary": "108360"
  },
  {
    "skills": "css",
    "avg_salary": "108360"
  },
  {
    "skills": "looker",
    "avg_salary": "107762"
  },
  {
    "skills": "go",
    "avg_salary": "106262"
  },
  {
    "skills": "vba",
    "avg_salary": "106000"
  },
  {
    "skills": "redshift",
    "avg_salary": "105120"
  },
  {
    "skills": "git",
    "avg_salary": "104900"
  },
  {
    "skills": "alteryx",
    "avg_salary": "102988"
  }
]
*/