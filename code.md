@def title = "Coding Base"
@def tags = ["code", "Jinguo Liu"]
@def asciinema = true

# Code Base
~~~
<big>
Dear reader,
please <a href="https://github.com/GiggleLiu/giggleliu.github.io/issues">file an issue</a> if any gist or notebook is broken, thank you! - Jinguo</big>
~~~


## Notebooks

* [Tropical tensor networks for solving combinatoric optimization problems](https://giggleliu.github.io/notebooks/notebooks/tropicaltensornetwork.html)
* [Speed up Tropical matrix multiplication](https://giggleliu.github.io/notebooks/notebooks/tropicalgemm.html)
* [Yao's block system](https://giggleliu.github.io/notebooks/notebooks/yaoblocks.html)
* [CAJUN talk on generic tensor networks (July 14, 2022)](https://giggleliu.github.io/notebooks/notebooks/CAJUN07142022.html)

* [Solving TFI model with only 2 qubits - the 幺 simulation](/_htmls/TwoQubit-VQE/)
* [Quantum Circuit ABC](/_htmls/qc-abc/)
* [Porting Yao with QuantumInformation](/_htmls/yao_port_qi/)

## Gists
* [Computing two dimensional Fibonacci number with generic tensor networks + GPU in Julia](https://gist.github.com/GiggleLiu/dd208e04456dd6aba140b7b304a7d020)

* [Compute matrix multiplication `C = A * B` using the strassen algorith](https://gist.github.com/GiggleLiu/62c4d4a0c54855fdf4a0456ad82fd6f5)

* [Slicing + multi-GPU for contracting OMEinsum tensor contraction](https://gist.github.com/GiggleLiu/d5b66c9883f0c5df41a440589983ab99)

* [BLAS for tropical numbers](https://gist.github.com/GiggleLiu/a6d2bed21731fa344f4d7c1660f35952)

* [CUDAnative based einsum! on GPU - the prototype](https://gist.github.com/GiggleLiu/d72b04fd4d2123a4dba0d024e210da6c)
* [Automatic Differentiation over Tensor Renormalization Group](https://gist.github.com/GiggleLiu/0fb539d1a453b2cc6aca769d14d2cc79)
* [Get the groundstate for a Hamiltonian (not VQE!) using Yao.jl](https://gist.github.com/GiggleLiu/5258ebc44e2b1460514be3f5da71aa1d)

## Live Coding
#### Clip Control
~~~
<ul>
<li>Pause: <kbd>SPACE</kbd></li>
<li>Fast Forward: <kbd>→</kbd></li>
<li>Fast Backward: <kbd>←</kbd></li>
<li>Toggle Full Screen: <kbd>f</kbd></li>
</ul>
~~~

#### Muscle memory (1). Basic types and control flow
{{livecoding https://raw.githubusercontent.com/GiggleLiu/notebooks/master/livecoding/1.basic/main.cast}}

#### Muscle memory (2). Array operations
{{livecoding https://raw.githubusercontent.com/GiggleLiu/notebooks/master/livecoding/2.array/main.cast}}

#### Muscle memory (3). Data types
{{livecoding https://raw.githubusercontent.com/GiggleLiu/notebooks/master/livecoding/3.types/main.cast}}

#### Muscle memory (4). Functions and multiple dispatch
{{livecoding https://raw.githubusercontent.com/GiggleLiu/notebooks/master/livecoding/4.multipledispatch/main.cast}}

#### Muscle memory (5). Performance tips
{{livecoding https://raw.githubusercontent.com/GiggleLiu/notebooks/master/livecoding/5.performance/main.cast}}

#### Muscle memory (6). Meta-programming
{{livecoding https://raw.githubusercontent.com/GiggleLiu/notebooks/master/livecoding/6.metaprogramming/main.cast}}

#### Tutorial on quantum simulator Yao (@v0.8.3)
{{livecoding https://raw.githubusercontent.com/GiggleLiu/notebooks/master/livecoding/yao/main.cast}}

#### The instantiation of a Julia function (in Chinese)

{{livecoding https://raw.githubusercontent.com/GiggleLiu/notebooks/master/livecoding/matmul/main.cast}}


## Blogs
~~~
{{bloglist}}
~~~

## Slides
* [Google Slides: Differential Programming for Physicists](https://docs.google.com/presentation/d/1KZWHSt3GRCGU4AwkwJvnHKxEm-Y-WhTcFSW7sR7cs9s/edit?usp=sharing)