---
layout: post
title: Jacobians and Hessians for Reversible Primitives
---

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



1. $a \mathrel+= b$

$$
J = \left(\begin{matrix}
1 & 1\\
0 & 1
\end{matrix}\right)
$$

The inverse is $a \mathrel-= b​$, its Jacobian is the inverse of the matrix above
$$
J(f^{-1}) = J^{-1} = \left(\begin{matrix}
1 & -1\\
0 & 1
\end{matrix}\right)
$$
In the following, we omit the Jacobian inverse functions.

2. $a\mathrel+=b*c$

$$
J = \left(\begin{matrix}
1 & c & b\\
0 & 1 & 0\\
0 & 0 & 1
\end{matrix}\right)
$$

3. $a\mathrel+=b/c​$

$$
J = \left(\begin{matrix}
1 & 1/c &-b/c^2\\
0 & 1 & 0\\
0 & 0 & 1
\end{matrix}\right)
$$

4. $a\mathrel+=b^c​$


$$
J = \left(\begin{matrix}
1 &  cb^{c-1} &    \log(b)b^c \\
0 & 1 & 0\\
0 & 0 & 1
\end{matrix}\right)
$$

5. $a\mathrel+=e^b​$

$$
J = \left(\begin{matrix}
1 &  e^b \\
0 & 1
\end{matrix}\right)
$$

6. $a\mathrel+=\log b$

$$
J = \left(\begin{matrix}
1 &  1/b \\
0 & 1
\end{matrix}\right)
$$

7. $a\mathrel+=\sin b$

$$
J = \left(\begin{matrix}
1 &  \cos b \\
0 & 1
\end{matrix}\right)
$$

8. $a\mathrel+=\cos b$

$$
J = \left(\begin{matrix}
1 &  -\sin b \\
0 & 1
\end{matrix}\right)
$$

9. $a \mathrel += | b|$

$$
J = \left(\begin{matrix}
1 &  {\rm sign} (b) \\
0 & 1
\end{matrix}\right)
$$

10. a = -a

$$
J = \left(\begin{matrix}
-1
\end{matrix}\right)
$$

11. ​

$$
{\rm ROT}(a, b, \theta)  = \left(\begin{matrix}
        \cos\theta & - \sin\theta\\
        \sin\theta  & \cos\theta
    \end{matrix}\right)
    \left(\begin{matrix}
        a\\
        b
    \end{matrix}\right),
$$

$$
J = \left(\begin{matrix}
        \cos\theta & - \sin\theta & -b\cos\theta-a\sin \theta\\
        \sin\theta  & \cos\theta & a\cos\theta -b\sin\theta\\
        0 & 0 & 1
    \end{matrix}\right)
$$



