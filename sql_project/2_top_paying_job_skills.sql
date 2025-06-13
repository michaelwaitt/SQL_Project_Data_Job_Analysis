/*
What skills are required for the top paying Data Analyst jobs in Dallas, TX?
    - Jobs that are remote
    - What are the salaries
    - Top 10
    - What are the top skills required for these jobs
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name 
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id 
    WHERE
        job_title_short = 'Data Analyst'
        AND job_location = 'Dallas, TX'
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)
SELECT 
    top_paying_jobs.*,
    skills 
FROM top_paying_jobs 
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;

/*
Analysis of the top paying Data Analyst jobs in Dallas, TX reveals several key insights regarding the skills required:
	•	SQL dominates — unsurprising for data analyst roles; foundational for querying and data manipulation.
	•	Python is prominent, likely reflecting roles involving automation, scripting, or data analysis beyond Excel.
	•	Cloud & Data Platforms like Azure, AWS, and GCP show high demand for cloud fluency.
	•	BI Tools like Power BI and Tableau appear in multiple listings, reinforcing the need for data visualization skills.
	•	Emerging tools like Snowflake and programming languages like Go hint at more modern or hybrid job responsibilities.

[
  {
    "job_id": 325561,
    "job_title": "Director of Consumer Data and Analytics",
    "salary_year_avg": "185000.0",
    "company_name": "Renuity",
    "skills": "sql"
  },
  {
    "job_id": 325561,
    "job_title": "Director of Consumer Data and Analytics",
    "salary_year_avg": "185000.0",
    "company_name": "Renuity",
    "skills": "mysql"
  },
  {
    "job_id": 325561,
    "job_title": "Director of Consumer Data and Analytics",
    "salary_year_avg": "185000.0",
    "company_name": "Renuity",
    "skills": "sql server"
  },
  {
    "job_id": 325561,
    "job_title": "Director of Consumer Data and Analytics",
    "salary_year_avg": "185000.0",
    "company_name": "Renuity",
    "skills": "azure"
  },
  {
    "job_id": 325561,
    "job_title": "Director of Consumer Data and Analytics",
    "salary_year_avg": "185000.0",
    "company_name": "Renuity",
    "skills": "aws"
  },
  {
    "job_id": 325561,
    "job_title": "Director of Consumer Data and Analytics",
    "salary_year_avg": "185000.0",
    "company_name": "Renuity",
    "skills": "tableau"
  },
  {
    "job_id": 325561,
    "job_title": "Director of Consumer Data and Analytics",
    "salary_year_avg": "185000.0",
    "company_name": "Renuity",
    "skills": "looker"
  },
  {
    "job_id": 325561,
    "job_title": "Director of Consumer Data and Analytics",
    "salary_year_avg": "185000.0",
    "company_name": "Renuity",
    "skills": "qlik"
  },
  {
    "job_id": 1730160,
    "job_title": "BFSI Data Analytics Delivery Manager/Lead",
    "salary_year_avg": "185000.0",
    "company_name": "Hitachi Vantara",
    "skills": "azure"
  },
  {
    "job_id": 1730160,
    "job_title": "BFSI Data Analytics Delivery Manager/Lead",
    "salary_year_avg": "185000.0",
    "company_name": "Hitachi Vantara",
    "skills": "aws"
  },
  {
    "job_id": 1730160,
    "job_title": "BFSI Data Analytics Delivery Manager/Lead",
    "salary_year_avg": "185000.0",
    "company_name": "Hitachi Vantara",
    "skills": "snowflake"
  },
  {
    "job_id": 1730160,
    "job_title": "BFSI Data Analytics Delivery Manager/Lead",
    "salary_year_avg": "185000.0",
    "company_name": "Hitachi Vantara",
    "skills": "gcp"
  },
  {
    "job_id": 1351332,
    "job_title": "Professional Advanced Analytics",
    "salary_year_avg": "150000.0",
    "company_name": "AT&T",
    "skills": "sql"
  },
  {
    "job_id": 1351332,
    "job_title": "Professional Advanced Analytics",
    "salary_year_avg": "150000.0",
    "company_name": "AT&T",
    "skills": "python"
  },
  {
    "job_id": 1351332,
    "job_title": "Professional Advanced Analytics",
    "salary_year_avg": "150000.0",
    "company_name": "AT&T",
    "skills": "go"
  },
  {
    "job_id": 1351332,
    "job_title": "Professional Advanced Analytics",
    "salary_year_avg": "150000.0",
    "company_name": "AT&T",
    "skills": "azure"
  },
  {
    "job_id": 1351332,
    "job_title": "Professional Advanced Analytics",
    "salary_year_avg": "150000.0",
    "company_name": "AT&T",
    "skills": "databricks"
  },
  {
    "job_id": 1351332,
    "job_title": "Professional Advanced Analytics",
    "salary_year_avg": "150000.0",
    "company_name": "AT&T",
    "skills": "aws"
  },
  {
    "job_id": 1351332,
    "job_title": "Professional Advanced Analytics",
    "salary_year_avg": "150000.0",
    "company_name": "AT&T",
    "skills": "snowflake"
  },
  {
    "job_id": 1351332,
    "job_title": "Professional Advanced Analytics",
    "salary_year_avg": "150000.0",
    "company_name": "AT&T",
    "skills": "spark"
  },
  {
    "job_id": 1351332,
    "job_title": "Professional Advanced Analytics",
    "salary_year_avg": "150000.0",
    "company_name": "AT&T",
    "skills": "tableau"
  },
  {
    "job_id": 1351332,
    "job_title": "Professional Advanced Analytics",
    "salary_year_avg": "150000.0",
    "company_name": "AT&T",
    "skills": "power bi"
  },
  {
    "job_id": 1186575,
    "job_title": "Data Analysis, Program Manager",
    "salary_year_avg": "148000.0",
    "company_name": "Derflan, Inc.t",
    "skills": "word"
  },
  {
    "job_id": 1186575,
    "job_title": "Data Analysis, Program Manager",
    "salary_year_avg": "148000.0",
    "company_name": "Derflan, Inc.t",
    "skills": "powerpoint"
  },
  {
    "job_id": 1186575,
    "job_title": "Data Analysis, Program Manager",
    "salary_year_avg": "148000.0",
    "company_name": "Derflan, Inc.t",
    "skills": "visio"
  },
  {
    "job_id": 70933,
    "job_title": "Azure Data Analytics Manager",
    "salary_year_avg": "140000.0",
    "company_name": "Oscar",
    "skills": "sql"
  },
  {
    "job_id": 70933,
    "job_title": "Azure Data Analytics Manager",
    "salary_year_avg": "140000.0",
    "company_name": "Oscar",
    "skills": "python"
  },
  {
    "job_id": 70933,
    "job_title": "Azure Data Analytics Manager",
    "salary_year_avg": "140000.0",
    "company_name": "Oscar",
    "skills": "r"
  },
  {
    "job_id": 70933,
    "job_title": "Azure Data Analytics Manager",
    "salary_year_avg": "140000.0",
    "company_name": "Oscar",
    "skills": "azure"
  },
  {
    "job_id": 70933,
    "job_title": "Azure Data Analytics Manager",
    "salary_year_avg": "140000.0",
    "company_name": "Oscar",
    "skills": "databricks"
  },
  {
    "job_id": 70933,
    "job_title": "Azure Data Analytics Manager",
    "salary_year_avg": "140000.0",
    "company_name": "Oscar",
    "skills": "power bi"
  },
  {
    "job_id": 70933,
    "job_title": "Azure Data Analytics Manager",
    "salary_year_avg": "140000.0",
    "company_name": "Oscar",
    "skills": "git"
  },
  {
    "job_id": 337554,
    "job_title": "System Data Analyst- Full Time",
    "salary_year_avg": "135000.0",
    "company_name": "Avance Consulting",
    "skills": "sql"
  },
  {
    "job_id": 337554,
    "job_title": "System Data Analyst- Full Time",
    "salary_year_avg": "135000.0",
    "company_name": "Avance Consulting",
    "skills": "python"
  },
  {
    "job_id": 337554,
    "job_title": "System Data Analyst- Full Time",
    "salary_year_avg": "135000.0",
    "company_name": "Avance Consulting",
    "skills": "gcp"
  },
  {
    "job_id": 337554,
    "job_title": "System Data Analyst- Full Time",
    "salary_year_avg": "135000.0",
    "company_name": "Avance Consulting",
    "skills": "sheets"
  },
  {
    "job_id": 337554,
    "job_title": "System Data Analyst- Full Time",
    "salary_year_avg": "135000.0",
    "company_name": "Avance Consulting",
    "skills": "flow"
  },
  {
    "job_id": 228881,
    "job_title": "Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Costco Wholesale",
    "skills": "sql"
  },
  {
    "job_id": 228881,
    "job_title": "Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Costco Wholesale",
    "skills": "bash"
  },
  {
    "job_id": 228881,
    "job_title": "Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Costco Wholesale",
    "skills": "powershell"
  },
  {
    "job_id": 228881,
    "job_title": "Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Costco Wholesale",
    "skills": "vba"
  },
  {
    "job_id": 228881,
    "job_title": "Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Costco Wholesale",
    "skills": "power bi"
  },
  {
    "job_id": 228881,
    "job_title": "Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Costco Wholesale",
    "skills": "flow"
  },
  {
    "job_id": 222879,
    "job_title": "Manager, Data Analysis",
    "salary_year_avg": "125000.0",
    "company_name": "KPMG",
    "skills": "sql"
  },
  {
    "job_id": 222879,
    "job_title": "Manager, Data Analysis",
    "salary_year_avg": "125000.0",
    "company_name": "KPMG",
    "skills": "go"
  },
  {
    "job_id": 222879,
    "job_title": "Manager, Data Analysis",
    "salary_year_avg": "125000.0",
    "company_name": "KPMG",
    "skills": "hadoop"
  },
  {
    "job_id": 222879,
    "job_title": "Manager, Data Analysis",
    "salary_year_avg": "125000.0",
    "company_name": "KPMG",
    "skills": "alteryx"
  },
  {
    "job_id": 789442,
    "job_title": "Production Support Data Analyst(R1282)",
    "salary_year_avg": "122500.0",
    "company_name": "Sompo International",
    "skills": "sql"
  },
  {
    "job_id": 789442,
    "job_title": "Production Support Data Analyst(R1282)",
    "salary_year_avg": "122500.0",
    "company_name": "Sompo International",
    "skills": "sql server"
  },
  {
    "job_id": 789442,
    "job_title": "Production Support Data Analyst(R1282)",
    "salary_year_avg": "122500.0",
    "company_name": "Sompo International",
    "skills": "db2"
  },
  {
    "job_id": 789442,
    "job_title": "Production Support Data Analyst(R1282)",
    "salary_year_avg": "122500.0",
    "company_name": "Sompo International",
    "skills": "sap"
  },
  {
    "job_id": 1187071,
    "job_title": "Marketing Data Analyst",
    "salary_year_avg": "120000.0",
    "company_name": "CyberCoders",
    "skills": "python"
  },
  {
    "job_id": 1187071,
    "job_title": "Marketing Data Analyst",
    "salary_year_avg": "120000.0",
    "company_name": "CyberCoders",
    "skills": "tableau"
  }
]
*/
