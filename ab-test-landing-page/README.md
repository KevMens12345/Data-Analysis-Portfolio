# A/B Test: Landing Page Redesign (E-news Express)

**Question:** Does a redesigned landing page increase engagement and subscriber conversion?

**Data:** 100 randomly assigned users (50 control / old page, 50 treatment / new page): time on page, conversion, preferred language. → [`data/abtest.csv`](data/abtest.csv)

## Hypothesis tests (α = 0.05)
| Question | Test | p-value | Result |
|---|---|---|---|
| More time on the new page? | Welch t-test (one-sided) | 0.0001 | **Yes**: 6.22 vs 4.53 min |
| Higher conversion on the new page? | Two-proportion z-test (one-sided) | 0.008 | **Yes**: 66% vs 42% |
| Does conversion depend on language? | Chi-square test of independence | 0.21 | No evidence |
| Does time on the new page differ by language? | One-way ANOVA (new page only) | 0.43 | No evidence |

## Recommendation
Roll out the new page: +1.7 minutes on page and +24 percentage points conversion. No language-specific version is needed.

## Limitations
- Small sample (50 per group), one test window, possible novelty effect.
- Time on page is a proxy for engagement.

## Review fixes (2026)
- The original conclusion said the new page was *not* better, which contradicted the test outputs. It is rewritten to match the results.
- Test 1 now uses a one-sided alternative, matching the question.
- Test 4 now uses new-page users only, as the question asks. It previously used all users.

*Course project: Business Statistics (Great Learning PGP-DSBA).*
