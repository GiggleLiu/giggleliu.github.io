---
layout: post
title: Jacobians and Hessians for Reversible Primitives
---

This blog covers the Jacobians and Hessians for reversible primitives, they can be used to propagate gradients and Hessians in a reversible programs.

## The Definition

For function $\vec{y} = f(\vec{x})$, we define its Jacobian as
$$
J_{ij} = \frac{\partial y_i}{\partial x_j}.
$$

Its Hessian is
$$
H^k_{ij} = \frac{\partial y_k}{x_i x_j}
$$

## Jacobian of Reversible Primitives



(1). $a \mathrel+= b$

$$
\begin{align}
J &= \left(\begin{matrix}
1 & 1\\
0 & 1
\end{matrix}\right)\\
H &= \mathbf{0}
\end{align}
$$

The inverse is $a \mathrel-= b​$, its Jacobian is the inverse of the matrix above

$$
J(f^{-1}) = J^{-1} = \left(\begin{matrix}
1 & -1\\
0 & 1
\end{matrix}\right)
$$

In the following, we omit the Jacobians and Hessians of inverse functions.

(2). $a\mathrel+=b*c$

$$
J = \left(\begin{matrix}
1 & c & b\\
0 & 1 & 0\\
0 & 0 & 1
\end{matrix}\right)\\
H^a_{bc} = H^a_{cb} = 1, else ~0
$$

(3). $a\mathrel+=b/c​$

$$
J = \left(\begin{matrix}
1 & 1/c &-b/c^2\\
0 & 1 & 0\\
0 & 0 & 1
\end{matrix}\right)\\
H^a_{cc} = 2b/c^3,\\
H^a_{bc} = H^a_{cb} = -1/c^2,else ~ 0
$$

(4). $a\mathrel+=b^c​$


$$
J = \left(\begin{matrix}
1 &  cb^{c-1} &   b^c \log b \\
0 & 1 & 0\\
0 & 0 & 1
\end{matrix}\right)\\
H^a_{bc} = H^a_{cb}  = b^{c-1} + c b^{c-1}\log b,\\
H^a_{bb} = (c-1)c b^{c-2},\\
H^a_{cc} = b^c\log^2b, else ~0
$$

(5). $a\mathrel+=e^b$

$$
J = \left(\begin{matrix}
1 &  e^b \\
0 & 1
\end{matrix}\right)\\
H^a_{bb} = e^b, else ~0
$$

(6). $a\mathrel+=\log b​$

$$
J = \left(\begin{matrix}
1 &  1/b \\
0 & 1
\end{matrix}\right)\\
H^a_{bb} = -1/b^2, else ~0
$$

(7). $a\mathrel+=\sin b​$

$$
J = \left(\begin{matrix}
1 &  \cos b \\
0 & 1
\end{matrix}\right)\\
H^a_{bb} = -\sin b, else ~0
$$

(8). $a\mathrel+=\cos b​$

$$
J = \left(\begin{matrix}
1 &  -\sin b \\
0 & 1
\end{matrix}\right)\\
H^a_{bb} = -\cos b, else ~0
$$

(9). $a \mathrel+= \vert b\vert​$

$$
J = \left(\begin{matrix}
1 &  {\rm sign} (b) \\
0 & 1
\end{matrix}\right)\\
H = \mathbf{0}
$$

(10). $a = -a​$

$$
J = \left(\begin{matrix}
-1
\end{matrix}\right)\\
H = \mathbf{0}
$$

(11). ${\rm SWAP}(a, b) = (b, a)$

$$
    J = \left(\begin{matrix}
0 & 1 \\
1 & 0
\end{matrix}
\right)\\
    H = \mathbf{0}
$$


(12). ​

$$
{\rm ROT}(a, b, \theta)  = \left(\begin{matrix}
        \cos\theta & - \sin\theta\\
        \sin\theta  & \cos\theta
    \end{matrix}\right)
    \left(\begin{matrix}
        a\\
        b
    \end{matrix}\right)
$$

$$
\begin{align*}
    &J = \left(\begin{matrix}
        \cos\theta & - \sin\theta & -b\cos\theta-a\sin \theta\\
        \sin\theta  & \cos\theta & a\cos\theta -b\sin\theta\\
        0 & 0 & 1
    \end{matrix}\right)\\
    &H^a_{a\theta} = H^a_{\theta, b} = -\sin\theta,\\
    &H^a_{b\theta} = H^a_{\theta, b} = -\cos\theta,\\
    &H^a_{\theta\theta} = -a\cos\theta + b\sin\theta,\\
    &H^b_{a\theta} = H^b_{\theta a} = \cos\theta,\\
    &H^b_{b\theta} = H^b_{\theta b} = -\sin\theta,\\
    &H^b_{\theta\theta} = -b\cos\theta-a\sin\theta, else ~0
\end{align*}
$$
