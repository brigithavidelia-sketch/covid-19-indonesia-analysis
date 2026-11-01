-- ==========================================================
-- PROYEK PORTOFOLIO: ANALISIS COVID-19 INDONESIA
-- 
-- 1. Top 5 Provinsi dengan Kasus Kumulatif Tertinggi
-- ==========================================================
SELECT 
    province,
    MAX(total_cases) AS max_total_cases,
    MAX(total_deaths) AS max_total_deaths,
    MAX(total_recovered) AS max_total_recovered,
    MAX(population) AS total_population
FROM covid_indonesia
WHERE location_level = 'Province' AND province IS NOT NULL
GROUP BY province
ORDER BY max_total_cases DESC
LIMIT 5;

-- ==========================================================
-- 2. Analisis Tingkat Kematian (Case Fatality Rate / CFR)
-- ==========================================================
SELECT 
    province,
    ROUND(AVG(CAST(REPLACE(case_fatality_rate, '%', '') AS NUMERIC)), 2) AS avg_case_fatality_rate_percent
FROM covid_indonesia
WHERE location_level = 'Province' 
  AND province IS NOT NULL 
  AND case_fatality_rate IS NOT NULL
GROUP BY province
ORDER BY avg_case_fatality_rate_percent DESC
LIMIT 5;

-- ==========================================================
-- 3. Tren Kasus Bulanan Nasional (Time Series Aggregation)
-- ==========================================================
SELECT 
    TO_CHAR(date, 'YYYY-MM') AS year_month,
    SUM(new_cases) AS total_monthly_new_cases,
    SUM(new_deaths) AS total_monthly_new_deaths,
    SUM(new_recovered) AS total_monthly_new_recovered
FROM covid_indonesia
WHERE location = 'Indonesia'
GROUP BY year_month
ORDER BY year_month ASC;