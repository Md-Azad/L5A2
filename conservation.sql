-- Active: 1747700320295@@127.0.0.1@5432@conservation_db
CREATE table rangers (
    ranger_id serial PRIMARY KEY,
    name varchar(50) NOT NULL,
    region VARCHAR(100) NOT NULL
);

INSERT INTO
    rangers (name, region)
VALUES (
        'Alice Green',
        'Norther Hills'
    ),
    ('Bob White', 'River Delta'),
    (
        'Carol King',
        'Mountain Range'
    );

select * from rangers;

CREATE TABLE species (
    species_id serial PRIMARY KEY,
    common_name varchar(50) NOT NULL,
    scientific_name varchar(100) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status varchar(50) NOT NULL
);

INSERT INTO
    species (
        common_name,
        scientific_name,
        discovery_date,
        conservation_status
    )
VALUES (
        'Snow Leopard',
        'Panthera uncia',
        '1775-01-01',
        'Endangered'
    ),
    (
        'Bengal Tiger',
        'Panthera tigris tigris',
        '1758-01-01',
        'Endangered'
    ),
    (
        'Red Panda',
        'Ailurus fulgens',
        '1825-01-01',
        'Vulnerable'
    ),
    (
        'Asiatic Elephant',
        'Elephas maximus indicus',
        '1758-01-01',
        'Endangered'
    );

select * from species;

CREATE TABLE sightings (
    sighting_id serial PRIMARY KEY,
    species_id int NOT NULL REFERENCES species (species_id),
    ranger_id int NOT NULL REFERENCES rangers (ranger_id),
    location VARCHAR(100) NOT NULL,
    sighting_time TIMESTAMP NOT NULL,
    notes TEXT
);

INSERT INTO
    sightings (
        species_id,
        ranger_id,
        location,
        sighting_time,
        notes
    )
VALUES (
        2,
        2,
        'Bankwood Area',
        '2024-05-12 16:20:00',
        'Juvenile seen'
    ),
    (
        3,
        3,
        'Bamboo Grove East',
        '2024-05-15 09:10:00',
        'Feeding observed'
    ),
    (
        1,
        2,
        'Snowfall Pass',
        '2024-05-18 18:30:00',
        NULL
    );

SELECT * FROM sightings;

--problem 1: insert a new ranger
INSERT INTO
    rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');

--problem 2: Count unique species ever sighted.
SELECT count(DISTINCT species_id) AS unique_species_count
FROM sightings;

--problem 3: Find all sightings where the location includes "Pass".
SELECT * FROM sightings WHERE location LIKE '%Pass%';

--problem 4: List each ranger's name and their total number of sightings.
SELECT name, count(*) as "total_sightings"
FROM sightings
    JOIN rangers on sightings.ranger_id = rangers.ranger_id
GROUP BY
    name
ORDER BY name ASC;

--problem 5: List species that have never been sighted.
SELECT common_name
FROM species
WHERE
    species_id NOT IN (
        SELECT species_id
        FROM sightings
    );

--problem 6: Show the most recent 2 sightings.

SELECT common_name, sighting_time, name
FROM
    species
    JOIN sightings on sightings.species_id = species.species_id
    JOIN rangers on rangers.ranger_id = sightings.ranger_id
ORDER BY sighting_time DESC
LIMIT 2;

--problem 7: Update all species discovered before year 1800 to have status 'Historic'.
UPDATE species
set
    conservation_status = 'Historic'
WHERE
    discovery_date < '1800-01-01';

--problem 8: Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.

CREATE OR REPLACE FUNCTION get_time_label(sighting_time TIMESTAMP)
  
   RETURNS TEXT as 
   $$
    BEGIN
        IF EXTRACT(hour FROM sighting_time) < 12 THEN
             RETURN 'Morning';
        ELSIF EXTRACT(hour FROM sighting_time) >= 12 AND EXTRACT(hour FROM sighting_time) <= 17 THEN
            RETURN 'Afternoon';
        ELSE
            RETURN 'Evening';
        END IF;
    END;
   $$ LANGUAGE plpgsql;

SELECT
    sighting_id,
    get_time_label (sighting_time) AS "time_of_day"
FROM sightings;

--problem 9: Delete rangers who have never sighted any species.
DELETE FROM rangers
WHERE
    rangers.ranger_id NOT IN (
        SELECT ranger_id
        FROM sightings
    );

--problem 8: Ignore this code. Here I just tried to solve the problem using a CASE statement.

-- SELECT
--     sighting_id,
--     CASE
--     WHEN EXTRACT (hour FROM sighting_time) < 12 THEN 'Morning'
--     WHEN EXTRACT (hour FROM sighting_time) >= 12 AND EXTRACT(hour FROM sighting_time) <= 17 THEN 'Afternoon'
--     ELSE 'Evening'
--     END as "time_of_day"
-- FROM sightings;