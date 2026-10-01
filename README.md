# Data Analysis Portfolio — Kevin Selorm Mensah

Projects in data collection, data cleaning, SQL, network analysis, and machine learning.

| Project | Question | Methods | Key result |
|---|---|---|---|
| [Afro House Collaboration Network](afrohouse-network-analysis/) | Who are the hubs and bridges in the Afro House scene? | Spotify API data collection, data quality checks, network centrality, Louvain communities, Tableau export | 3,085 artists, 4,848 links; 72% in one component; Idd Aziz is the top bridge |
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
