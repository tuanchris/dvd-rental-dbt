SELECT
  film_id, array_agg(a) actors
FROM
  {{ source('demo_dvd_rental', 'film_actor') }} fa
LEFT JOIN
  {{ source('demo_dvd_rental', 'actor') }} a
USING
  (actor_id)
GROUP BY
  film_id