# Social Media Engagement Clustering

**Question:** Do a cosmetics brand's Facebook posts fall into distinct engagement segments, and what separates them?

**Data:** Facebook Metrics dataset (Moro, Rita & Vala, 2016): 500 posts, 19 columns. The data is embedded in the notebook.

## Steps
1. **Cleaning:** Missing `Paid`, `like`, and `share` values were filled with 0.
2. **EDA:** Descriptive statistics, an outlier boxplot, and engagement by post type.
3. **Preparation:** 9 engagement metrics (reach, impressions, engaged users, likes, shares, comments, etc.). A `log1p` transform reduces the heavy right skew, then `StandardScaler` is applied.
4. **Choosing k:** The elbow method gives k = 3.
5. **Models:** K-Means and Agglomerative clustering. PCA gives a 2-D view.

## Results
| Model | Silhouette |
|---|---|
| K-Means (k = 3) | **0.346** |
| Agglomerative (k = 3) | 0.228 |

K-Means segments (mean lifetime reach):
- **Low engagement** (52 posts): ~2.1k reach
- **Typical** (293 posts): ~5.7k reach
- **Viral** (155 posts): ~33k reach, ~76k impressions

## Limitations
- A silhouette score of 0.35 means the segments overlap moderately.
- Clusters describe engagement *levels*. To find out what drives a post into the "viral" group, a next step would be to profile the clusters by post type, hour, and paid status.
