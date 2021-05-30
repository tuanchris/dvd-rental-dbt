SELECT
    customer_id,
    address_id AS customer_address_id,
    store_id AS customer_store_id,
    first_name AS customer_first_name,
    last_name AS customer_last_name,
    email AS customer_email,
    create_date AS customer_create_date,
    address AS customer_address,
    address2 AS customer_address2,
    district AS customer_district,
    city AS customer_city,
    country AS customer_country,
    postal_code AS customer_postal_code,
    phone AS customer_phone
FROM
    {{ source('dvd_rental','customer') }} C
    LEFT JOIN {{ ref('dim_addresses') }} A USING(address_id)
ORDER BY 1 ASC
