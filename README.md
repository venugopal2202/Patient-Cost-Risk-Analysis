
# 🏥 Pandemic Mortality Trends: A Deep Dive into Provisional COVID-19 Death Data
# 📊 Project Overview
This project focuses on identifying patients with frequent high-cost encounters, analyzing procedure costs, and evaluating financial risks due to payer coverage gaps. Leveraging SQL-based analysis and Power BI visualizations, the project aims to uncover insights to improve operational efficiency, patient care, and resource planning in healthcare organizations.

# 🔍 Problem Statement
Healthcare organizations face challenges in managing financial risks and costs due to:

Frequent High-Cost Encounters
Uncovered Costs by Payer Coverage
Trends in Procedure Costs and Diagnosis Correlations
The analysis uses SQL to identify patterns across 5 key tables:

Encounters
Patients
Procedures
Payers
Organizations
# ⚙️ Tools & Technologies Used
SQL: Data cleaning, querying, and analysis.

Power BI: Interactive visualizations and dashboards.
# 🗂️ Dataset Description
|SL-NO|NAME|DESCRIBE|LINK|
|-|-|-|-|
|00|data_dictionary|Details about dataset|https://github.com/venugopal2202/project_02/blob/main/DATASET/data_dictionary.csv|
|01|Encounters|Details of patient visits, cost, class, and duration.|https://github.com/venugopal2202/project_02/blob/main/DATASET/encounters.csv|
|02|Patients| Demographic details of patients|https://github.com/venugopal2202/project_02/blob/main/DATASET/patients.csv|
|03|Procedures| Information on procedures performed during encounters.|https://github.com/venugopal2202/project_02/blob/main/DATASET/procedures.csv|
|04|Payers|Payer contributions and coverage gaps|https://github.com/venugopal2202/project_02/blob/main/DATASET/payers.csv|
|05|Organizations| Geographical and organizational-level data|https://github.com/venugopal2202/project_02/blob/main/DATASET/organizations.csv|


# 🛠️ Data Preparation (Cleaning and Loading)
The data preparation phase involved creating tables, loading data from CSV files, and cleaning fields to ensure data consistency.

### Tables created:  https://github.com/venugopal2202/project_02/blob/main/SQL/CREATING%20TABLE%20AND%20INJECTING%20DATA

Encounters: Stores patient encounter details including costs, codes, and descriptions.
Organizations: Contains information about healthcare organizations, locations, and addresses.
Patients: Includes patient demographics like gender, race, birthdate, and location.
Procedures: Captures information about medical procedures performed during encounters.
Payers: Contains details about payers and their coverage contributions.



