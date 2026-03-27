{% set inc_load=1 %}
{% set last_load=3 %}

{% set col_names=['sales_id','date_sk','gross_amount'] %}
SELECT
   {%for i in col_names %}
      {{i}}
      {% if not loop.last %}, {% endif %}  
   {% endfor %}   
FROM
  {{ref("bronze_sales")}}  

WHERE
   {% if inc_load==1 %}
     date_sk > {{last_load}}  
   {% endif %}  