

/*
What are the top paying jobs for Data Analyst roles?
    - Jobs that are remote
    - What are the salaries
    - Top 10
    - What are the top skills required for these jobs
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
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
LIMIT 10;

/*
Top Paying Data Analyst Jobs in Dallas, TX
Insights:
---
Leadership & Specialized Roles Pay More
	•	The two top-paying roles (both at $185K) are director and delivery manager positions, emphasizing leadership and strategy in analytics.
	•	Titles with “Manager,” “Director,” or “Lead” are pulling higher salaries than typical analyst titles.

Platform Expertise Increases Value
	•	Jobs like “Azure Data Analytics Manager” ($140K) highlight how cloud platform specialization (Azure, AWS, GCP) can bump up salaries.

Big Brands = Big Paychecks
	•	Notable employers like AT&T, Costco, and KPMG offer competitive salaries, reflecting the value of data analytics across sectors.

Standard Analyst Roles Are Still Lucrative
	•	Even non-managerial roles like “Data Analyst” and “Marketing Data Analyst” are landing salaries between $120K–$135K, showing strong baseline compensation in Dallas.
*/