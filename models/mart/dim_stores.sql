SELECT   
    s.store_id,
    manager_staff_id,
    s.address_id AS store_address_id,
    da.address AS store_address,
    da.address2 AS store_address2,
    da.district AS store_district,
    da.city AS store_city,
    da.country AS store_country,
    da.postal_code AS store_postal_code,

    staff_id,
    first_name AS staff_first_name,
    last_name AS staff_last_name,
    sa.address_id AS staff_address_id,
    email AS staff_email,
    active AS staff_active,
    username AS staff_username,
    sa.address AS staff_address,
    sa.district AS staff_district,
    sa.city AS staff_city,
    sa.country AS staff_country,
    sa.phone AS staff_phone

FROM
  {{ source('dvd_rental', 'store') }} s
LEFT JOIN
  {{ ref('dim_addresses') }} da
ON
  da.address_id = s.address_id
LEFT JOIN
  {{ source('dvd_rental', 'staff') }} st
ON
  st.staff_id = s.manager_staff_id
LEFT JOIN
  {{ ref('dim_addresses') }} sa
ON
  sa.address_id = st.address_id