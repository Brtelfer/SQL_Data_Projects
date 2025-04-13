SELECT 
    job_title_short, 
    salary_hour_avg,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_location LIKE 'Anywhere'
AND
    job_title_short IN (
    'Data Scientist', 
    'Data Engineer', 
    'Senior Data Engineer')
AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10;