# Afro House Artist Collaboration Network

**Question:** Who are the most connected artists in the Afro House scene, which artists bridge different sub-scenes, and what communities exist?

**Data:** Collected with the Spotify Web API (`spotipy`) from 25 Afro House / Afro Tech / Organic House playlists. Playlists with irrelevant titles (workout, sleep, etc.) were filtered out.

## Pipeline
1. **Collection:** Keyword search for playlists, a title noise filter, then all tracks from each playlist (pagination handled): **5,458 tracks, 4,724 artists**.
2. **Relevance filter:** Artist genre tags were matched to Afro House markers. **2,372 artists** are Afro-relevant, leaving **4,396 tracks**.
3. **Edges:** Artists who appear on the same track are linked. The edge weight is the number of shared tracks.
4. **Quality checks:** Checked that every edge ID is in the artist table, that there are no self-loops, and how the edge weights are distributed.
5. **Network analysis (`networkx`):** Weighted degree, betweenness, and eigenvector centrality, plus Louvain community detection.
6. **Export:** Node and edge tables for Tableau and Gephi.

## Results
| Metric | Value |
|---|---|
| Nodes / edges | 3,085 artists / 4,848 collaborations |
| Connected components | 308 |
| Largest component | 2,230 artists (72% of the network) |
| Density | 0.001, so the network is sparse and held together by a few hubs |

- **Most connected artist:** Cafe De Anatolia, with a weighted degree of 220.
- **Top bridge artist:** Idd Aziz has the highest betweenness (0.116). He links communities that would otherwise be separate, even though he has far fewer followers than the hubs.

## Limitations
- The sample is playlist-driven: 25 playlists reflect how curators see the scene, not the full catalogue.
- Genre tags on Spotify are incomplete, so the relevance filter misses some artists.
- An edge means the artists are credited on the same track. It does not mean they collaborated in a studio.

## Run
Create a Spotify developer app and enter the Client ID and Secret when prompted.
