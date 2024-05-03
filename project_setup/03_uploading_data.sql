/* We will be uploading all the data form our csv files into the table now.
VS code sometimes gives error so i went ahead and uploaded it from native mac terminal.
You should be able to see upload count for each table:
1) company_dim - count 140033
2) skills_dim - count 259
3) job_postings_fact - count 787686
4) skills_job_dim - count 3669604
Bellow is the summary of the codes
*/

\copy company_dim 
from '/Documents/sql_project_data_analyst/csv_files/company_dim.csv' 
with (format csv, header true, delimiter ',', encoding 'UTF8');

\copy skills_dim 
from '/Documents/sql_project_data_analyst/csv_files/skills_dim.csv' 
with (format csv, header true, delimiter ',', encoding 'UTF8');

\copy job_postings_fact 
from '/Documents/sql_project_data_analyst/csv_files/job_postings_fact.csv' 
with (format csv, header true, delimiter ',', encoding 'UTF8');

\copy skills_job_dim 
from '/Documents/sql_project_data_analyst/csv_files/skills_job_dim.csv' 
with (format csv, header true, delimiter ',', encoding 'UTF8');