DROP TABLE job_applied;

CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);

SELECT *
FROM job_applied;

INSERT INTO job_applied (
            job_id,
            application_sent_date,
            custom_resume,
            resume_file_name,
            cover_letter_sent,
            cover_letter_file_name,
            status)
VALUES
            (2, '2024-02-03', true, 'resume_01.pdf', true, 'cover_letter_01.pdf', 'submitted'),
            (3, '2024-02-04', false, 'resume_02.pdf', false, 'cover_letter_02.pdf', 'draft'),
            (4, '2024-02-05', true, 'resume_03.pdf', true, 'cover_letter_03.pdf', 'submitted'),
            (5, '2024-02-06', false, 'resume_04.pdf', false, 'cover_letter_04.pdf', 'draft'),
            (6, '2024-02-07', true, 'resume_05.pdf', true, 'cover_letter_05.pdf', 'submitted'),
            (7, '2024-02-08', true, 'resume_06.pdf', true, 'cover_letter_06.pdf', 'submitted'),
            (8, '2024-02-09', false, 'resume_07.pdf', false, 'cover_letter_07.pdf', 'draft'),
            (9, '2024-02-10', true, 'resume_08.pdf', true, 'cover_letter_08.pdf', 'submitted'),
            (10, '2024-02-11', true, 'resume_09.pdf', true, 'cover_letter_09.pdf', 'submitted');

SELECT *
FROM job_applied

ALTER TABLE job_applied
ADD contact VARCHAR(50);

-- Update the contact person for job_id 1
UPDATE job_applied
SET contact = 'Erlich Bachman'
WHERE job_id = 1;

-- Update the contact person for job_id 2
UPDATE job_applied
SET contact = 'Gilfoyle'
WHERE job_id = 2;

-- Update the contact person for job_id 3
UPDATE job_applied
SET contact = 'Dinesh Chugtai'
WHERE job_id = 3;

-- Update the contact person for job_id 4
UPDATE job_applied
SET contact = 'Jared Dunn'
WHERE job_id = 4;

-- Update the contact person for job_id 5
UPDATE job_applied
SET contact = 'Big Head'
WHERE job_id = 5;

-- Update the contact person for job_id 6
UPDATE job_applied
SET contact = 'Monica Hall'
WHERE job_id = 6;

-- Update the contact person for job_id 7
UPDATE job_applied
SET contact = 'Laurie Bream'
WHERE job_id = 7;

-- Update the contact person for job_id 8
UPDATE job_applied
SET contact = 'Gavin Belson'
WHERE job_id = 8;

-- Update the contact person for job_id 9
UPDATE job_applied
SET contact = 'Russ Hanneman'
WHERE job_id = 9;

-- Update the contact person for job_id 10
UPDATE job_applied
SET contact = 'Richard Hendricks'
WHERE job_id = 10;

ALTER TABLE job_applied
RENAME COLUMN contact TO names

ALTER TABLE job_applied
ALTER COLUMN names TYPE TEXT;

SELECT names
FROM job_applied