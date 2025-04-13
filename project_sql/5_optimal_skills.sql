WITH skill_data AS (
    SELECT
        s.skills,
        COUNT(j.job_id) AS job_count,
        AVG(j.salary_year_avg) AS avg_salary
    FROM
        job_postings_fact j
    INNER JOIN skills_job_dim sj ON j.job_id = sj.job_id
    INNER JOIN skills_dim s ON sj.skill_id = s.skill_id
    WHERE
        j.salary_year_avg IS NOT NULL
    GROUP BY
        s.skills
),

skill_stats AS (
    SELECT
        skills,
        job_count,
        avg_salary,
        PERCENT_RANK() OVER (ORDER BY job_count) AS demand_percentile,
        PERCENT_RANK() OVER (ORDER BY avg_salary) AS salary_percentile,
        (job_count * avg_salary) / 1000 AS raw_opportunity_score
    FROM
        skill_data
)

SELECT
    sd.skills,
    ROUND(sd.avg_salary::numeric, 0) AS avg_salary,
    sd.job_count,
    ROUND((ss.demand_percentile * 100)::numeric, 1) AS demand_percentile,
    ROUND((ss.salary_percentile * 100)::numeric, 1) AS salary_percentile,
    ROUND(((ss.demand_percentile + ss.salary_percentile)/2 * 100)::numeric, 1) AS combined_score,
    ROUND(ss.raw_opportunity_score::numeric, 0) AS opportunity_score,
    CASE
        WHEN ss.demand_percentile >= 0.8 AND ss.salary_percentile >= 0.8 THEN 'Elite'
        WHEN ss.demand_percentile >= 0.8 OR ss.salary_percentile >= 0.8 THEN 'High Value'
        WHEN ss.demand_percentile >= 0.5 AND ss.salary_percentile >= 0.5 THEN 'Solid'
        ELSE 'Developing'
    END AS skill_tier
FROM
    skill_data sd
JOIN
    skill_stats ss ON sd.skills = ss.skills
WHERE
    sd.job_count >= 50
ORDER BY
    opportunity_score DESC,
    combined_score DESC
LIMIT 50;