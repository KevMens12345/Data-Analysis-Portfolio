# Social Media Engagement Clustering

*Fundamentals of Data Analytics coursework: "User Behaviour Analysis for Optimizing Engagement on Social Media Platforms".*

**Question:** Do a cosmetics brand's Facebook posts fall into distinct engagement segments, and what separates them?

**Data:** Facebook Metrics dataset (Moro, Rita & Vala, 2016): 500 posts, 19 columns. The data is embedded in the notebook.

## Steps
1. **Cleaning:** 6 missing cells (0.06%): `Paid` ×1, `like` ×4, `share` ×1. These were filled with 0, not the median. The evidence: for those posts, `Total Interactions` already equals comments + likes, which only holds if shares = 0. Median imputation would have invented engagement.
2. **EDA:** The data is heavily right-skewed. The top post has 6,334 interactions, about 50× the median of 123.5. By post type, video has the highest mean engagement (296, n=7), then status (217, n=45) and photo (217, n=426); links are lowest (89, n=22).
3. **Preparation:** 9 engagement metrics (reach, impressions, engaged users, likes, shares, comments, etc.). A `log1p` transform reduces the heavy right skew, then `StandardScaler` is applied.
4. **Choosing k:** The elbow method gives k = 3.
5. **Models:** K-Means (k-means++) and Agglomerative clustering with Ward linkage. PCA is used for the 2-D view only: PC1 + PC2 explain 83.3% of the variance, and clustering uses all 9 features.

## Results
| Model | Silhouette |
|---|---|
| K-Means (k = 3) | **0.346** |
| Agglomerative (k = 3) | 0.228 |

K-Means segments (mean lifetime reach):
- **Low engagement** (52 posts): ~2.1k reach
- **Typical** (293 posts): ~5.7k reach
- **Viral** (155 posts): ~33k reach, ~76k impressions

## Model choice
K-Means is recommended. It has the better separation, centroids that are easy to explain to stakeholders, and roughly linear scaling, whereas agglomerative clustering builds an O(n²) merge tree. The agglomerative split is quite different (200 / 227 / 73), so the choice of algorithm matters.

## Limitations
- A silhouette score of 0.35 means the segments overlap moderately.
- Next validation steps: Adjusted Rand Index (agreement between the two models) and the Davies–Bouldin index.
- Clusters describe engagement *levels*. To find out what drives a post into the "viral" group, a next step would be to profile the clusters by post type, hour, and paid status.
