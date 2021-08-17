SELECT
    film_id,
    language_id,
    category_id,
    title as film_title,
    release_year,
    rating,
    category_name,
    language_name,
    rental_duration,
    rental_rate,
    replacement_cost,
    a.actors
FROM
    {{ source('dvd_rental','film') }}
    LEFT JOIN {{ source('dvd_rental','film_category') }} USING (film_id)
    LEFT JOIN {{ source('dvd_rental','category') }} USING (category_id)
    LEFT JOIN {{ source('dvd_rental','film_language') }} USING (language_id)
    LEFT JOIN {{ ref('stg_actors') }} a USING (film_id)
ORDER BY 1 ASC
