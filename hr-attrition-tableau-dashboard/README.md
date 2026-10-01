# Employee Attrition Dashboard (Tableau)

**Question:** Where is employee attrition concentrated, and how satisfied are the employees who stay?

**Data:** IBM HR Analytics Employee Attrition dataset (1,470 employees, 35 attributes).

**Live dashboard:** [Tableau Public](https://public.tableau.com/app/profile/kevin.mensah3631/viz/HREmployeeAttrition_17589067929460/Dashboard1)  
*Course project: Visualization and Storytelling using Tableau (2025).*

![Dashboard](figures/dashboard.png)

## KPIs
| KPI | Value |
|---|---|
| Employees who left | 237 |
| Attrition rate | **16.12%** |
| Active employees | 1,233 |
| Average age | 37 |

## Calculated fields
```
Attrition Nō         = IF [Attrition1] = "Yes" THEN 1 ELSE 0 END
Attrition Rate       = SUM([Attrition Nō]) / SUM([Number of Records])
Active Employees     = SUM([Number of Records]) - SUM([Attrition Nō])
Income Benchmark     = IF [Monthly Income] >= [Overall Median Income] THEN "Above Median" ELSE "Below Median" END
Total Employee Status= IF [Employee Status]="Active" AND [Attrition1]="No" THEN 1
                       ELSEIF [Employee Status]="Attrition" AND [Attrition1]="Yes" THEN 1 ELSE 0 END
```
- The **`Employee Status` parameter** switches every chart between active and departed employees.
- The **`Age Bin Size` parameter** lets the user resize the age histogram bins.
- **Other derived fields:** tenure groups, age bands, % women, and an engagement score.

## Insights
- **Age:** the workforce peaks at ages 30–38 (213 employees in the 33–35 bin).
- **Job satisfaction:** 63% of active staff rate it 3 or 4. Sales Executives and Research Scientists have the most "4" ratings, but Sales Executives also have the most "1" ratings (53), so that role is the most polarised.
- **Largest active roles:** Sales Executive (269), Research Scientist (245) and Laboratory Technician (197).

![Job satisfaction heatmap](figures/job_satisfaction_heatmap.png)

## Attrition drivers (verified in Python against the source data)
Two metrics are kept separate: **share of departures** (where leavers come from) and **attrition rate** (risk within a group).

| Group | Leavers | Share of departures | Attrition rate |
|---|---|---|---|
| Laboratory Technician | 62 | 26.2% | 23.9% |
| Sales Executive | 57 | 24.1% | 17.5% |
| Research Scientist | 47 | 19.8% | 16.1% |
| Sales Representative | 33 | 13.9% | **39.8%** |

- **Overtime:** 30.5% attrition with overtime vs 10.4% without (about 3×).
- **Job satisfaction:** attrition falls from 22.8% (rating 1) to 11.3% (rating 4).
- **Gender:** female 14.8% (87/588) vs male 17.0% (150/882).
- **Implication:** large roles (Lab Tech, Sales Exec) drive the *volume* of exits; Sales Representatives carry the highest *risk*. Retention actions differ for each.

## Design notes / next iteration
- Replace the 9-slice pie chart with a sorted bar chart, which is easier to compare across roles.
- Add attrition rate by role, overtime and income band (`Income Benchmark`). These are the main attrition drivers in this dataset.
