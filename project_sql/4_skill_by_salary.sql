SELECT
    salary_bin,
    COUNT(*) AS jobs_in_bin,
    STRING_AGG(DISTINCT skills, ', ' ORDER BY skills) AS skills_in_bin
FROM (
    SELECT
        skills,
        salary_year_avg,
        CASE
            WHEN salary_year_avg < 30000 THEN '0-30k'
            WHEN salary_year_avg >= 30000 AND salary_year_avg < 40000 THEN '30k-40k'
            WHEN salary_year_avg >= 40000 AND salary_year_avg < 50000 THEN '40k-50k'
            WHEN salary_year_avg >= 50000 AND salary_year_avg < 60000 THEN '50k-60k'
            WHEN salary_year_avg >= 60000 AND salary_year_avg < 70000 THEN '60k-70k'
            WHEN salary_year_avg >= 70000 AND salary_year_avg < 80000 THEN '70k-80k'
            WHEN salary_year_avg >= 80000 AND salary_year_avg < 90000 THEN '80k-90k'
            WHEN salary_year_avg >= 90000 AND salary_year_avg < 100000 THEN '90k-100k'
            WHEN salary_year_avg >= 100000 AND salary_year_avg < 110000 THEN '100k-110k'
            WHEN salary_year_avg >= 110000 AND salary_year_avg < 120000 THEN '110k-120k'
            WHEN salary_year_avg >= 120000 AND salary_year_avg < 130000 THEN '120k-130k'
            WHEN salary_year_avg >= 130000 AND salary_year_avg < 140000 THEN '130k-140k'
            WHEN salary_year_avg >= 140000 AND salary_year_avg < 150000 THEN '140k-150k'
            ELSE '150k+'
        END AS salary_bin
    FROM
        job_postings_fact
    INNER JOIN
        skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN
        skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        salary_year_avg IS NOT NULL
) AS subquery
GROUP BY
    salary_bin
ORDER BY
    CASE 
        WHEN salary_bin = '0-30k' THEN 0
        WHEN salary_bin = '30k-40k' THEN 1
        WHEN salary_bin = '40k-50k' THEN 2
        WHEN salary_bin = '50k-60k' THEN 3
        WHEN salary_bin = '60k-70k' THEN 4
        WHEN salary_bin = '70k-80k' THEN 5
        WHEN salary_bin = '80k-90k' THEN 6
        WHEN salary_bin = '90k-100k' THEN 7
        WHEN salary_bin = '100k-110k' THEN 8
        WHEN salary_bin = '110k-120k' THEN 9
        WHEN salary_bin = '120k-130k' THEN 10
        WHEN salary_bin = '130k-140k' THEN 11
        WHEN salary_bin = '140k-150k' THEN 12
        ELSE 13
    END;