from google.cloud import bigquery

client = bigquery.Client()

query_job = client.query(
    """
    SELECT table_name, ddl
    FROM bigquery-public-data.thelook_ecommerce.INFORMATION_SCHEMA.TABLES
    """
)
result = query_job.result()
for row in result:
    print(row, '\n', "---")