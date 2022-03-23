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

## 期望值 (Expected Value, Mean)

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

### Bias

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

### Standard Error

對於一個點估計量，將其標準差定義為標準誤差 (Standard Error)，通常以 $\sigma _ {\hat \theta}$ 表記。

$$
\sigma _ {\hat \theta} = \sqrt {\text{Var} (\hat \theta)}
$$

而對於標準誤差的估計值，即稱為估計標準誤差 (Estimated Standard Error)，通常以 $\hat \sigma _ {\hat \theta}$ 或 $S _ {\hat \theta}$ 表記。

例如：點估計量 $\bar X$ 的標準誤差為

$$
\sigma _ {\bar X} = \sqrt {\text{Var} (\bar X)} = \sqrt {\sigma ^ 2 \over n} = {\sigma \over \sqrt {n}}
$$

又例如：估計伯努力機率分佈的參數 $p$ 點估計量 $\hat p = \bar X = {\sum \limits _ {i = 1} ^ n X \over n}$ 的標準誤差為

$$
\begin{aligned}
\sigma _ {\hat p} & = \sqrt {\text{Var} (\bar X)} = \sqrt {\text{Var} \left ( {\sum \limits _ {i = 1} ^ n X \over n} \right )} \\
& = \sqrt {\text{Var} \left ( \sum \limits _ {i = 1} ^ n X \right ) \over n ^ 2 } \\
\left (\sum \limits _ {i = 1} ^ n X \sim \text{Binomial}(n, p) \right ) & = \sqrt {np(1 - p) \over n ^ 2} = \sqrt {p(1 - p) \over n} \\ \\
\hat \sigma _ {\hat p} & = \sqrt {\hat p (1 - \hat p) \over n} \\
& = \sqrt {{\sum \limits _ {i = 1} ^ n x \over n} \left (1 - {\sum \limits _ {i = 1} ^ n x \over n} \right ) \over n} \\
& = \sqrt {x (n - x) \over n}
\end{aligned}
$$

### Different Point Estimators of Mean

由於點估計量是透過取樣得到的資料運算後對資料原始模型進行估計，則計算方式就可以有很多種，以下為幾種常用的期望值點估計量。

- $\bar X$: 以抽樣的結果的算術平均數估計期望值。
- $\tilde X$: 以抽樣結果的中位數估計期望值。
- $\bar X _ e$: 以抽樣結果的極端值 (最大值與最小值) 取算數平均數估計期望值。
- $\bar X _ {\text{tr}(m)}$: 將抽樣的結果兩端各去除 $m\%$ 的資料點後取算數平均數估計期望值。\
    (亦有一種版本是總共去除 $m\%$，即兩端各去除 ${m \over 2}\%$)

## 變異數 (Variance)

上面提到了估計變異數通常使用的點估計量 $\bar X$，而變異數是否能夠用取樣變異數進行估計呢？這部分以一個例子推演

例：假設 $X_1, X_2, \dots , X_n$ 為 i.i.d，並且期望值為 $\mu$ 變異數為 $\sigma ^ 2$。

$$
\begin{aligned}
\text{E} \left [ S ^ 2 \right ] & = \text{E} \left [ {1 \over n - 1} \sum \limits _ {i = 1} ^ n (X_i - \bar X) \right ] \\
& = {1 \over n - 1} \text{E} \left [ \sum \limits _ {i = 1} ^ n X_i^2 - \sum \limits _ {i = 1} ^ n 2 X_i \bar X + \sum \limits _ {i = 1} ^ n \bar X ^ 2 \right ] \\
& = {1 \over n - 1} \left \{\sum \limits _ {i = 1} ^ n \text{E} \left [ X_i^2 \right ] - 
\text{E} \left [2n {\sum \limits _ {i = 1} ^ n  X_i \over n} \bar X - \sum \limits _ {i = 1} ^ n \bar X ^ 2 \right ] \right \} \\
& = {1 \over n - 1} \left \{n \text{E} \left [ X_i^2 \right ] - \text{E} \left [2n \bar X ^ 2 - n \bar X ^ 2 \right ] \right \} \\
& = {1 \over n - 1} \left \{n \left [ \sigma ^ 2 + \mu ^ 2 \right ] - n \text{E} \left [ \bar X ^ 2 \right ] \right \} \\
& = {1 \over n - 1} \left \{n \sigma ^ 2 + n \mu ^ 2 - n  \left [ {\sigma ^ 2 \over n} + \mu ^ 2 \right ] \right \} \\
& = {1 \over n - 1} \left [(n - 1) \sigma ^ 2 + n \mu ^ 2 - n \mu ^ 2 \right ] \\
& = \sigma ^ 2 \Rightarrow \text{ unbiased}
\end{aligned}
$$

