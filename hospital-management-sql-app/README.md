# Hospital Management Analytics App (SQL + Streamlit)

**Goal:** Build an end-to-end analytics app on a relational database: schema, seeded data, SQL KPIs, charts, a PDF report, and a web dashboard.

**Data:** Synthetic data generated with `Faker`. It contains no real patient information.

## Architecture
```
hospital.db (SQLite)
 ├─ patients, doctors, rooms, appointments, admissions, logs
app/
 ├─ db_utils.py          connection + parameterised query helpers
 ├─ query_functions.py   SQL KPIs
 ├─ analytics.py         matplotlib/seaborn charts
 └─ report_generator.py  PDF report (fpdf)
gui/
 ├─ dashboard.py         Streamlit dashboard
 └─ manage_records.py    CRUD forms
```

## SQL KPIs
- Upcoming appointments per doctor (next N days)
- Room occupancy rate
- Average patient stay by room type (`JULIANDAY` date arithmetic)
- Overbooked-doctor detection
- Appointments by specialisation and room usage trends

## Practices
- **Parameterised queries:** No string interpolation, so the queries are safe from SQL injection.
- **Secrets from environment variables:** The ngrok token is read from `NGROK_AUTH_TOKEN`.

## Run
Run the cells in order in Colab. To expose the dashboard, set `NGROK_AUTH_TOKEN` in Colab Secrets.
