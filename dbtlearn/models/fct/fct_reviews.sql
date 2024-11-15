{{
  config(
    materialized = 'incremental',
    on_schema_change = 'fail'
    )
}}

WITH src_reviews AS (
    SELECT * FROM {{ ref("src_reviews") }}
)

SELECT * FROM src_reviews
WHERE review_text IS NOT NULL

-- append records if date is greater than the max date in the table
{% if is_incremental() %}
  and review_date > (select max(review_date) from {{ this }})
{% endif %}