@def title = "Symmetries of Neural Networks as a Quantum Wave Function Ansatz"

## Momentum Selection
Translation invariance of wave functions are different from that in Neural networks,
since wave functions have phases.

For state $\vert\psi\rangle$ with momentum $k$, we have the momentum-translation relation

$\langle T_n\sigma\vert\psi\rangle=e^{ikn}\langle \sigma\vert\psi\rangle$

Assume $\langle\sigma\vert\psi\rangle=h(\sum\limits_m e^{-ikm}g(T_m\sigma))$, and wish to obtain the state in desired momentum sector. Usually $g(T_m\sigma)$ correspond to some elemental function applied on the output of a convolution layer. **To make g more powerful, we can mix different features but not $m$ (as batch dimension)**.



The above form also pose some requirements on function $h$.

For $k=0$,  momentum-translation relation is automatically satisfied using arbituary $h$.

For $k\neq0​$, let $y(\sigma)=\sum\limits_m e^{-ikm}g(T_m\sigma)​$, we have $y(T_n\sigma)=e^{ikn}y(\sigma)​$ which is already a qualified solution. In order to keep this attribute, $h​$ need to meet the **phase keeping** requirement $h(e^{ikn}y)=e^{ikn}h(y)​$. The folloing construction are legal

* linear function that $h(\alpha y_1+\beta y_2)=\alpha h(y_1)+\beta h(y_2)$, let $\beta=0$ and the above result is straight forward,
* nonlinear function that map $y$ to either $0$ or $\alpha y$ like ReLU,
* elemental function that act on absolute part like $h(y)=\hat{y}h(\vert y\vert)$ with $\hat{y}\equiv\frac{y}{\vert y\vert}$, $h(e^{ikn}y)=e^{ikn}\hat{y} h(\vert y\vert)=e^{ikn}h(y)$,
* combination of **phase keeping** functions are also **phase keeping**.

#### Numerical Result
For 1D $J_1-J_2$ model, $L=16, J_2=0.8$, I calculated the RBM ground state in $k=0,\pi$.
For $k=\pi$, we have the yellow line, which is the true ground state.
And the blue line is the ground state in the $k=0$ block, both of them matches the exact diagonalization results (dashed, straight lines, don't believe the legend...).
![](/assets/images/mselection.png)


## Ground state symmetry analysis

These ground states are obtained using ED. 

columns are different sizes for chain varying from $2$ to $20$, and rows are different $J_2$ varying from $0.0$ to $1.0$.

Data element '-++'  means system changes sign for translate 1 site operation ($T_1$), keeps sign for spin flip ($F$) and space inversion symmetry $I$.

| $J_2$\\$\mathcal{N}$ | 2     | 4     | 6     | 8     | 10    | 12    | 14    | 16    | 18    | 20    |
| -------------------- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- |
| 0.0                  | $---$ | $+++$ | $---$ | $+++$ | $---$ | $+++$ | $---$ | $+++$ | $---$ | $+++$ |
| 0.2                  | $---$ | $+++$ | $---$ | $+++$ | $---$ | $+++$ | $---$ | $+++$ | $---$ | $+++$ |
| 0.4                  | $---$ | $+++$ | $---$ | $+++$ | $---$ | $+++$ | $---$ | $+++$ | $---$ | $+++$ |
| 0.6                  | $---$ | $-++$ | $+--$ | $-++$ | $+--$ | $+++$ | $---$ | $+++$ | $---$ | $-++$ |
| 0.8                  | $---$ | $-++$ | $+--$ | $+++$ | $---$ | $+++$ | $+--$ | $-++$ | $---$ | $+++$ |
| 1.0                  | $---$ | $-++$ | $+--$ | $+++$ | $---$ | $-++$ | $+--$ | $+++$ | $---$ | $+++$ |

#### Summary

* $I,F$ changes sign of wave function when and only when $L/2$ is odd.
* For $J_2<0.5$, $T_1, F, I$ are all positive for even $L/2$ and negative for odd $L/2$.
* For $L=16$, $T_1$ have negative eigenvalue! This must be why I fail to get ground state for $N=16$. Is there a phase transition? I suspect even representation power of our Ansaz is enough to describe signn structures of $J_2=0.5$ and $J_2=0.0$, it can fail to describe sign structures for $J_2>0.5$.


