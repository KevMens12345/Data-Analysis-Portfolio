# Mapping the Global Influence Network of Afrohouse Artists and Producers

**MSc Data Analytics dissertation, BSBI / UCA:** *a data-driven analysis of collaboration, centrality and cultural exchange.*

## Research questions
1. What does the global Afrohouse collaboration network look like in structure and density?
2. Which artists, labels or cities act as influence hubs?
3. How does the network show cross-cultural connections between African and European creative communities?
4. How far can network metrics (centrality, modularity, clustering) explain the genre's spread and prominence?
5. How can data visualisation improve understanding of the genre's cultural and geographic dynamics?

## Method (mixed-source, quantitative)
- **Network data:** Spotify Web API, covering playlist discovery, track and artist metadata, and genre-based relevance filtering. Artists credited on the same track are linked, as a weighted, undirected graph built in NetworkX.
- **Metrics:** degree, betweenness and eigenvector centrality, density, connected components, and Louvain communities.
- **Visualisation:** Gephi (network) and Tableau (geographic and relational views).
- **Primary data:** an online audience survey of about 72 listeners, DJs and music professionals, used to put influence and discovery pathways in context.

## Key findings
| Metric (dissertation dataset) | Value |
|---|---|
| Artists / collaborative ties | 2,988 / 4,744 |
| Density | 0.00106 (very sparse) |
| Average / maximum degree | 3.18 / 139 |

| Artist | Degree | Betweenness | Playlist exposure | Structural role |
|---|---|---|---|---|
| Cafe De Anatolia | 139 | 0.115 | 122 | Global hub and broker |
| Black Coffee | 64 | 0.048 | 50 | Scene anchor |
| Idd Aziz | 49 | 0.097 | 33 | Transnational broker |
| Da Capo | 46 | 0.054 | 46 | Regional stabiliser |
| Caiiro | 42 | 0.033 | 54 | Scene-embedded hub |

- **Core–periphery inequality:** a few hubs hold most connections and playlist exposure. Most artists sit on the periphery, a pattern consistent with cumulative advantage.
- **Influence ≠ popularity:** influence comes from network position (repeated collaboration and brokerage) and from playlist curation, not only from follower counts. For example, Idd Aziz ranks as a top bridge despite a relatively small audience.
- **Transnational, two-way exchange:** the genre is anchored in Southern Africa and amplified through European clubs, festivals and platforms. Brokers such as Idd Aziz, Da Capo and HUGEL connect the two regions.
- **Platforms as amplifiers:** curated playlists reinforce existing hierarchies rather than reflecting popularity neutrally.

## Reproducibility note
The notebook pulls **live** Spotify data, so re-running it produces a slightly different network from the dissertation dataset. The January 2026 re-run had 3,085 artists and 4,848 ties, with 72% of artists in the largest component. The structural conclusions (hub concentration, the same broker artists) hold across runs.

## Run
Create a Spotify developer app and enter the Client ID and Secret when prompted. Credentials are read with `getpass` and never stored.
