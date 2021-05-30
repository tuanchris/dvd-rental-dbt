SELECT
    rental_id,
    ARRAY_AGG(p) payments
FROM
{{ source('demo_dvd_rental', 'payment') }} p
GROUP BY
rental_id