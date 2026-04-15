COPY public.user_events
FROM 'C:\Users\ivaik\PycharmProjects\user_events_sql_analysis'
WITH (FORMAT CSV, HEADER, ENCODING 'UTF8');

DROP TABLE IF EXISTS public.user_events;

CREATE TABLE public.user_events (
    event_id        bigint,
    user_id         bigint,
    event_type      varchar(50),
    event_date      timestamp,
    product_id      integer,
    amount          numeric(12,2),
    traffic_source  varchar(20)
);

COPY public.user_events
FROM 'C:\Users\Public\user_events.csv'
WITH (FORMAT CSV, HEADER, ENCODING 'UTF8');

SELECT * FROM user_events

-- define sales funnel and different stages --

WITH funnel_stages AS (
    SELECT
        COUNT(DISTINCT CASE WHEN event_type = 'page_view'   THEN user_id END) AS stage_1_views,
        COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS stage_2_cart,
        COUNT(DISTINCT CASE WHEN event_type = 'checkout_start' THEN user_id END) AS stage_3_checkout,
        COUNT(DISTINCT CASE WHEN event_type = 'payment_info' THEN user_id END) AS stage_4_payment,
        COUNT(DISTINCT CASE WHEN event_type = 'purchase'    THEN user_id END) AS stage_5_purchase
    FROM user_events
    WHERE event_date >= CURRENT_DATE - INTERVAL '120 days'
)
SELECT * FROM funnel_stages;

--- conversion rates through the funnel ---

WITH funnel_stages AS (
    SELECT
        COUNT(DISTINCT CASE WHEN event_type = 'page_view'   THEN user_id END) AS stage_1_views,
        COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS stage_2_cart,
        COUNT(DISTINCT CASE WHEN event_type = 'checkout_start' THEN user_id END) AS stage_3_checkout,
        COUNT(DISTINCT CASE WHEN event_type = 'payment_info' THEN user_id END) AS stage_4_payment,
        COUNT(DISTINCT CASE WHEN event_type = 'purchase'    THEN user_id END) AS stage_5_purchase
    FROM user_events
    WHERE event_date >= CURRENT_DATE - INTERVAL '120 days'
)
SELECT
	stage_1_views,
	stage_2_cart,
	ROUND(stage_2_cart * 100 / stage_1_views) AS views_to_cart_rates,

	stage_3_checkout,
	ROUND(stage_3_checkout * 100 / stage_2_cart) AS cart_to_chekout_rates,

	stage_4_payment,
	ROUND(stage_4_payment * 100 / stage_3_checkout) AS chekout_to_payment_rates,

	stage_5_purchase,
	ROUND(stage_5_purchase * 100 / stage_4_payment) AS payment_to_purchase_rates,

	ROUND(stage_5_purchase * 100 / stage_1_views) AS overall_conversion_rates

FROM funnel_stages;

--- funnel by source ---

WITH source_funnel AS (
	SELECT
	traffic_source,
        COUNT(DISTINCT CASE WHEN event_type = 'page_view'   THEN user_id END) AS views,
        COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS carts,
        COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS purchases

    FROM user_events
    WHERE event_date >= CURRENT_DATE - INTERVAL '120 days'

	GROUP BY traffic_source
)

SELECT
	traffic_source,
	views,
	carts,
	purchases,
	ROUND(carts * 100 / views) AS cart_conversion_rates,
	ROUND(purchases * 100 / views) AS purchase_conversion_rates,
	ROUND(purchases * 100 / carts) AS cart_to_purchase_conversion_rates

FROM source_funnel
ORDER BY purchases DESC

--- time to conversion analysis ---

WITH user_journey AS (
    SELECT
        user_id,
        MIN(CASE WHEN event_type = 'page_view'   THEN event_date END) AS view_time,
        MIN(CASE WHEN event_type = 'add_to_cart' THEN event_date END) AS cart_time,
        MIN(CASE WHEN event_type = 'purchase'    THEN event_date END) AS purchase_time
    FROM user_events
    WHERE event_date >= CURRENT_DATE - INTERVAL '120 days'
    GROUP BY user_id
    HAVING MIN(CASE WHEN event_type = 'purchase' THEN event_date END) IS NOT NULL
)
SELECT
    COUNT(*) AS converted_users,

    ROUND(AVG(EXTRACT(EPOCH FROM (cart_time - view_time)) / 60)::numeric, 2)
        AS avg_view_to_cart_minutes,

    ROUND(AVG(EXTRACT(EPOCH FROM (purchase_time - cart_time)) / 60)::numeric, 2)
        AS avg_cart_to_purchase_minutes,

    ROUND(AVG(EXTRACT(EPOCH FROM (purchase_time - view_time)) / 60)::numeric, 2)
        AS avg_total_journey_minutes

FROM user_journey;

--- revenue funnel analysis ---

WITH funnel_revenue AS (
    SELECT
        COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS total_visitors,
		COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS total_buyers,
		SUM(CASE WHEN event_type = 'purchase' THEN amount END) AS total_revenue,
		COUNT(CASE WHEN event_type = 'purchase' THEN 1 END) AS total_orders

    FROM user_events
    WHERE event_date >= CURRENT_DATE - INTERVAL '120 days'
)

SELECT
	total_visitors,
	total_buyers,
	total_orders,
	total_revenue,
	total_revenue / total_orders AS avg_order_value,
	total_revenue / total_buyers AS revenue_per_buyer,
	total_revenue / total_visitors AS revenue_per_visitor

FROM funnel_revenue




