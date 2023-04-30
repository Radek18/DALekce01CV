-- SELECT, ORDER BY a LIMIT

-- Úkol 1:

SELECT
	*
FROM healthcare_provider hp;

-- Úkol 2:

SELECT
	`name`,
	`provider_type`
FROM healthcare_provider hp;

-- Úkol 3:

SELECT
	`name`,
	`provider_type`
FROM healthcare_provider hp
LIMIT 20;

-- Úkol 4:

SELECT
	*
FROM healthcare_provider hp
ORDER BY `region_code`;

-- Úkol 5:

SELECT
	`name`,
	`region_code`,
	`district_code`
FROM healthcare_provider hp
ORDER BY district_code DESC
LIMIT 500;

-- WHERE

-- Úkol 1:

SELECT
	*
FROM healthcare_provider hp
WHERE `region_code` = 'CZ010';

-- Úkol 2:

SELECT
	`name`,
	`phone`,
	`website`,
	`fax`,
	`email`
FROM healthcare_provider hp
WHERE `region_code` != 'CZ010';

-- Úkol 3:

SELECT
	`name`,
	`region_code`,
	`residence_region_code`
FROM healthcare_provider hp
WHERE `region_code`  = `residence_region_code`;

-- Úkol 4:

SELECT
	`name`,
	`phone`
FROM healthcare_provider hp
WHERE `phone` IS NOT NULL;

-- Úkol 5:

SELECT
	`name`,
	`district_code`
FROM healthcare_provider hp
WHERE
	`district_code` = "CZ0201" 
	OR `district_code` = 'CZ0202'
ORDER BY `district_code`;

-- Tvorba tabulek

-- Úkol 1:

CREATE TABLE t_radek_v_providers_south_moravia AS
SELECT
	*
FROM healthcare_provider hp
WHERE `region_code` = 'CZ064';

-- Úkol 2:

CREATE TABLE t_radek_v_resume (
	`date_start` date,
	`date_end` date,
	`job` varchar(255),
	`location` varchar(255)
);

-- Vkládání dat do tabulky

-- Úkol 1:

CREATE TABLE popis_tabulek (
	`name` varchar(255),
	`table_type` varchar(255),
	`description` varchar(255)
);

INSERT INTO popis_tabulek
VALUES(
	'Jan Novak',
	'lookup_table',
	'Tabulka s popisem zemi a poctem obyvatel'
);

-- Úkol 2:

INSERT INTO t_radek_v_resume
VALUES(
	'2020-05-01',
	NULL,
	'lektor v Engeto Academy',
	'Brno'
);

-- Úkol 3:

INSERT INTO t_radek_v_resume (
	`date_start`,
	`job`,
	`location`
)
VALUES(
	'2020-09-01',
	'OR with Data Science',
	'Edinburgh'
);

INSERT INTO t_radek_v_resume
VALUES(
	'2019-06-01',
	'2020-08-31',
	'výzkumník v Seznam.cz',
	'Praha'
);

INSERT INTO t_radek_v_resume
VALUES(
	'2012-09-01',
	'2015-05-31',
	'bakalář ekonomie',
	'Brno'
);

-- Úprava tabulek

-- Úkol 1:

ALTER TABLE t_radek_v_resume
ADD COLUMN `institution` varchar(255);

ALTER TABLE t_radek_v_resume
ADD COLUMN `role` varchar(255);

-- Úkol 2:

UPDATE t_radek_v_resume
	SET `institution` = 'University of Edinburg'
WHERE `date_start` = '2020-09-01';

UPDATE t_radek_v_resume
	SET `role` = 'MSc student, OR with Data Science'
WHERE `date_start` = '2020-09-01';

UPDATE t_radek_v_resume
	SET `institution` = 'Engeto Academy'
WHERE `date_start` = '2020-05-01';

UPDATE t_radek_v_resume
	SET `role` = 'Lektor'
WHERE `date_start` = '2020-05-01';

UPDATE t_radek_v_resume
	SET `institution` = 'Seznam.cz'
WHERE `date_start` = '2019-06-01';

UPDATE t_radek_v_resume
	SET `role` = 'Výzkumník reklamních systémů'
WHERE `date_start` = '2019-06-01';

UPDATE t_radek_v_resume
	SET `institution` = 'Masarykova univerzita'
WHERE `date_start` = '2012-09-01';

UPDATE t_radek_v_resume
	SET `role` = 'Bc student ekonomie'
WHERE `date_start` = '2012-09-01';

-- Úkol 3:

ALTER TABLE t_radek_v_resume
DROP COLUMN `job`;

ALTER TABLE t_radek_v_resume
DROP COLUMN `location`;

SELECT
	*
FROM t_radek_v_resume trvr;

-- BONUSOVÁ CVIČENÍ

-- COVID-19: SELECT, ORDER BY a LIMIT

-- Úkol 1:

SELECT
	*
FROM covid19_basic cb;

-- Úkol 2:

SELECT
	*
FROM covid19_basic cb
LIMIT 20;

-- Úkol 3:

SELECT
	*
FROM covid19_basic cb
ORDER BY `date`;

-- Úkol 4:

SELECT
	*
FROM covid19_basic cb
ORDER BY `date` DESC;

-- Úkol 5:

SELECT
	`country`
FROM covid19_basic cb;

-- Úkol 6:

SELECT
	`country`,
	`date`
FROM covid19_basic cb;

-- COVID-19: WHERE

-- Úkol 1:

SELECT
	*
FROM covid19_basic cb
WHERE `country` = 'Austria'

-- Úkol 2:

SELECT
	`country`,
	`date`,
	`confirmed`
FROM covid19_basic cb
WHERE `country` = 'Austria';

-- Úkol 3:

SELECT
	*
FROM covid19_basic cb
WHERE  `date` = '2020-08-30';

-- Ukol 4:

SELECT
	*
FROM covid19_basic cb
WHERE
	`date` = '2020-08-30' 
	AND `country` = 'Czechia';

-- Úkol 5:

SELECT
	*
FROM covid19_basic cb
WHERE
	`country` = 'Czechia'
	OR `country` = 'Austria';

-- Úkol 6:

SELECT
	*
FROM covid19_basic cb
WHERE
	`confirmed` = 1000
	OR `confirmed` = 100000;

-- Úkol 7:

SELECT
	*
FROM covid19_basic cb
WHERE
	`confirmed` >= 10
	AND `confirmed` <= 20
	AND `date` = '2020-08-30';

-- Úkol 8:

SELECT
	*
FROM covid19_basic cb
WHERE
	`confirmed` > 1000000
	AND `date` = '2020-08-15';

-- Úkol 9:

SELECT
	`date`,
	`country`,
	`confirmed`
FROM covid19_basic cb
WHERE
	`country` = 'United Kingdom'
	OR `country` = 'France'
ORDER BY `date` DESC;

-- Ukol 10:

SELECT
	*
FROM covid19_basic_differences cbd
WHERE
	`country` = 'Czechia'
	AND `date` >= '2020-09-01'
	AND `date` <= '2020-09-30';

-- Úkol 11:

SELECT
	`population`
FROM lookup_table lt
WHERE `country` = 'Austria';

-- Úkol 12:

SELECT
	*
FROM lookup_table lt
WHERE `population` > 500000000;

-- Úkol 13:

SELECT
	`confirmed`
FROM covid19_basic cb
WHERE 
	`country` = 'India'
	AND `date` = '2020-08-30';

-- Úkol 14:

SELECT
	`admin2`,
	`confirmed`
FROM covid19_detail_us cdu
WHERE
	`province` = 'Florida'
	AND `date` = '2020-08-30';