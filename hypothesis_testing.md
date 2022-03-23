---
tags: SPCO
breaks: false
---

# Hypothesis Testing

[![hackmd-github-sync-badge](https://hackmd.io/MRq5ut1ZSi-Nar6ZI6hSnA/badge)](https://hackmd.io/MRq5ut1ZSi-Nar6ZI6hSnA)

透過 Point Estimate 的部分知道了估計模型參數的方法，而接著就是要驗證該估計結果與預期的結果是否相同。
例如，工業系統的加工期望值與設計需求的期望值是否相同、新開發藥物是否確實達到其標榜的功效...等等。

而假設檢定 (Hypothesis Testing) 便是以統計理論進行驗證的方法。

## 信心水準 (Confidence Level) 與信賴區間 (Confidence Interval, C.I.)

要驗證估計結果，首先要考慮估計結果的不確定性帶來估計錯誤的可能性。而信心水準與信賴區間便是討論這個可能性的重要指標。

要定義信心水準與信賴區間，首先從一個常態分佈的期望值估計來看。

對於一個隨機變數 $X \sim \text{Normal}(\mu, \sigma)$，以 $\hat \mu = \bar X = {\sum X_i \over n}$ 估計 $\mu$，其不確定性為

$$
\begin{aligned}
\text{E}(\bar X) & = \text{E} \left ( {\sum _ {i = 1} ^ n X_i \over n} \right ) \\
& = \mu \Rightarrow \text{unbiased} \\
\text{Var}(\bar X) & = \text{Var} \left ( {\sum _ {i = 1} ^ n X_i \over n} \right ) \\ 
& = {\sigma ^ 2 \over n} \Rightarrow \hat \sigma = {\sigma \over \sqrt{n}}
\end{aligned}
$$

故可得知 $\hat \mu = \bar X \sim \text{Normal} (\mu, {\sigma \over \sqrt{n}})。

此時，由於常態分佈皆可透過線性轉換標準化為 $(\mu, \sigma) = (0, 1)$ 的常態分佈，較方便進行查表與比較。
便設定隨機變數 $Z = {\hat \mu - \mu \over \sigma / \sqrt{n}} = {\bar X - \mu \over \sigma / \sqrt{n}}$。
此時，針對這個標準化結果，我們可以給他一個文字描述上的意義：\
「*本次估計到的值與實際期望值的差*為*透過大量取樣減少分散程度後的標準差*的幾倍」。\
其中重點在於==估計到的值與實際的期望值的差==，也就是估計的誤差。

透過常態分佈的機率密度函數可以得到如下圖的結果 -- 「誤差有 $95\%$ 的機率落在 $\pm 1.96$ 倍標準差之間」。

![ci.png](https://github.com/KHLee529/SPCO-notes/blob/main/pics/ci.png?raw=true)

將剛剛的結論以數學方式表達如下

$$
P(-1.96 < {\bar X - \mu \over \sigma / \sqrt{n}} < 1.96) = 0.95
$$

而透過簡單的移項，可以將上式轉換為

$$
P(\bar X - 1.96 {\sigma \over \sqrt {n}} < \mu < \bar X + 1.96 {\sigma \over \sqrt {n}}) = 0.95
$$

而這個式子以文字方式表達的意義為「==真實期望值落在 $\bar X \pm 1.96 {\sigma \over \sqrt{n}}$ 之間的機率為 $$95\%$==」

這個意義，將原本對於平均值的隨機性所建立的機率模型轉換到實際期望值在特定範圍內的信心指數。\
而此時，$95\%$ 這個機率便稱為「信心水準」，而 $\bar X \pm 1.96 {\sigma \over \sqrt{n}}$ 或 
$(\bar X - 1.96 {\sigma \over \sqrt{n}}, \bar X + 1.96 {\sigma \over \sqrt{n}})$ 這個範圍，便稱為「信賴區間」。

由以上的定義，一個信心水準可以對應到一個特定的信賴區間，且若欲使信心水準較大，信賴區間也會較寬。實際上對於數值的選擇端看當時需求而定。

:::info
對一常態分佈隨機變數而言，在 $100(1 - \alpha)\%$ 的信心水準底下，期望值的信賴區間為

$$
\left ( 
\bar x + z _ {\alpha \over 2} {\sigma \over \sqrt{n}}, 
\bar x + z _ {1 - \alpha \over 2} {\sigma \over \sqrt{n}}
\right)
$$
:::

### Large-sample Confidense Interval

由以上的定義可以發現一個小問題，在實際應用上，$\sigma$，也就是真實模型的標準差，通常不是已知的，而也是需要進行估計。\
這使得實際狀況變得更加複雜。但非常慶幸的事情是，當取樣樣本數 $n$ 數量足夠大時，$Z$ 中的標準差可以由樣本標準差進行估計。意即

$$
Z \cong {\bar X - \mu \over S / \sqrt{n}} \, \text{ when } n \text{ is large enough}
$$

由此方式便可更方便的計算實際情況下的信賴區間。

:::info
對一常態分佈隨機變數而言，在 $100(1 - \alpha)\%$ 的信心水準底下，且取樣樣本數 $n$ 足夠大時，期望值的信賴區間為

$$
\left ( 
\bar x + z _ {\alpha \over 2} {S \over \sqrt{n}}, 
\bar x + z _ {1 - \alpha \over 2} {S \over \sqrt{n}}
\right)
$$
:::

## T-statics

待補