由此，可以推得取樣變異數為一個沒有偏誤的變異數點估計量。

## Performance

上面有提到，對於同一種參數可以有很多種點估計量，也就是不同的估計方法。而對於各個不同的估計量要怎麼比較其優劣，就是很重要的事情。

從上面可以知道，一個點估計量基本上有兩個很重要的指標，偏誤與分散程度。從之前的標靶圖也可以很簡單的想像到，一個簡單判斷好的估計量的方式就是去找「沒有偏誤且分散程度最低的估計量」，
英文寫作 Minimum Variance Unbiased Estimator (MVUE)，這是個非常直觀的想法。

如下圖的情況，有三個不同的估計值皆沒有偏誤時，勢必選擇 $\hat X_1$ 可以預期得到最精準的估計。

![mvue0.png](https://github.com/KHLee529/SPCO-notes/blob/main/pics/mvue0.png?raw=true)

但，若此時有一另一個有偏誤的點估計量 $\hat X_0$ 的出現，而其機率密度函數如下圖所示。

![mvue1.png](https://github.com/KHLee529/SPCO-notes/blob/main/pics/mvue1.png?raw=true)

這時候由圖示中便很難說 $\hat X_0$ 是個不好的點估計量，甚至它得到的估計值落在 $\theta$ 附近的機率較 $\hat X_1$ 還高。
因此，即便 MVUE 為一個很簡單的判斷準則，但在實際應用上仍要考慮其他可能性後再去做最後的決定。

而上面提到的四個對於期望值的點估計量，分別在不同的機率分佈下有其優劣。

- $\bar X$ 在常態分佈下是最好的選擇。
- $\tilde X$ 對於柯西機率分佈 (Cauchy Distribution，為一個尾端較厚重的鐘型分佈) 較優，由於其尾端出現機率較高，較可能出現嚴重影響平均值的極端值。
- $\bar X_e$ 為均勻分布 (Uniform Distribution) 最好的選擇。
- $\bar X _ {\text{tr}(m)}$ 對於大部分的機率分佈效果都不錯但通常不是最優。

因此，在對於點估計量進行取捨時，可以多方嘗試不同的選擇後再確定較優。

## Often Used Methods for Point Estimator

到此為止，皆是針對常態分佈的參數 (期望值、標準差) 的點估計量，而對於其他各種不同的機率分佈模型參數，亦有許多相對應的方法。
而因此，對於任意一個模型皆可以求出一個合理的點估計量變成為一個重要的課題。
而求這些不同的點估計量的方法千百種，以下將會介紹最基本也最常用的兩種

- Moment Estimator
- Maximum Likelihood Estimator (MLE)

### 動差估計 (Moment Estimator)

在講解動差估計之前，先定義動差 (Moment)。

對於一個機率模型而言，$n$ 次動差即為 $X^n$ 的期望值，意即

$$
\begin{aligned}
& \text{1st Moment: E} (X)  \\
& \text{2nd Moment: E} (X^2)  \\
& \vdots \\
& n\text{th Moment: E} (X^n) 
\end{aligned}
$$

而動差估計，便是利用模型的 $m$ 個參數與 1 到 $m$ 次動差之間的關係，求出所有動差的估計值後再反推參數的方法。

例如，在伽瑪機率分佈 (Gamma Distribution) 當中，期望值、變異數與參數 $\alpha, \beta$ 間的關係為

$$
\text{E} (X) = \alpha \beta \, , \quad 
\text{Var} (X) = \text{E} (X^2) - \text{E}^2 (X) = \alpha \beta ^ 2
$$

因此，由這兩個關係反推參數分別為

$$
\hat \beta = {\hat \sigma ^ 2 \over \widehat {\text{E} (X)}} = {S^2 \over \bar X} \, , \quad
\hat \alpha = {\widehat {\text{E}^2 (X)} \over \hat \sigma ^ 2} = {\bar X^2 \over S ^ 2}
$$

這個方法就是這麼直接，把原本的關係反過來用來估計就對了。

### 最大相似性估計 (Maximum Likelihood Estimator)

這個做法是假設每一次抽樣為 i.i.d，因此抽樣得到結果 $X_1, X_2, \dots, X_n$ 的機率 (或概度 Likelihood) 為

$$
P(X_1 = x_1, X_2 = x_2, \dots, X_n = x_n) = P(X_1 = x_1)P(X_2 = x_2) \cdots P(X_n = x_n) \text{ for discrete}\\
\text{or} \\
f(X_1 = x_1, X_2 = x_2, \dots, X_n = x_n) = f(X_1 = x_1)f(X_2 = x_2) \cdots f(X_n = x_n) \text{ for continous}
$$

而在判斷模型參數時，假設抽樣出來的結果為發生可能性最高的那個，如下圖

![mle.png](https://github.com/KHLee529/SPCO-notes/blob/main/pics/mle.png?raw=true)

對於三個不同的 $\mu$ 的常態分佈而言，抽出該次抽樣結果的機率分別為黑色高度相乘。
可以明顯看出，最上方的圖中各個點抽樣出來的機率 (黑色長條) 乘積較其他兩者大，故選擇第一個點估計量。

而具體的計算方法如以下範例。

例如，以 MLE 求指數機率分佈的參數 $\lambda$ 的點估計量。
由於要求概度的最大值，便將該函數進行微分後取微分等於 0 的位置。

$$
\begin{aligned}
& {d \over d \lambda} \text{likelihood} (\lambda = \hat \lambda ) = 0 \Rightarrow {d \over d \lambda} \left ( \prod \limits _{i = 1} ^ n \lambda e ^ {- \lambda x_i} \right ) = 0 \\
& \Rightarrow {d \over d \lambda} \left ( \lambda ^ n \prod \limits _{i = 1} ^ n \left (e ^ {- \lambda} \right ) ^ {x_i} \right ) = 0 \\
& \Rightarrow {d \over d \lambda} \left ( \lambda ^ n \cdot \left (e ^ {- \lambda} \right ) ^ {\sum \limits _{i = 1} ^ n x_i} \right ) = 0 \\
& \Rightarrow \left ( n \lambda ^ {n - 1} \cdot \left (e ^ {- \lambda} \right ) ^ {\sum \limits _{i = 1} ^ n x_i} +
\lambda ^ n \cdot \left ( {\sum \limits _{i = 1} ^ n x_i} \right ) \underbrace {\left (e ^ {- \lambda} \right ) ^ {\sum \limits _{i = 1} ^ n x_i - 1} \cdot 
\left (- e ^ {- \lambda} \right )} _ {- \left (e ^ {- \lambda} \right ) ^ {\sum \limits _{i = 1} ^ n x_i}}\right ) = 0 \\
& \Rightarrow {1 \over \hat \lambda} = {\sum \limits _{i = 1} ^ n x_i \over n} = \bar X \Rightarrow \boxed{ \hat \lambda = {1 \over \bar X}}
\end{aligned}
$$


