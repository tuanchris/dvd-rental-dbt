SELECT
    rental_id,
    ARRAY_AGG(p) payments
FROM
{{ source('dvd_rental', 'payment') }} p
GROUP BY
rental_id