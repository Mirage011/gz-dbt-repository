# Welcome to my  dbt project!

## My Lineage model 1st finance model and 2nd campaign results model and below you will find my project details :)

1. models/intermediate/int_campaigns
![Screenshot 2024-03-21 at 17 53 46](https://github.com/Mirage011/gz-dbt-repository/assets/155905634/d37bcb3f-daa6-455c-b5eb-afee131fc469)


2. models/mart/Finance/finance_days
![Screenshot 2024-03-21 at 17 54 01](https://github.com/Mirage011/gz-dbt-repository/assets/155905634/c3d6f5a4-4050-4d07-92c7-f422b01c12c6)




# DBT Project Summary

### Project Structure Materialization
To ensure that the finance_days.sql mart model is updated daily and readily available for the finance team, it was decided to materialize it as a table. The materialization configuration was defined within the config block inside the file finance_days.sql.


### Universal Materialization Configuration
Expanding the scope, it was determined that all tables within the mart folder should be materialized as tables. To implement this universal configuration, specific materialization configurations were removed from individual models and consolidated into the config file of the project, dbt_project.yml.

### Project Structure Database Target
Each business team requiring access to mart models should have a dedicated dataset in the warehouse. To organize the models accordingly, a new folder was created within the mart directory corresponding to the business team, such as finance. The finance model was moved into this folder, and the dbt_project.yml file was updated to specify the target dataset for the new folder.


### Summary: Automated Data Pipeline for Financial Reporting

In this project, i developed a comprehensive automated data pipeline for financial reporting, focusing on aggregating and analyzing advertising campaign data from various sources. Below is an overview of the key steps and components of the pipeline:

1. Data Source Integration:

Copied tables from the provided gz_raw_data dataset into my BigQuery project, including data from platforms like AdWords, Bing, Criteo, and Facebook.
Added the source information to the schema.yml file in dbt cloud.
Generated staging models automatically and cleaned them, ensuring consistency in column names and data types across different tables.
Renamed campaign_name correctly and cast ads_cost from string to float64.

2. Creation of Intermediate Campaign Model (int_campaigns.sql):

Aggregated campaign costs from various sources into a single intermediate model using UNION ALL.
Ensured uniformity in column names and data types.
Added tests and descriptions to schema.yml, including primary key tests and tests for other relevant columns.

3. Creation of Daily Aggregated Campaign Model (int_campaigns_day.sql):

Performed transformations on the intermediate campaign model to aggregate data for each day.
Added tests and descriptions to schema.yml for quality assurance.

4. Creation of Finance Campaigns Daily Mart Model (finance_campaigns_day.sql):

Joined the daily aggregated campaign model with finance_days model.
Calculated ads_margin (operational margin - ads cost) as requested by the marketing and finance teams.
Added tests and descriptions to schema.yml for quality assurance.
Checked lineage to ensure data integrity.

5. Creation of Finance Campaigns Monthly Mart Model (finance_campaigns_month.sql):

Aggregated data for each month from the daily mart model.
Added tests and descriptions to schema.yml for quality assurance.
Checked lineage to ensure data integrity.

6. Modification Job for Facebook Raw Data Update:

Defined a new job to update the finance_campaigns_day model specifically for changes in the paid_source column in Facebook raw data.
Ensured the job is lightweight and only reruns necessary models to minimize computation.
Implemented the job to facilitate seamless updates without disrupting the entire workflow.
By completing these steps, we have established an end-to-end automated data pipeline for financial reporting, enabling efficient data processing, analysis, and reporting while maintaining data quality and integrity. This pipeline empowers the finance team to access timely and accurate insights for informed decision-making.




