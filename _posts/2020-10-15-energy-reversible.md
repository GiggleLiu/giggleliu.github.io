---
layout: post
title: Reversible computing or not?
---
# Reversible computing or not?

Reversible computing does not have a lower bound in energy consumption. Surprisingly, it is not always more energy efficient even if the hardware is orders more efficient. In this blog, we show how the energy efficiency suffers from the algorithmic overhead and what is the threshold that reversible computing can be more energy efficient.

Suppose we have a computational process
$$
y=f(x)
$$
It contains $T$ instructions and the output size is $S_y$ times the size of `Int64`.  The computational process costs energy $T E_0$ where $E_0$ is the energy consumption of a single instruction.

It reversible computing form usually requires some garbage space as output too
$$
(y, y_g) = f(x)
$$

where the size of garbage space $y_g$ is $S_{g}$, and the energy consumption is $\alpha T E_r$. $\alpha\geq1$ is the overhead factor of reversible implementation, which is $1$ if $f$ is pure. After the computation, one must free up $y_g$ for future computation, either through

* reverse computing $x = (\sim f)(y, y_g)$, with energy cost $\alpha TE_r$,
* or  deallocate it irreversibly with the irreversible ERASE instruction, with energy costs $S_{g}E_0$.

## The reversible instruction is $10^2\times$ more efficient



## The reversible instruction is $10^5 \times$ more efficient



## Reversible computing for automatic differentiation