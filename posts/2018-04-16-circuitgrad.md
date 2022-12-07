@def title = "Get the gradient of a quantum circuit"

### The landscape of a quantum circuit

This section is a simplified discussion of results in Ref. 5. 

Consider the expectation value of $B$ on state $\vert\psi_N\rangle = U_{N:k+1} U_k(\eta)U_{k-1:1}\vert\psi_0\rangle$ with $U_k(\eta)=e^{-i\Xi\eta/2}$. Given $\Xi^2 =1$, we have $U_k(\eta) = \cos(\frac{\eta}{2})-i\sin(\frac{\eta}{2})\Xi$.

$$
\begin{align*}
\langle B\rangle &= \langle \psi_k| \left[\cos\frac{\eta}{2}+i\sin\frac{\eta}{2}\Xi\right] \tilde{B}_{k+1} \left[\cos\frac{\eta}{2}-i\sin\frac{\eta}{2}\Xi\right]|\psi_k\rangle\\
&= \cos^2\frac{\eta}{2}\langle\psi_k| \tilde{B}_{k+1}|\psi_k\rangle +\sin^2\frac{\eta}{2}\langle\psi_k|\Xi \tilde{B}_{k+1}\Xi|\psi_k\rangle + i\sin\frac{\eta}{2}\cos\frac{\eta}{2}\langle\psi_k|\left[\Xi, \tilde{B}_{k+1}\right]|\psi_k\rangle\\
&=\cos^2\frac{\eta}{2}\left(\langle\psi_k|\tilde{B}_{k+1}-\Xi \tilde{B}_{k+1}\Xi|\psi_k\rangle\right)+ i\frac{\sin\eta}{2}\langle\psi_k|\left[\Xi, \tilde{B}_{k+1}\right]|\psi_k\rangle + \langle\psi_k|\Xi \tilde{B}_{k+1}\Xi|\psi_k\rangle\\
&=\frac{\cos\eta}{2}\left(\langle\psi_k|\tilde{B}_{k+1}-\Xi \tilde{B}_{k+1}\Xi|\psi_k\rangle\right)+ i\frac{\sin\eta}{2}\langle\psi_k|\left[\Xi, \tilde{B}_{k+1}\right]|\psi_k\rangle + \frac{1}{2}\langle\psi_k|\tilde{B}+\Xi \tilde{B}_{k+1}\Xi|\psi_k\rangle\\
&=\alpha\cos\eta+ \beta\sin\eta+\gamma\\
& = r\cos(\eta-\phi)+\gamma
\end{align*}
$$

Here, In line 1, we used the following shorthands

$$
\begin{align*}
&|\psi_{k}\rangle = U_{k:1}|\psi_0\rangle\\
&\tilde{B}_{k+1} = U_{N:k+1}^\dagger B U_{N:k+1}
\end{align*}
$$

And in line 5, we have introduced

$$
\begin{align*}
\alpha &= \frac{1}{2}\left(\langle\psi_k\vert\tilde{B}{k+1}-\Xi \tilde{B}{k+1}\Xi\vert\psi_k\rangle\right),\\
\beta &= i\frac{1}{2}\langle\psi_k\vert\left[\Xi, \tilde{B}{k+1}\right]\vert\psi_k\rangle,\\
\gamma &= \frac{1}{2}\langle\psi_k\vert\tilde{B}+\Xi \tilde{B}{k+1}\Xi\vert\psi_k\rangle.
\end{align*}
$$

Finally, we obtained a sine function.

~~~
<img src="/assets/images/diff_circuit.png" width="400">
~~~

A direct proposition is
$$
\frac{\partial \langle B\rangle_\eta}{\partial \eta} = \frac{1}{2}(\langle B\rangle_{\eta+\frac{\pi}{2}} - \langle B\rangle_{\eta-\frac{\pi}{2}})
$$


### For statistic functional

