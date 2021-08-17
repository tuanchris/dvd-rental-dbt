SELECT
    rental_id,
    inventory_id,
    date(rental_date) as rental_date,
    r.customer_id,
    date(return_date) as return_date,
    r.staff_id,
    film_id,
    i.store_id,
    payments

FROM
    {{ source('dvd_rental','rental') }} r
    LEFT JOIN {{ source('dvd_rental','inventory') }} i USING(inventory_id)
    LEFT JOIN {{ ref('stg_payments') }} p USING(rental_id)
