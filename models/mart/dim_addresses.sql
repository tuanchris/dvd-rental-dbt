SELECT
    address_id,
    city_id,
    country_id,
    address,
    address2,
    district,
    city,
    country,
    postal_code,
    phone

FROM
    {{ source('dvd_rental','address') }} A
    LEFT JOIN {{ source('dvd_rental','city') }} ci USING(city_id)
    LEFT JOIN {{ source('dvd_rental','country') }} co USING(country_id)
ORDER BY 1 ASC
