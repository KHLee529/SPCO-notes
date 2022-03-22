---
tags: SPCO
breaks: false
---

# Point Estimate

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

#### Bias

接著我們來考慮一些情況，如下圖，

![bias.png]()

### 變異數 (Variance)
