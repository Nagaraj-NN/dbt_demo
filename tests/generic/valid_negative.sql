{% test is_postive(model, column_name) %}

with validation as (

    select
        {{ column_name }} as field

    from {{ model }}

),

validation_errors as (

    select
        field
    from validation
    -- if this is true, then even_field is actually odd!
    where field < 0

)

select *
from validation_errors

{% endtest %}