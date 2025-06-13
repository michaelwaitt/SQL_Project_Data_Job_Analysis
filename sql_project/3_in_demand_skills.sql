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

/*
Top In-Demand Skills for Data Analyst Roles in Dallas, TX
Insights:
---


SQL is the #1 Skill
	•	With over 1,000 mentions, SQL is the undisputed core skill.
	•	It’s foundational across industries, from finance to healthcare to tech.
	•	If you’re only going to learn one tool first — make it SQL.

Excel Still Reigns
	•	Despite newer tools, Excel ranks second, showing its versatility.
	•	Employers value familiarity with spreadsheets for reporting, audits, and collaboration.

Visualization Tools Matter
	•	Both Tableau and Power BI appear frequently.
	•	Strong demand signals that analysts must be able to communicate data visually, not just process it.

Python is Rising Fast
	•	While not topping the list, Python’s 498 count shows growing need.
	•	It’s increasingly expected in roles that involve automation, machine learning, or handling large datasets.

--JSON Output
[
  {
    "skills": "sql",
    "demand_count": "1059"
  },
  {
    "skills": "excel",
    "demand_count": "790"
  },
  {
    "skills": "tableau",
    "demand_count": "597"
  },
  {
    "skills": "python",
    "demand_count": "498"
  },
  {
    "skills": "power bi",
    "demand_count": "393"
  }
]
*/
