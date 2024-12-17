/**Analyzing Patient Encounter Duration for Different Classes
Q 0.6
Objective:
Calculate the average encounter duration for each class (EncounterClass) per organization, identifying any encounters that exceed 24 hours.**/

WITH EncounterDurations AS (
    SELECT 
        e.ORGANIZATION,
        o.NAME AS OrganizationName,
        e.ENCOUNTERCLASS,
        e.Id AS EncounterId,
        e.START,
        e.STOP,
        DATEDIFF(HOUR, CAST(e.START AS DATETIME), CAST(e.STOP AS DATETIME)) AS DurationHours
    FROM 
        ENCOUNTERS e
    JOIN 
        ORGANIZATION o ON e.ORGANIZATION = o.Id
    WHERE 
        e.START IS NOT NULL 
        AND e.STOP IS NOT NULL -- Ensure both START and STOP times are available
)
-- Calculate the average encounter duration per class and identify long encounters
SELECT 
    ORGANIZATION,
    OrganizationName,
    ENCOUNTERCLASS,
    AVG(DurationHours) AS AverageDurationHours,
    COUNT(CASE WHEN DurationHours > 24 THEN 1 END) AS EncountersExceeding24Hours
FROM 
    EncounterDurations
GROUP BY 
    ORGANIZATION, OrganizationName, ENCOUNTERCLASS
ORDER BY 
    AverageDurationHours DESC;
