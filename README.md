# Cyclistic Bike-Share: Member vs Casual Rider Analysis 2025
 
## Purpose
 
This project is the capstone case study for the **Google Data Analytics Professional Certificate**. It demonstrates data analysis skills across the full data analysis process: Ask, Prepare, Process, Analyze, Share, and Act.

## Business Scenario
 
As a junior data analyst on the marketing team at **Cyclistic** (a fictional Chicago bike-share company), I was tasked with answering the following business question:
 
> **How do annual members and casual riders use Cyclistic bikes differently?**
 
Cyclistic's finance team determined that annual members are significantly more profitable than casual riders. The director of marketing believes converting existing casual riders into members is the key to future growth. This analysis provides the data-backed insights needed to design that marketing strategy.
 
---

## Tools Used
 
| Tool | Purpose |
|---|---|
| **PostgreSQL** | Database storage and SQL querying |
| **TablePlus** | PostgreSQL GUI client |
| **VS Code + SQLTools** | Writing and running SQL scripts |
| **Python (pandas, SQLAlchemy)** | Automated loading of 12 CSV files into PostgreSQL |
| **Tableau Public** | Interactive dashboard and data visualizations |

---

## Data Source
 
- **Provider:** Motivate International Inc. (real Chicago bike-share data, published under public license)
- **Dataset:** Divvy Trips — 12 monthly CSV files covering January–December 2025
- **Total rows:** 5,552,994 trips
- **Columns:** `ride_id`, `rideable_type`, `started_at`, `ended_at`, `start_station_name`, `start_station_id`, `end_station_name`, `end_station_id`, `start_lat`, `start_lng`, `end_lat`, `end_lng`, `member_casual`
- **Note:** Data-privacy restrictions prevent the use of personally identifiable rider information.
- **License:** [Divvy Data License Agreement](https://divvybikes.com/data-license-agreement)
---

## Project File Structure
 
```
cyclistic-project/
│
├── raw_data/                          # Original CSVs — never modified
│   ├── 202501-divvy-tripdata.csv
│   ├── 202502-divvy-tripdata.csv
│   └── ... (12 files total)
│
├── sql/
│   ├── 01_create_table.sql            # Creates the trips table in PostgreSQL
│   ├── 03_clean_data.sql              # Cleans data and creates trips_clean table
│   ├── 04_overall_split.sql           # Member vs casual ride count & percentage
│   ├── 05_avg_ride_length.sql         # Average ride duration by user type
│   ├── 06_rides_by_day.sql            # Ride patterns by day of week
│   ├── 07_rides_by_hour.sql           # Ride patterns by hour of day
│   ├── 08_rides_by_month.sql          # Seasonal ride patterns by month
│   ├── 09_bike_type.sql               # Bike type preference and avg ride length
│   └── 10_top_stations.sql            # Top 10 start stations per user type
│
├── python/
│   └── 02_load_data.py                # Loads all 12 CSVs into PostgreSQL
│
├── tableau_exports/                   # Summary CSVs exported from PostgreSQL
│   ├── summary_by_day.csv
│   ├── summary_by_month.csv
│   ├── summary_by_hour.csv
│   └── summary_by_bike.csv
│
└── tableau/
    └── cyclistic_dashboard.twbx       # Tableau workbook
```
 
---

## Process
 
### 1. Ask
Defined the business task: identify behavioral differences between casual riders and annual members to inform a membership conversion marketing strategy.
 
### 2. Prepare
- Downloaded 12 months of Divvy trip data (Jan–Dec 2025)
- Verified all 12 files had identical column structures and consistent data types
- Confirmed 5,552,994 total rows across all files
### 3. Process
- Created a PostgreSQL database (`cyclistic`) and loaded all 12 CSVs using a Python script (`02_load_data.py`)
- Cleaned data in SQL by removing:
  - Rides with zero or negative duration
  - Rides under 60 seconds ("false starts")
  - Rides over 24 hours (likely unreturned bikes)
- Engineered new columns: `ride_length_mins`, `day_of_week`, `start_hour`, `month`
- Stored cleaned data in a new table: `trips_clean`
### 4. Analyze
Ran 7 SQL analysis queries across 4 dimensions:
 
| Analysis | Key Question |
|---|---|
| Overall split | What share of rides are members vs casuals? |
| Ride length | Who rides longer on average? |
| Day of week | When during the week does each group ride? |
| Hour of day | What time of day does each group ride? |
| Month | How does ridership vary by season? |
| Bike type | What bikes do each group prefer? |
| Top stations | Where do each group start their rides? |
 
### 5. Share
Built a 4-chart Tableau dashboard:
- **Rides by Day of Week** — side-by-side bar chart
- **Rides by Hour of Day** — dual line chart
- **Rides by Month** — dual line chart
- **Avg Ride Length by Bike Type** — grouped bar chart
🔗 **[View Dashboard on Tableau Public](https://public.tableau.com/shared/JN8B8RYJH?:display_count=n&:origin=viz_share_link)**

### 6. Act
Produced three data-backed marketing recommendations (see below).
 
---
 
## Key Findings
 
| Finding | Casual Riders | Annual Members |
|---|---|---|
| Share of total rides | 35.5% (1.9M) | 64.5% (3.5M) |
| Avg ride length | **19.91 mins** | 12.18 mins |
| Busiest day | Saturday | Tuesday–Thursday |
| Ride pattern | Afternoon leisure curve | Double commute spike (8am & 5pm) |
| Winter ridership drop | **14×** (Jan vs Aug) | 4× (Jan vs Aug) |
| Classic bike avg ride | **29.26 mins** | 13.62 mins |
| Top stations | Navy Pier, Millennium Park | Loop business district |
 
**Summary:** 
- Members ride shorter, more frequently, on weekdays, during commute hours, near offices — classic commuter behavior.
- Casuals ride longer, on weekends, in the afternoon, at leisure and tourist destinations — classic recreational behavior.

## Top 3 Recommendations
 
**1. Target casuals at high-traffic leisure stations on weekends**
Casual ridership peaks Saturday–Sunday at stations like Navy Pier, Millennium Park, and Streeter Dr & Grand Ave. Deploy membership promotion campaigns at these specific stations on weekends, when the target audience is most present and most receptive.
 
**2. Launch a seasonal summer membership**
Casual ridership is 14× more sensitive to season than members, with a dramatic peak in June–August. Offering a discounted summer membership (May–September) lowers the commitment barrier for casual riders during the period they already love riding. This serves as a gateway to full annual membership renewal.
 
**3. Run a cost-comparison digital campaign**
Casual riders average nearly 20 minutes per trip, significantly longer than members. A casual rider taking frequent long rides is paying per-ride prices for usage that a membership would cover at much lower cost. A targeted digital ad showing "if you ride X times a month, membership pays for itself" directly addresses the financial case for converting.

---

## Certificate
 
This case study was completed as part of the **Google Data Analytics Professional Certificate** on Coursera.
