SELECT * FROM company_dim

COPY company_dim
FROM '/Users/brtelfer/Documents/SQL_Data_Projects/Data/company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM '/Users/brtelfer/Documents/SQL_Data_Projects/Data/skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM '/Users/brtelfer/Documents/SQL_Data_Projects/Data/job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM '/Users/brtelfer/Documents/SQL_Data_Projects/Data/skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
