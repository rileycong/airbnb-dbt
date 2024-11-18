SELECT
*
FROM
{{ ref('fct_reviews') }}
JOIN {{ ref('dim_listings_cleansed') }} ON fct_reviews.listing_id = dim_listings_cleansed.listing_id
WHERE
fct_reviews.review_date < dim_listings_cleansed.created_at