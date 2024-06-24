/*
    Question: What are the top skills based on salary ?
*/

SELECT
    skills,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_skill_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_postings_fact.salary_year_avg IS NOT NULL AND
    job_work_from_home = True
GROUP BY 
    skills
ORDER BY
   avg_skill_salary DESC
LIMIT 5

/*
    Outliers and Salary Range:
    The average salary for "svn" is an extreme outlier at $400,000, significantly higher than the others. The second highest salary is for "solidity" at $179,000.
    The majority of the listed skills have average salaries ranging between $115,000 and $160,000, which seems to be the typical range for the skills provided.

    Emerging Technologies and Demand:
    High salaries for skills like "solidity" ($179,000) and "datarobot" ($155,486) suggest strong demand for expertise in blockchain development and automated machine learning respectively.
    Skills related to popular programming languages and frameworks such as "golang" ($155,000), "keras" ($127,013), and "pytorch" ($125,226) also command significant salaries, indicating their importance in current tech job markets.

    DevOps and Data Engineering Tools:
    Several DevOps and data engineering tools are listed with substantial average salaries, such as "terraform" ($146,734), "kafka" ($129,999), and "airflow" ($116,387). This indicates the crucial role of DevOps practices and data engineering in modern software development and data management workflows.
*/