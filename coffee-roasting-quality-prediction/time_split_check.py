"""Check for time-order leakage: random split vs time-ordered split."""
import numpy as np
import pandas as pd
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import mean_absolute_error, r2_score
from sklearn.model_selection import train_test_split

df = pd.read_csv("data/kc_roasters.csv").dropna()
X, y = df.drop(columns="quality"), df["quality"]

print(f"Lag-1 autocorrelation of quality: {y.autocorr(1):.2f} "
      f"(shuffled: {y.sample(frac=1, random_state=0).autocorr(1):.2f})")

def fit_score(X_tr, X_te, y_tr, y_te):
    m = RandomForestRegressor(n_estimators=100, random_state=42, n_jobs=-1).fit(X_tr, y_tr)
    p = m.predict(X_te)
    return r2_score(y_te, p), mean_absolute_error(y_te, p)

r2, mae = fit_score(*train_test_split(X, y, test_size=0.2, random_state=42))
print(f"Random split       R2 {r2:.2f}  MAE {mae:.1f}")

cut = int(len(df) * 0.8)
r2, mae = fit_score(X.iloc[:cut], X.iloc[cut:], y.iloc[:cut], y.iloc[cut:])
base = mean_absolute_error(y.iloc[cut:], np.full(len(y) - cut, y.iloc[:cut].mean()))
print(f"Time-ordered split R2 {r2:.2f}  MAE {mae:.1f}  (predict-the-mean MAE {base:.1f})")
