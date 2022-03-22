---
tags: SPCO
breaks: false
---

# Point Estimate

[![hackmd-github-sync-badge](https://hackmd.io/SVlx6P5gRdii8V_Q7iElww/badge)](https://hackmd.io/SVlx6P5gRdii8V_Q7iElww)

由先前的內容可以知道，統計就是透過對母體資料 (通常是數不清的) 進行抽樣，並使用抽樣結果來推測或估計母體的機率分佈為何。

而判斷機率分佈這個問題就可以分成兩個部分

1. 判斷機率分佈的種類。例如：伯努力機率分佈 (Bernoulli Dist.)、二項機率分佈 (Binomial Dist.)、常態機率分佈 (Normal Dist.) ... 等等。
2. 判斷該機率分佈的參數。例如：伯努力機率分佈的參數 $p$、二項機率分佈當中的 $(n,p)$、常態分佈的 $(\mu, \sigma)$ ... 等等。

而點估計 (Point Estimate) 就是用來判斷這兩件事情的。

## 定義

### Point Estimate

點估計 (Point Estimate) 為針對一個模型中的參數 $\theta$ 透過推理得到的最合理可能的數值。

### Point Estimator

點估計量 (Point Estimator) 為代表點估計的隨機性的==隨機變數==，通常以 $\hat \theta$ 表示。

:::success
- Point Estimate 是估計出來的那個值。
- Point Estimator 是表達 Point Estimate 的隨機性所產星的隨機變數。
:::

## 方法

### 期望值 (Expected Value, Mean)

對於期望值，有很多種估計量的選擇方法，其中最常見的就是樣本平均值 (Sample Mean, Average)，計算方法如下

$$
\bar x = {\sum \limits _ {i = 1} ^ n x_i \over n}
$$

透過這個例子可以理解點估計的隨機性，也就是點估計量存在的原因。

針對同一母體抽樣兩次，一次取 $n$ 個樣本，得到的樣本平均值分別為

$$
\text{1st Sampling: }
\bar x _ \text{1st} = {\sum \limits _ {i = 1} ^ n x _ {\text{1st, }i} \over n} \quad
\text{2nd Sampling: }
\bar x _ \text{2nd} = {\sum \limits _ {i = 1} ^ n x _ {\text{2nd, }i} \over n}
$$

由生活經驗可以知道，兩次抽樣算出來的平均值幾乎不可能相同，所以 $\bar x _ \text{1st} \ne \bar x _ \text{2nd}$。
這就是點估計的隨機性。

由此可以由樣本平均值建立一個隨機變數 (也就是「點估計量」) 為

$$
\text{Assume i.i.d } X_1, X_2, \dots, X_n \Rightarrow \bar X = {\sum \limits _ {i = 1} ^ n X_i \over n}
$$

接著我們來考慮一些情況，如下圖，

![bias.png](https://github.com/KHLee529/SPCO-notes/blob/main/pics/bias.png?raw=true)

可以看到圖中有四組抽樣結果，分別有五個樣本。假設標靶靶心為要被估計的值的實際值，例如：機率分佈的真實期望值。
而靶上的點為各個點各種不同點估計量所估計的結果。可以看出對於一個點估計量，有兩個很重要需要評價的地方

- 偏誤 (Bias)
- 分散程度

其中，如同圖中藍色與紫色的兩種，每一次估計皆落在接近的位置，可以知道其分散程度較低。但是紫色相對於藍色的結果，與靶心的位置有所偏差。此時會將紫色的點估計量視為「有偏誤的 (biased)」。 \
而在圖中藍色與紅色的的兩種比較可以看出，相較於藍色，紅色的結果分散的較開，即分散程度較大，亦可用變異數較大描述此現象。

由上圖不難發現，為了得到精準的估計結果，我們需要找到一個沒有偏誤且分散程度盡量小的點估計量。而首先先針對偏誤進行衡量。

#### Bias

由於點估計量 $\hat \theta$ 為抽樣結果進行統計運算所得，因此可以由理論推得其期望值。\
而當點估計量的期望值與該參數相同時，即認定該點估計量為「沒有偏誤 (unbiased)」，否則 $\hat \theta$ 的期望值與 $\theta$ 的差距即稱為偏誤。意即

$$
\hat \theta \text{ is said unbiased if E} (\hat \theta) = \theta \\
\text{otherwise E} (\hat \theta) - \theta \text{ is called the bias of } \theta
$$

例如，針對一個常態分佈的隨機變數 $X \sim N(\mu, \sigma)$，以平均值估計其期望值。我們可以透過以下方法評估此點估計量的偏誤。

$$
\begin{aligned}
\text{E} (bar X) & = \text{E} \left ( {\sum \limits _ {i = 1} ^ n X_i \over n} \right ) \\
& = {1 \over n} \text{E} \left ( \sum \limits _ {i = 1} ^ n X_i \right ) \\
& = {1 \over n} \times n \text{E} \left ( X_i \right ) \\
& = \text{E} (X) \Rightarrow \text{unbiased}
\end{aligned}
$$

可以看出透過理論推演得到，假設 $X$ 為遵守常態分佈時，以 $\bar X = {\sum \limits _ {i = 1} ^ n X_i \over n}$ 估計 $\text{E} (X)$ 是沒有偏誤的。

而由隨機變數的線性組合當中可以得到

$$
\text{E} (\bar X) = \text{E} (X) = \mu,\quad \text{Var} (\bar X) = {\text{Var} (\bar X) \over n} = {\sigma ^ 2 \over n}
$$

因此可以得到，對於三個樣本數不同的三次取樣所得的平均值 $\bar X_1, \bar X_2, \bar X_3$，取樣大小分別為 $n_1 , n_2 , n_3$ 且 $n_1 > n_2 > n_3$。
可以得到 $\bar X_1, \bar X_2, \bar X_3$ 的機率分佈如下圖所示 (圖中央虛線為 $\mu$)，使用相同的估計方式，在不同的取樣大小下，估計的分散程度便會有所差異。

![normal.png](https://github.com/KHLee529/SPCO-notes/blob/main/pics/normal.png?raw=true)

#### Standard Error

對於一個點估計量，將其標準差定義為標準誤差 (Standard Error)，通常以 $\sigma _ {\hat \theta}$ 表記。

$$
\sigma _ {\hat \theta} = \sqrt {\text{Var} (\hat \theta)}
$$

而對於標準誤差的估計值，即稱為估計標準誤差 (Estimated Standard Error)，通常以 $\hat \sigma _ {\hat \theta}$ 或 $S _ {\hat \theta}$ 表記。

例如：點估計量 $\bar X$ 的標準誤差為

$$
\sigma _ {\bar X} = \sqrt {\text{Var} (\bar X)} = \sqrt {\sigma ^ 2 \over n} = {\sigma \over \sqrt {n}}
$$

又例如：估計伯努力機率分佈的參數 $p$ 點估計量 $\hat p = \bar X = {\sum X \over n}$ 的標準誤差為

$$
\begin{aligned}
\sigma _ {\hat p} & = \sqrt {\text{Var} (\bar X)} = \sqrt {\text{Var} \left ( {\sum X \over n} \right )} \\
& = \sqrt {\text{Var} \left ( \sum X \right ) \over n ^ 2 } \\
\left (\sum X \sim \text{Binomial}(n, p) \right ) & = \sqrt {np(1 - p) \over n ^ 2} = \sqrt {p(1 - p) \over n} \\ \\
\sigma _ {\hat p} & = \sqrt {\hat p (1 - \hat p) \over n} \\
& = \sqrt {{\sum x \over n} (1 - {\sum x \over n}) \over n} \\
& = \sqrt {x (n - x) \over n}
\end{aligned}
$$

### 變異數 (Variance)
