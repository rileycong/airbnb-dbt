{% macro no_nulls_in_columns(model) %}
    SELECT * FROM {{ model }} WHERE
    {% for col in adapter.get_columns_in_relation(model) -%} --adapter is snowflake=1.7.1
        {{ col.column }} IS NULL OR
    {% endfor %}
    FALSE
{% endmacro %}