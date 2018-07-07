---
layout: post
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
### For an Obserable

Consider the expectation value of $B$ on state <span>$\vert\psi_N\rangle = U_{N:k+1} U_k(\eta)U_{k-1:1}\vert\psi_0\rangle$</span> with $U_k(\eta)=e^{i\Xi(\eta)}$,
Now we want to get the gradient for this expectation value that appear in Ref. [2-4] briefly, the gradient
<div>$$\begin{align}\frac{\partial \langle B\rangle_\eta}{\partial \eta} &=i\langle \psi_0\vert U_{N:1}^\dagger BU_{N:k+1} \frac{\partial \Xi(\eta)}{\partial \eta} U_{k:1}\vert \psi_0\rangle-i\langle \psi_0\vert U_{k:1}^\dagger \frac{\partial \Xi(\eta)}{\partial \eta} U_{N:k+1}^\dagger BU_{N:1}\vert \psi_0\rangle\end{align}$$</div>
Here, we have used the fact that $\Xi(\eta)$ is Hermitian. Define $O_{k+1}\equiv U_{N:k+1}^\dagger BU_{N:k+1}$ and $\vert \psi_{k}\rangle\equiv U_{k:1}\vert \psi_0\rangle$, we have
<div>$$\begin{equation}\frac{\partial \langle B\rangle_\eta}{\partial \eta} =\langle\psi_{k}\vert  i\left[O_{k+1}, \frac{\partial \Xi(\eta)}{\partial \eta}\right]\vert \psi_{k}\rangle.\end{equation}$$</div>
Define $A_\pm\equiv\frac{1}{\sqrt{2}} (1\pm i\frac{\partial \Xi(\eta)}{\partial \eta})$, we can easily verify that $ i\left[O_{k+1}, \frac{\partial \Xi(\eta)}{\partial \eta}\right]= A^\dagger_+ O_{k+1}A_+-A_-^\dagger O_{k+1}A_-$,
which can be estimated unbiasedly by constructing $\vert \psi_N\rangle_\pm = U_{N:k+1}A_\pm U_{k:1}\vert \psi_0\rangle$.
Noticing for a non-dissipative system, we further require $A$ being unitary, which means $\frac{\partial \Xi(\eta)}{\partial \eta}^2=1$ (e.g. Pauli operators, CNOT and SWAP).

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
