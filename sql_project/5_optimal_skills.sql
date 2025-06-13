/*
-What are the most optimal skills to learn? (is it high in demand and a high paying skill)
-Location: Dallas, TX with sepcified salaries 
- Focus on the top 25 skills for Data Analyst roles 
*/ 

WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id, 
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact 
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'  
        AND salary_year_avg IS NOT NULL 
        AND job_location = 'Dallas, TX'
    GROUP BY
        skills_dim.skill_id  
),

 average_salary AS (
    SELECT 
        skills_dim.skill_id,
    
        ROUND(AVG(salary_year_avg), 0) AS avg_salary 
    FROM job_postings_fact 
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL 
        AND job_location = 'Dallas, TX'
    GROUP BY
        skills_dim.skill_id 
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM 
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 5
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;

/*
Top Optimal Skills for Data Analyst Roles in Dallas, TX
Insights:
---
Most Valuable All-Rounders
	•	Python, Power BI, Tableau, and SQL have both high demand and solid salaries, making them must-learn skills for aspiring data analysts.

Strategic Specializations
	•	Azure, Snowflake, and Alteryx offer high salary per demand unit, suggesting less competition and higher leverage.
	•	These are ideal for professionals looking to differentiate themselves in the market.

Communication Tools Matter
	•	PowerPoint and Excel have high demand, emphasizing that employers still value presentation and spreadsheet skills, especially in business-facing roles.

Academic Edge
	•	R and SQL Server are less trendy than Python/Snowflake but offer good salary for modest demand, indicating value in enterprise or academic data roles.

-- JSON Output
[
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "6",
    "avg_salary": "136667"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "7",
    "avg_salary": "118427"
  },
  {
    "skill_id": 201,
    "skills": "alteryx",
    "demand_count": "6",
    "avg_salary": "102988"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "22",
    "avg_salary": "100986"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demand_count": "9",
    "avg_salary": "99687"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_count": "12",
    "avg_salary": "97775"
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "50",
    "avg_salary": "94483"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "9",
    "avg_salary": "94472"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "22",
    "avg_salary": "93309"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "27",
    "avg_salary": "93163"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "29",
    "avg_salary": "86583"
  }
]
*/