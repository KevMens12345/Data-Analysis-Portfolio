# Data Analysis Portfolio — Kevin Selorm Mensah

Projects in data collection, data cleaning, SQL, network analysis, and machine learning.

## ⭐ Featured: Afro House Collaboration Network (dissertation)
Built an artist collaboration network from Spotify API data (5,458 tracks, 4,724 artists). The pipeline covers API collection, relevance filtering, data-quality checks, network centrality, Louvain community detection, and Tableau/Gephi exports. **3,085 artists and 4,848 collaborations; 72% of artists sit in one connected component; Idd Aziz is the top bridge artist.** → [Project](afrohouse-network-analysis/)

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
