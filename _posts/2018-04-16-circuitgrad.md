---
....layout: post
title: Get the gradient of a quantum circuit
---
{%raw%}
$$
\newcommand{\dataset}{{\mathcal{D}}}
\newcommand{\wfunc}{{\psi}}
\newcommand{\thetav}{{\boldsymbol{\theta}}}
\newcommand{\gammav}{{\boldsymbol{\gamma}}}
\newcommand{\thetai}{{\theta^\alpha_l}}
\newcommand{\Expect}{{\mathbb{E}}}
\newcommand{\etc}{{\it etc~}}
\newcommand{\etal}{{\it etal~}}
\newcommand{\xset}{\mathbf{X}}
\newcommand{\gammaset}{\boldsymbol{\Gamma}}
\newcommand{\ei}{\mathbf{e}_l^\alpha}
\newcommand{\sigmag}{{\nu}}
\newcommand{\BAS}{Bars-and-Stripes}
\newcommand{\qexpect}[1]{{\left\langle #1\right\rangle}}
\newcommand{\expect}[2]{{\mathop{\mathbb{E}}\limits_{\substack{#2}}\left[#1\right]}}
\newcommand{\pshift}[1]{{p_{\thetav+#1}}}
$$
{%endraw%}

### The landscape of a quantum circuit

This section is a simplified discussion of results in Ref. 5. 

Consider the expectation value of $B$ on state <span>$\vert\psi_N\rangle = U_{N:k+1} U_k(\eta)U_{k-1:1}\vert\psi_0\rangle$</span> with $U_k(\eta)=e^{-i\Xi\eta/2}$. Given $\Xi^2 =1$, we have $U_k(\eta) = \cos(\frac{\eta}{2})-i\sin(\frac{\eta}{2})\Xi$.
$$
\begin{align}
\langle B\rangle &= \langle \psi_k| \left[\cos\frac{\eta}{2}+i\sin\frac{\eta}{2}\Xi\right] \tilde{B}_{k+1} \left[\cos\frac{\eta}{2}-i\sin\frac{\eta}{2}\Xi\right]|\psi_k\rangle\\
&= \cos^2\frac{\eta}{2}\langle\psi_k| \tilde{B}_{k+1}|\psi_k\rangle +\sin^2\frac{\eta}{2}\langle\psi_k|\Xi \tilde{B}_{k+1}\Xi|\psi_k\rangle + i\sin\frac{\eta}{2}\cos\frac{\eta}{2}\langle\psi_k|\left[\Xi, \tilde{B}_{k+1}\right]|\psi_k\rangle\\
&=\cos^2\frac{\eta}{2}\left(\langle\psi_k|\tilde{B}_{k+1}-\Xi \tilde{B}_{k+1}\Xi|\psi_k\rangle\right)+ i\frac{\sin\eta}{2}\langle\psi_k|\left[\Xi, \tilde{B}_{k+1}\right]|\psi_k\rangle + \langle\psi_k|\Xi \tilde{B}_{k+1}\Xi|\psi_k\rangle\\
&=\frac{\cos\eta}{2}\left(\langle\psi_k|\tilde{B}_{k+1}-\Xi \tilde{B}_{k+1}\Xi|\psi_k\rangle\right)+ i\frac{\sin\eta}{2}\langle\psi_k|\left[\Xi, \tilde{B}_{k+1}\right]|\psi_k\rangle + \frac{1}{2}\langle\psi_k|\tilde{B}+\Xi \tilde{B}_{k+1}\Xi|\psi_k\rangle\\
&=\alpha\cos\eta+ \beta\sin\eta+\gamma\\
& = r\cos(\eta-\phi)+\gamma
\end{align}
$$
Here, In line 1, we used the following shorthands
$$
\begin{align}
&|\psi_{k}\rangle = U_{k:1}|\psi_0\rangle\\
&\tilde{B}_{k+1} = U_{N:k+1}^\dagger B U_{N:k+1}
\end{align}
$$
And in line 5, we have introduced
$$
\begin{align}
\alpha &= \frac{1}{2}\left(\langle\psi_k\vert\tilde{B}{k+1}-\Xi \tilde{B}{k+1}\Xi\vert\psi_k\rangle\right),\\
\beta &= i\frac{1}{2}\langle\psi_k\vert\left[\Xi, \tilde{B}{k+1}\right]\vert\psi_k\rangle,\\
\gamma &= \frac{1}{2}\langle\psi_k\vert\tilde{B}+\Xi \tilde{B}{k+1}\Xi\vert\psi_k\rangle.
\end{align}
$$
Finally, we obtained a sine function.

<img src="/images/diff_circuit.png" width="400">

A direct proposition is
$$
\frac{\partial \langle B\rangle_\eta}{\partial \eta} = \frac{1}{2}(\langle B\rangle_{\eta+\frac{\pi}{2}} - \langle B\rangle_{\eta+\frac{\pi}{2}})
$$


### For statistic functional

Next, we describe a new class of differenciable loss which can not be written as an obserable easily, the statistic functionals, for simplicity, we consider an arbitrary statistic functional $f(\xset)$, with a sequence of bit strings $\xset\equiv\{x_1,x_2,\ldots, x_r\}$ as its arguments.
Let's define the following expectation of this function
<div>$$\begin{equation}\Expect_f(\gammaset)\equiv\expect{f(\xset)}{\{x_i\sim \pshift{\gammav_i}\}_{i=1}^{r}}. \end{equation}$$</div>
Here, $\gammaset=\{\gammav_1, \gammav_2,\ldots,\gammav_r\}$ is the offset angles applied to circuit parameters,
%Its element $\gammav_i$ is defined in the same parameter space as $\thetav$ that represents a shift to $\thetav$.
which means the probability distributions of generated samples is
$\{\pshift{\gammav_1}, \pshift{\gammav_2},\ldots ,\pshift{\gammav_r}\}$.
Writing out the above expectation explicitly, we have
<div>$$\begin{equation}\Expect_f(\gammaset)=\sum\limits_\xset f(\xset)\prod\limits_i \pshift{\gammav_i}(x_i),\end{equation}$$</div>
where index $i$ runs from $1$ to $r$. Its partial derivative with respect to $\thetai$ is
<div>$$\begin{equation}\frac{\partial \Expect_f(\gammaset)}{\partial \thetai}=\sum\limits_\xset f(\xset)\sum\limits_j\frac{\partial \pshift{\gammav_j}(x_j)}{\partial\thetai}\prod\limits_{i\neq j} \pshift{\gammav_i}(x_i)\end{equation}$$</div>
Again, using the gradient of probability, we have
<div>$$\begin{align}\frac{\partial \Expect_f(\gammaset)}{\partial \thetai}&=\frac{1}{2}\sum\limits_{j,s=\pm}\sum\limits_\xset f(\xset){\pshift{\gammav_j+s\frac{\pi}{2}\ei}(x_j)}\prod\limits_{i\neq j} \pshift{\gammav_i}(x_i)\\&=\frac{1}{2}\sum\limits_{j,s=\pm}\Expect_f(\{\gammav_i+s\delta_{ij}\frac{\pi}{2}\ei\}_{i=1}^{r})\end{align}$$</div>

If $f$ is symmetric, $\Expect_f(\mathbf{0})$ becomes a V-statistic~\cite{Mises1947}, then the gradient can be further simplified to
<div>$$\begin{align}\frac{\partial \Expect_f(\gammaset)}{\partial \thetai}=\frac{r}{2}\sum\limits_{s=\pm}\Expect_f\left(\{\gammav_0+s\frac{\pi}{2}\ei,\gammav_1,\ldots,\gammav_r\}\right),\end{align}$$</div>
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
