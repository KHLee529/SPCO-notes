---
tags: SPCO
breaks: false
---

# Hypothesis Testing

[![hackmd-github-sync-badge](https://hackmd.io/MRq5ut1ZSi-Nar6ZI6hSnA/badge)](https://hackmd.io/MRq5ut1ZSi-Nar6ZI6hSnA)

透過 Point Estimate 的部分知道了估計模型參數的方法，而接著就是要驗證該估計結果與預期的結果是否相同。
例如，工業系統的加工期望值與設計需求的期望值是否相同、新開發藥物是否確實達到其標榜的功效...等等。

而假說檢定 (Hypothesis Testing) 便是以統計理論進行驗證的方法。

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
「*本次估計到的值與實際期望值的差* 為 *透過大量取樣減少分散程度後的標準差* 的幾倍」。\
其中重點在於==估計到的值與實際的期望值的差==，也就是估計的誤差。

透過常態分佈的機率密度函數可以得到如下圖的結果：\
「誤差有 $95\%$ 的機率落在 $\pm 1.96$ 倍標準差之間」。

![ci.png](https://github.com/KHLee529/SPCO-notes/blob/main/pics/ci.png?raw=true)

將剛剛的結論以數學方式表達如下

$$
P(-1.96 < {\bar X - \mu \over \sigma / \sqrt{n}} < 1.96) = 0.95
$$

而透過簡單的移項，可以將上式轉換為

$$
P(\bar X - 1.96 {\sigma \over \sqrt {n}} < \mu < \bar X + 1.96 {\sigma \over \sqrt {n}}) = 0.95
$$

而這個式子以文字方式表達的意義為「==真實期望值落在 $\bar X \pm 1.96 {\sigma \over \sqrt{n}}$ 之間的機率為 $95\%$==」

這個意義，將原本對於平均值的隨機性所建立的機率模型轉換到實際期望值在特定範圍內的信心指數。\
而此時，$95\%$ 這個機率便稱為「信心水準」，而 $\bar X \pm 1.96 {\sigma \over \sqrt{n}}$ 或 
$(\bar X - 1.96 {\sigma \over \sqrt{n}}, \bar X + 1.96 {\sigma \over \sqrt{n}})$ 這個範圍，便稱為「信賴區間」。

由以上的定義，一個信心水準可以對應到一個特定的信賴區間，且若欲使信心水準較大，信賴區間也會較寬。實際上對於數值的選擇端看當時需求而定。

:::info
對一常態分佈隨機變數而言，在 $100(1 - \alpha)\%$ 的信心水準底下，期望值的信賴區間為

$$
\left ( 
\bar x + f _ {\text{Normal} (0, 1)} ({\alpha \over 2}) {\sigma \over \sqrt{n}}, 
\bar x + f _ {\text{Normal} (0, 1)} ({1 - {\alpha \over 2}}) {\sigma \over \sqrt{n}}
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
\bar x + f _ {\text{Normal} (0, 1)} ({\alpha \over 2}) {S \over \sqrt{n}}, 
\bar x + f _ {\text{Normal} (0, 1)} ({1 - {\alpha \over 2}}) {S \over \sqrt{n}}
\right)
$$
:::

## T 機率分佈 (T-Distribution)

上面提到在真實情況下，一個模型的表標準差不是已知的，因此標準化時會出現必須使用樣本標準差進行估計的情形。在 $n$ 足夠大時可以視為兩者極接近。\
而這個時候，統計學家 [Student](https://en.wikipedia.org/wiki/William_Sealy_Gosset) 推導出了驚為天人的結果。

「對一個符合常態分佈的隨機變數 $X \sim \text{Normal} (\mu, \sigma)$，其抽樣 $n$ 個樣本結果所產生的隨機變數 $T = {\bar X - \mu \over S / \sqrt{n}}$ 所遵守的機率模型：T-Distribution」

這個 $T$ 最厲害的地方就是他同時將 $\bar X$ 與 $S$ 所產生的隨機性考量進去後求出來的機率模型。T 機率分佈的機率密度函數如下

$$
f _ {X \sim \text{T}(\nu)} (X = x) = {\Gamma \left ( {\nu + 1 \over 2} \right ) \over \sqrt{\nu \pi} \Gamma \left ( {\nu + 1 \over 2} \right )} 
{1 \over \left ({1 + x^2 \over \nu} \right ) ^ {\nu + 1 \over 2}}
$$

其中 $\nu$ 這個參數為 $T$ 的自由度 $n - 1$。其機率密度函數如下圖。

![tdist.png](https://github.com/KHLee529/SPCO-notes/blob/main/pics/tdist.png?raw=true)

由上圖可以看出 T 機率分佈與標準常態分佈相似，皆為鐘形且中央位於 $x=0$。但相較於常態分佈，其尾端較厚，而這也可以應證前述的取樣數量多寡所產生的分散程度不確定性的影響。
而由上圖也可以看出，當 $\nu$ 漸大時，其圖形越接近常態分佈，$\nu \to \infty \Rightarrow t _ \nu \to \text{Normal} (0, 1)$。

將此一機率分佈應用回前方信賴區間的結果，可以得到

:::info
對一常態分佈隨機變數而言，在 $100(1 - \alpha)\%$ 的信心水準底下，抽樣樣本數為 $n$ 時，期望值的信賴區間為

$$
\left ( 
\bar x + f _ {T(\nu = n - 1)} ({\alpha \over 2}) {S \over \sqrt{n}}, 
\bar x + f _ {T(\nu = n - 1)} ({1 - {\alpha \over 2}}) {S \over \sqrt{n}}
\right)
$$
:::

## 假說檢定 (Hypothesis Testing)

假說檢定是指，對於一個特定主張，證明該主張正確的檢定方法，通常使用以下的流程

1. 確定目標假說 (Target hypothesis, Alternative hypothesis，通常以 $H_0$ 表記。即欲證明正確的主張)
2. 提出虛無假說 (Null hypothesis，通常以 $H_1$ 表記。即欲證明的主張不正確時的結果，也可以視為一般正常現象)
3. 提出證據推翻虛無假說。

例如，法院要判決一人有罪，流程對應的行為如下

1. 確定目標假說: 目標假說為「被告有罪」
2. 提出虛無假說: 虛無假說為「被告無罪」(即[無罪推定原則](https://zh.wikipedia.org/wiki/%E6%97%A0%E7%BD%AA%E6%8E%A8%E5%AE%9A%E5%8E%9F%E5%88%99))
3. 推翻虛無假說: 檢察官調查證據後向法官提出推翻無罪推定原則，證明被告有罪。

又例如，藥品管制機關要判定一款減肥藥有效果，流程對應行為如下

1. 確定目標假說: 目標假設為「吃該減肥藥有減肥效果」
2. 提出虛無假說: 虛無假說為「吃該減肥藥並沒有減肥效果」
3. 推翻虛無假說: 統計服用該減肥藥的受試者體重是否有變化，若有變化則可以推翻虛無假說。

此時，對於*體重是否真的有變化*，便可以以統計方法進行。

### 錯誤檢定

由於假說檢定是一個認定主張是否正確的過程，因此對於該主張是否正確與是否被認定為正確的情況便有以下幾種組合

||主張實際不正確 ($H_0$ is True)|主張實際正確 ($H_0$ is false)|
|:-:|:-:|:-:|
|主張認定不正確 ($H_0$ 沒被推翻)| 檢定正確 | 第二型錯誤 (Type II Error, $\beta$) |
|主張認定正確 ($H_0$ 被推翻)| 第一型錯誤 (Type I Error, $\alpha$) | 檢定正確 |

在通常的檢定當中，會希望 $\alpha$ 錯誤越低越好，如：被告被誤判有罪、藥物無效卻成功上市。而 $\beta$ 便看各檢定機關自行認定。

## 常用檢測

### 期望值

通常對於期望值的檢定，皆是希望證明努力是有效果，故目標假說通常是期望值不等於常見正常情況時的期望值 $\mu_0$。
例如前述減肥藥的例子當中，便是要驗證服藥後的體重小於原本的體重。\
因此對於期望值檢定，常用的 $H_0$ 會是 $\mu = \mu_0$ 而 $H_1$ 可能是 $\mu > \mu_0$、$\mu < \mu_0$ 或 $\mu \ne \mu_0$。

前面提到的 T 分佈就派上用場了。隨機變數 $T = {\bar X - \mu \over S / \sqrt{n}} 代表的意義是估計的期望值與實際的期望值的差異與摽準差的比例關係。
此時若把符號改變一下，改成 $T = {\mu - \mu_0 \over S / \sqrt{n}}$ 時，這個分佈的意義就可以被認定成，\
「在正常情況下 (期望值為 $\mu_0$) 抽樣得到平均值為 $\mu$ 的機率」\
在這個定義下，就衍生出了一個想法，假如抽樣得到的平均值 $\mu$ 在正常情況底下出現的機率極低的時候，就認定該主張有造成期望值的差異。(例如：減肥藥有效) \
此時再將出現機率很小的機率量化為 $\alpha$，便可以將描述改變成，在 $1 - \alpha$ 的信心水準底下，該主張有效，推翻虛無假說。

這時後，實際上應用的方式就根據 $H_1$ 有所差別了。以下的表格簡單代表了三個不同的 $H_1$ 中信心水準 $\alpha$ 的情況下要推翻虛無假說時 $t$ 的允許範圍。

| $H_1$ | Range |
| :-: | :-: |
| $\mu < \mu_0$ | ![t-test-less.png](https://github.com/KHLee529/SPCO-notes/blob/main/pics/t-test-less.png?raw=true)|
| $\mu > \mu_0$ | ![t-test-great.png](https://github.com/KHLee529/SPCO-notes/blob/main/pics/t-test-great.png?raw=true)|
| $\mu \ne \mu_0$ | ![t-test-ne.png](https://github.com/KHLee529/SPCO-notes/blob/main/pics/t-test-ne.png?raw=true)|

| $H_1$ | $\mu < \mu_0$   | $\mu > \mu_0$   | $\mu \ne \mu_0$ |
| :-: | :-: |
| Range | ![t-test-less.png](https://github.com/KHLee529/SPCO-notes/blob/main/pics/t-test-less.png?raw=true)| ![t-test-great.png](https://github.com/KHLee529/SPCO-notes/blob/main/pics/t-test-great.png?raw=true)| ![t-test-ne.png](https://github.com/KHLee529/SPCO-notes/blob/main/pics/t-test-ne.png?raw=true)| 