Next, we describe a new class of differenciable loss which can not be written as an obserable easily, the statistic functionals, for simplicity, we consider an arbitrary statistic functional $f(\mathbf{X})$, with a sequence of bit strings $\mathbf{X}\equiv\{x_1,x_2,\ldots, x_r\}$ as its arguments.
Let's define the following expectation of this function
$$\mathbb{E}_f(\boldsymbol{\Gamma})\equiv\mathop{\mathbb{E}}\limits_{\substack{\{x_i\sim p_{\boldsymbol{\theta}+\boldsymbol{\gamma}_i}\}_{i=1}^{r}}}\left[f(\mathbf{X})\right].$$
Here, $\boldsymbol{\Gamma}=\{\boldsymbol{\gamma}_1, \boldsymbol{\gamma}_2,\ldots,\boldsymbol{\gamma}_r\}$ is the offset angles applied to circuit parameters,
%Its element $\boldsymbol{\gamma}_i$ is defined in the same parameter space as $\boldsymbol{\theta}$ that represents a shift to $\boldsymbol{\theta}$.
which means the probability distributions of generated samples is
$\{p_{\boldsymbol{\theta}+\boldsymbol{\gamma}_1}, p_{\boldsymbol{\theta}+\boldsymbol{\gamma}_2},\ldots ,p_{\boldsymbol{\theta}+\boldsymbol{\gamma}_r}\}$.
Writing out the above expectation explicitly, we have
$$\mathbb{E}_f(\boldsymbol{\Gamma})=\sum\limits_\mathbf{X} f(\mathbf{X})\prod\limits_i p_{\boldsymbol{\theta}+\boldsymbol{\gamma}_i}(x_i),$$
where index $i$ runs from $1$ to $r$. Its partial derivative with respect to $\theta^\alpha_l$ is
$$\frac{\partial \mathbb{E}_f(\boldsymbol{\Gamma})}{\partial \theta^\alpha_l}=\sum\limits_\mathbf{X} f(\mathbf{X})\sum\limits_j\frac{\partial p_{\boldsymbol{\theta}+\boldsymbol{\gamma}_j}(x_j)}{\partial\theta^\alpha_l}\prod\limits_{i\neq j} p_{\boldsymbol{\theta}+\boldsymbol{\gamma}_i}(x_i)$$

Again, using the gradient of probability, we have
$$
\begin{align*}
    \frac{\partial \mathbb{E}_f(\boldsymbol{\Gamma})}{\partial \theta^\alpha_l}&=\frac{1}{2}\sum\limits_{j,s=\pm}\sum\limits_\mathbf{X} f(\mathbf{X}){p_{\boldsymbol{\theta}+\boldsymbol{\gamma}_j+s\frac{\pi}{2}\mathbf{e}_l^\alpha}(x_j)}\prod\limits_{i\neq j} p_{\boldsymbol{\theta}+\boldsymbol{\gamma}_i}(x_i)\\
    &=\frac{1}{2}\sum\limits_{j,s=\pm}\mathbb{E}_f(\{\boldsymbol{\gamma}_i+s\delta_{ij}\frac{\pi}{2}\mathbf{e}_l^\alpha\}_{i=1}^{r})\end
{align*}
$$

If $f$ is symmetric, $\mathbb{E}_f(\mathbf{0})$ becomes a V-statistic [Mises (1947)], then the gradient can be further simplified to
$$
\begin{align}
    \frac{\partial \mathbb{E}_f(\boldsymbol{\Gamma})}{\partial \theta^\alpha_l}=\frac{r}{2}\sum\limits_{s=\pm}\mathbb{E}_f\left(\{\boldsymbol{\gamma}_0+s\frac{\pi}{2}\mathbf{e}_l^\alpha,\boldsymbol{\gamma}_1,\ldots,\boldsymbol{\gamma}_r\}\right),
\end{align}
$$
which contains only two terms. This result can be readily verified by calculating the gradient of MMD loss,
noticing the expectation of a kernel function is a V-statistic of degree $2$.
By repeatedly applying the gradient formula, we will be able to obtain higher order gradients.


### References

1. Jin-Guo Liu and Lei Wang, [arXiv:1804.04168](https://arxiv.org/abs/1804.04168)

2. J. Li, X. Yang, X. Peng, and C.-P. Sun, Phys. Rev. Lett. 118,
  150503 (2017).

3. E. Farhi and H. Neven, arXiv:1802.06002.

4. K. Mitarai, M. Negoro, M. Kitagawa, and K. Fujii,
  arXiv:1803.00745.

5. Nakanishi, Ken M., Keisuke Fujii, and Synge Todo. 

  arXiv:1903.12166 (2019).
