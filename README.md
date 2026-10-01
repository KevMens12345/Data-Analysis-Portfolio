# Data Analysis Portfolio — Kevin Selorm Mensah

Projects in data collection, data cleaning, SQL, network analysis, and machine learning.

## ⭐ Featured: Afrohouse Global Influence Network (MSc dissertation)
A mixed-methods study using Spotify API data, network analysis (NetworkX, Gephi, Tableau) and a 72-respondent survey. The network has **2,988 artists and 4,744 ties**, with a strong core–periphery structure. Influence comes from **network position and playlist curation, not popularity alone**. Southern Africa and Europe exchange in both directions through broker artists. → [Project](afrohouse-network-analysis/)

## Other projects
| Project | Question | Methods | Key result |
|---|---|---|---|
| [African CO₂ Emissions](africa-co2-emissions/) | How have African emissions changed, and how reliable is the data? | Source register, data dictionary, ISO3 reconciliation, QC flags, change log, country profiles | 613→1,392 Mt (1990–2019); 62% from 3 countries; Côte d'Ivoire gap and Mali anomalies flagged |
| [Hospital Management SQL App](hospital-management-sql-app/) | How can hospital operations KPIs be served from a relational database? | SQLite schema, parameterised SQL, Streamlit dashboard, PDF reporting | 6-table database, 5 SQL KPIs, interactive dashboard |
| [Social Media Engagement Clustering](social-media-engagement-clustering/) | Which engagement segments exist in a brand's Facebook posts? | Log transform, scaling, elbow method, K-Means vs. hierarchical, PCA | 3 segments; K-Means silhouette 0.346 vs. 0.228 for hierarchical |
| [Mushroom Classification](mushroom-classification/) | Can physical traits predict if a mushroom is poisonous? | EDA, label encoding, 7 classifiers compared | Tree models reach 100% test accuracy; odor alone almost separates the classes |

## Run
Open any notebook in Google Colab or Jupyter. Install the dependencies with:
```bash
pip install -r requirements.txt
```

## Tools
Python (pandas, NumPy, scikit-learn, networkx, matplotlib, seaborn, Streamlit) · SQL (SQLite) · APIs · R · Tableau

## Contact
s.kevmens@gmail.com
