**Weak Law of Large Number** #WLLN `WLLN is about the mean of sample expectations`
Suppose $X_1,...,X_n$ are iid random variables, and $E(X_n)=\mu$ $and $Var(X_n)=\sigma^2$.
then as $n \rightarrow \infty$,
$$\bar{X}_n\rightarrow \mu \text{ in probability.}$$
* note that $\bar{X}_n =1/n\sum_{i=1}^nX_i$

Interpretation of WLLN: The observed sample expectation will gradually be closed to the population expectation as number of sample increases.

ex: coin tossing (related with #CI)
Suppose the experiment is that I toss 1 fair coin each time. $\rightarrow$ Random Variable $X_i$
D={0,1} where 1 denotes H, 0 denotes tail. -> range of X
Let event A=getting Head. 
Then we can start simulations!
If I only did one experiment, and I got 1 out of 1 gives H, then $\bar{X}_1=1$;
If I repeated the same experiment 100 times, I got 52 heads, then $\bar{X}_{100}=0.52$.
If I repeat the same experiment 10000 times , I got 5020 heads, then $\bar{X}_{1000}=0.5020$.
It's getting closer to the true $\mu=0.5!$

**Central Limit Theorem** #CLT `CLT is about the distribution of the sample expectation`
Suppose $X_1,...X_n$ are iid random variables, 
as $n \rightarrow \infty$, 

$$\frac{\bar{X_n}-\mu}{\sigma/\sqrt{n}}\rightarrow N(0,1) \text{ in distribution.}$$
Interpretation of CLT: If we repeat the experiment a lot of times, the distribution of the sample expectation can be approximate to normal. That's the key reason why confidence interval works for hypothesis testing. 

**Dice Rolling Example** #DiceRolling
Let ($X$) be a random variable representing the outcome of rolling a fair six-sided die. 
Even if dice rolling itself is not normally distributed, I can still make inference on its population.

**Possible Values** 
The die has six faces, so the possible values that \( X \) can take are: \[ X \in \{1, 2, 3, 4, 5, 6\} \] **Probability Distribution** 
Since the die is fair, each outcome is equally likely. Therefore, the probability distribution of \( X \) is uniform. The probability of each outcome is: \[ P(X = k) = \frac{1}{6} \text{ for } k \in \{1, 2, 3, 4, 5, 6\} \] 
**Expectation** The expected value $(E[X])$of the random variable $( X )$ can be calculated using the formula: 
$$E[X] = \sum_{x} x \cdot P(X = x)$$
Substituting the probabilities:
$$E[X] = 1 \cdot \frac{1}{6} + 2 \cdot \frac{1}{6} + 3 \cdot \frac{1}{6} + 4 \cdot \frac{1}{6} + 5 \cdot \frac{1}{6} + 6 \cdot \frac{1}{6}$$

$$E[X] = \frac{1 + 2 + 3 + 4 + 5 + 6}{6} = \frac{21}{6} = 3.5$$

**Variance** The variance ($Var(X)$) measures the spread of the outcomes around the mean. It can be calculated as: \[ \text{Var}(X) = E[X^2] - (E[X])^2 \] 
First, find $E[X^2] : \[ E[X^2] = \sum_{x} x^2 \cdot P(X = x)$
 $$E[X^2] = 1^2 \cdot \frac{1}{6} + 2^2 \cdot \frac{1}{6} + 3^2 \cdot \frac{1}{6} + 4^2 \cdot \frac{1}{6} + 5^2 \cdot \frac{1}{6} + 6^2 \cdot \frac{1}{6}$$
$$E[X^2] = \frac{1 + 4 + 9 + 16 + 25 + 36}{6} = \frac{91}{6} \approx 15.17$$
 
Then calculate the variance: 
$$\text{Var}(X) = E[X^2] - (E[X])^2 = \frac{91}{6} - (3.5)^2$$
$$\text{Var}(X) = \frac{91}{6} - 12.25 \approx 2.92$$

