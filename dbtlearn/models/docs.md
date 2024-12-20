{% docs dim_listing_cleansed__minimum_nights %}
Minimum number of nights required to rent this property.

Keep in mind that old listings might have `minimum_nights` set
to 0 in the source tables. Our cleansing algorithm updates this to `1`.

{% enddocs %}

{% docs dim_hosts_cleansed__reviewer_name %}
The name of the client leaving the review.

Keep in mind that old listings might have null `reviewer_name` in the source tables. Our cleansing algorithm updates this to `anonymous`.

{% enddocs %}

{% docs dim_listings_w_host__price %}
The price of the listing.

We have several tests to make sure that the 99% quantile of price is between 50 and 500; and that the maximum possible listing's price is 5000 to check outliers.

{% enddocs %}
