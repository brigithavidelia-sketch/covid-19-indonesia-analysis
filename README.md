# covid-19-indonesia-analysis

# 📊 Analisis Tren dan Sebaran COVID-19 di Indonesia

Proyek portofolio *Data Analyst* ini menyajikan analisis komprehensif mengenai data *time series* dan sebaran geografis pandemi COVID-19 di Indonesia. Proyek ini mendemonstrasikan kemampuan teknis dalam pengolahan data menggunakan **PostgreSQL**, pembersihan data, penulisan kueri analitis (*SQL Queries*), serta visualisasi interaktif menggunakan **Tableau Public**.

---

## 🛠️ Tech Stack & Tools
* **PostgreSQL (pgAdmin 4):** Manajemen database, pembuatan skema tabel, pembersihan tipe data, dan kueri analitis (*SQL*).
* **Tableau Public:** Pembuatan *dashboard* interaktif, visualisasi tren waktu (*line chart*), dan perbandingan regional (*bar chart*).
* **Excel / CSV:** Pemrosesan awal dan eksekusi data terstruktur.

---

## 📂 Struktur Proyek
```text
📂 covid-19-indonesia-analysis/
│
├── 📂 data/
│   └── covid_19_indonesia_time_series_all.csv  # Dataset mentah & bersih
│
├── 📂 sql/
│   └── queries.sql                             # Kumpulan skrip SQL (DDL & Analysis)
│
├── 📂 dashboard/
│   └── preview_dashboard.png                   # Tangkapan layar hasil visualisasi
│
└── README.md                                   # Dokumentasi proyek

🔍 Tahapan Pengerjaan & Analisis
1. Data Definition & Cleaning (PostgreSQL)
Data mentah diimpor ke dalam database PostgreSQL. Penanganan tipe data dilakukan, seperti mengubah kolom persentase (Case Fatality Rate) yang awalnya berbentuk teks (VARCHAR) menjadi numerik agar dapat dihitung nilai rata-ratanya.

SQL
-- Contoh kueri SQL untuk mencari rata-rata Case Fatality Rate tertinggi per provinsi
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

2. Analisis Utama
Tren Nasional (Time Series): Menganalisis lonjakan kasus baru dari waktu ke waktu untuk mengidentifikasi puncak gelombang pandemi di Indonesia.

Perbandingan Regional: Membandingkan akumulasi total kasus tertinggi di tingkat provinsi, dengan DKI Jakarta dan Jawa Barat menempati posisi tertinggi.

📈 Visualisasi Dashboard (Tableau Public)
Hasil akhir dari pengolahan data dirangkum ke dalam sebuah dashboard interaktif di Tableau Public yang mencakup:

Grafik Tren Waktu (Line Chart): Menampilkan gelombang kenaikan kasus harian secara nasional.

Perbandingan Provinsi (Bar Chart): Menampilkan provinsi dengan total kasus kumulatif terbanyak.

🔗 (https://public.tableau.com/views/COVID-19IndonesiaTimeSeriesGeographicAnalysis/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

💡 Key Insights (Temuan Utama)
Gelombang Puncak: Terdapat dua gelombang lonjakan kasus yang sangat signifikan selama periode pencatatan, yang berkaitan erat dengan periode libur panjang dan masuknya varian baru virus.

Konsentrasi Kasus: Provinsi di pulau Jawa (terutama DKI Jakarta dan Jawa Barat) menyumbang porsi kasus kumulatif terbesar, yang dipengaruhi oleh tingkat kepadatan penduduk yang tinggi serta mobilitas yang masif.

👤 Author
Brigitha

Aspiring Data Analyst | (https://www.linkedin.com/in/brigitha-videlia-492a08405/)
