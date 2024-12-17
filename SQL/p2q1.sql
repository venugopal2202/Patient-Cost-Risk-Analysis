/*Evaluating Financial Risk by Encounter Outcome
Q 0.1
Objective:
Determine which ReasonCodes lead to the highest financial risk based on the total uncovered cost
 (difference between total claim cost and payer coverage).*/

WITH Encounter_Costs AS (
    SELECT 
        e.Id AS EncounterId,
        e.REASONDESCRIPTION,							/*The question aims to identify  medical encounters (ReasonCodes) result in
														 the highest financial burden on patients.*/
		e.REASONCODE,
        e.DESCRIPTION AS EncounterDescription,
        e.TOTAL_CLAIM_COST,
        e.PAYER_COVERAGE,
        (CAST(e.TOTAL_CLAIM_COST AS DECIMAL(18,2)) - CAST(e.PAYER_COVERAGE AS DECIMAL(18,2))) AS UncoveredCost,
        e.ENCOUNTERCLASS AS EncounterOutcome,
        p.GENDER
    FROM 
        ENCOUNTERS e
    JOIN 
        PATIENTS p ON e.PATIENT = p.Id
),
Aggregated_Risk AS (
    SELECT 
        REASONCODE,
        REASONDESCRIPTION,
        AVG(UncoveredCost) AS AvgUncoveredCost,
        SUM(UncoveredCost) AS TotalUncoveredCost,
        COUNT(EncounterId) AS TotalEncounters,
        -- Calculating male and female percentage of total encounters for each reason code
        SUM(CASE WHEN GENDER = 'M' THEN 1 ELSE 0 END) * 100.0 / COUNT(EncounterId) AS MalePercentage,
        SUM(CASE WHEN GENDER = 'F' THEN 1 ELSE 0 END) * 100.0 / COUNT(EncounterId) AS FemalePercentage
    FROM 
        Encounter_Costs
    GROUP BY 
        REASONCODE, REASONDESCRIPTION
)
SELECT 
    REASONCODE,
    REASONDESCRIPTION,
    AvgUncoveredCost,
    TotalUncoveredCost,
    TotalEncounters,
    MalePercentage,
    FemalePercentage
FROM 
    Aggregated_Risk
ORDER BY 
    TotalUncoveredCost DESC;
