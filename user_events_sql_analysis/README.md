# User Events — Sales Funnel Analysis

SQL analysis of e-commerce user behavior over a 120-day window.
Covers funnel conversion, channel performance, time-to-conversion, and revenue metrics.

## Dataset

File: user_events.csv — 5000+ rows

Columns: event_id, user_id, event_type, event_date, product_id, amount, traffic_source

Funnel stages: page_view → add_to_cart → checkout_start → payment_info → purchase

Traffic sources: organic, paid_ads, email, social

## Analyses

1. Funnel stages — distinct user count at each step
2. Step-by-step and overall conversion rates
3. Funnel breakdown by traffic source
4. Time-to-conversion — avg minutes between steps
5. Revenue metrics — total revenue, AOV, revenue per buyer, revenue per visitor

## Key Results

Overall funnel conversion (view to purchase): ~17%
Highest converting channel: email at 43%
Lowest converting channel: social at 9%
Average total purchase journey: 24.63 minutes
Average order value: ~$115

## Stack

PostgreSQL 17, pgAdmin

## Files

README.md
analysis_results.md
user_events.csv
user_events_queries.sql
screenshots
