{% macro dynamic_partition(column_name, interval) %}
    CASE 
        ELSE 'historical'
    END AS partition_group
{% endmacro %}