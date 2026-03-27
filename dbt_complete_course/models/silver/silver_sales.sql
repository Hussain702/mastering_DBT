WITH sales AS (
    SELECT
       sales_id,
       product_sk,
       customer_sk,
       gross_amount,
       unit_price,
       {{ multiply('unit_price','gross_amount') }} AS calculated_price
    FROM
      {{ ref('bronze_sales') }}   
),

product AS (
    SELECT
       product_sk,
       category
    FROM
       {{ ref('bronze_product') }}   
),

customer AS (
    SELECT
      customer_sk,
      gender
    FROM
      {{ ref('bronze_customer') }}  
),

joined_query AS (
    SELECT
      sales.sales_id,
      sales.gross_amount,
      product.category,
      customer.gender
    FROM
       sales
    JOIN product 
       ON sales.product_sk = product.product_sk
    JOIN customer 
       ON sales.customer_sk = customer.customer_sk        
)

SELECT
  category,
  gender,
  SUM(gross_amount) AS total_sales
FROM
   joined_query
GROUP BY
  category,
  gender
ORDER BY
  total_sales DESC