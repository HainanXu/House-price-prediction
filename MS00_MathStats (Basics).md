
**Experiment** #experiment
An experiment that every possible outcome can be described.

**Sample Space** #SampleSpace
Collection of all possible outcomes.
ex:
If I toss a coin once, the sample space is $C=\{H,T\}$
If I toss two coins, the sample space is $C=\{HH,HT,TH,TT\}$
If I toss two dice sequentially, I have 36 ordered pairs, the sample space is $C=\{(1,1),(2,1),...,(6,1),(2,1),(2,2),...,(2.6),...,(6,6)\}$.

**Events** #events
subsets of sample space
ex: I toss I coin and get Head. 

**Frequency** #frequency
I perform the same experiment $N$ times, out of which I get $f$ times result A (i.e. $f$ times event A occurs). Then the frequency of event A is $f/N$.

ex: I toss the coin 100 times, I get 54 heads, then the frequency of getting head is 0.54.

**Probability** (not rigorous!) #frequency #probability
As N increases, the frequency of event A stabilizes at a number $p$, we call it the probability of event A. 

**Confidence Interval** #CI #simulation #SignificanceLevel
Suppose we want to know the probability $p$ of event A. We did $n$ simulations. Let $\hat{p}$ be the proportion the simulations where A occurs. 
Then a 95% confidence interval:
$$\hat{p} \pm  1.96 \sqrt\frac{\hat{p}(1-\hat{}p)}{n}$$
With this interval, if we repeat the experiment 100 times, there are 95 times that the true probability of A will be contained in this interval.

**Random Variable** 
Consider the coin tossing example, we have a sample space $C=\{H,T\}$. 
A random variable, $X$, takes the sample space from outcomes (H and T) to real numbers $D=\{0,1\}$, where $D$ is the range of $X$.

More rigorously: 
Consider a random experiment with a sample space $C$. A function $X$, which assigns to each element $c\in C$ one and only on number $X(c)=x$, is called a random variable. 
The space or range of X is the set of real numbers $D=\{x:x=X(c)\}$.

X can be either continuous(IQ scores) or discrete (coin tossing). 

**Distribution** #distribution 
With r.v. $X$ and its range $D$, we can have the probability distribution of $X$.

Suppose $X$ is a discrete r.v. with finite space $D=\{d_1,...,d_m\}$. The events of interest become the subsets of D. For event $d_i$, define the function $p_X(d_i)=P[{c:X(c)=d_i}]$ for $i =1,...m$. We name the function, $p_X(d_i)$, as probability mass function. #pmf

The probability on $D$ is then $P_X(D)=\sum_{d_i\in D}p_X(d_i)$. (=1)

Similarly if X is continuous, suppose $(a,b)\in D$,  $P_X(D)=P[\{c\in C: a<X(c)<b\}]=\int_a^b f_X(x)dx$. The function $f_X(x)$ is the probability density function. #pdf


**Probability Mass Function**  #pmf
Check #distribution.


**Probability Density Function** #pdf
Check #distribution

**Cumulative Distribution Fcuntion** #cdf
$F_X(x)=P_X[(-\infty,x)]=P\{c\in C:X(c)\leq x)\}$

- Discrete example: we roll a fair die, the range of X, D is {1,2,3,4,5,6}. The pmf is $p_X(d_i)=1/6$., then $F_X(x<3)=1/2$. 

- Continuous example: normal distritution.

side note: $P[a<X<b]=F_X(a)-F_x(b)$.

**Expectation of RV** #expectation  #C1
Discrete: If rv X has pmf $p(x)$, $E(X)=\sum_x xp(x)$
Continuous: If rv. X has pdf f(x), $E(X)=\int_{-\infty}^\infty xf(x)dx$

**Variance of RV** #variance 
X be the rv, $\mu =E(X)$be the expectation of X, then 
$Var(X)=E((X-\mu)^2)=E(X^2)-E(X)^2$
