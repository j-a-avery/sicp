# Exercise 1.13

Prove that $Fib(n)$ is the closest integer to <!-- $\phi^n / \sqrt{5}$ --> <img style="transform: translateY(0.1em); background: white;" src="..\svg\N5RiN0CC14.svg">, where <!-- $\phi = \left(1 + \sqrt{5}\right) / 2$ --> <img style="transform: translateY(0.1em); background: white;" src="..\svg\YR9MD8dRqm.svg">. (NB: In this case I am assuming "round" means the grade school round half-away-from-zero rule, where <!-- $\mathrm{round}(0.5) = 1$ --> <img style="transform: translateY(0.1em); background: white;" src="..\svg\wbHfB43jPF.svg"> and <!-- $\mathrm{round}(-0.5) = -1$ --> <img style="transform: translateY(0.1em); background: white;" src="..\svg\Y6vtHR3SsK.svg">.)

**Hint:** Let <!-- $\psi = \left( 1 - \sqrt 5\right) / 2$ --> <img style="transform: translateY(0.1em); background: white;" src="..\svg\pTI99S1iIb.svg">. Use induction and the definition of the Fibonacci numbers 
<!-- $\mathrm{Fib}(n) = \left\{ \begin{array}{ll} 0 & n = 0 \\ 1 & n = 1 \\ Fib(n-1) + Fib(n-1) & otherwise \\ \end{array} \right.$ --> <img style="transform: translateY(0.1em); background: white;" src="..\svg\x08vvcbx1g.svg"> 

to prove that <!-- $\mathrm{Fib}(n) = (\phi^n - \psi^n) / \sqrt{5}$ --> <img style="transform: translateY(0.1em); background: white;" src="..\svg\zSnSHjcqNv.svg">.

**Proof:**

When <!-- $n = 0$ --> <img style="transform: translateY(0.1em); background: white;" src="..\svg\lzpb98dQRp.svg">, we can use arithmetic to verify the first base case that <!-- $\mathrm{Fib}(0) = \mathrm{round}(\phi^n / \sqrt{5}) = \left(\phi^0 - \psi^0\right) / \sqrt{5} = 0$ --> <img style="transform: translateY(0.1em); background: white;" src="..\svg\ONAcA9qqOT.svg">:
<div>
    <!-- $\begin{aligned}
        \mathrm{Fib}(0) &= \mathrm{round}(\phi^0 / \sqrt{5}) = \mathrm{round}(1 / \sqrt{5}) = \mathrm{round}(0.4472\dots) = 0 \\
        \mathrm{Fib}(0) &= \left(\phi^0 - \psi^0\right) / \sqrt{5} = \left(1 - 1\right) / \sqrt{5} = 0
    \end{aligned}$ --> <img style="transform: translateY(0.1em); background: white;" src="..\svg\T10wingHWg.svg">
</div>

Similarly, for the second base case, <!-- $n = 1$ --> <img style="transform: translateY(0.1em); background: white;" src="..\svg\1VcWK6BkUi.svg">:
<div>
    <!-- $\begin{aligned}
        \mathrm{Fib}(1) &= \mathrm{round}(\phi / \sqrt{5}) = \mathrm{round}\left(0.7236\dots\right) = 1 &\\
        \mathrm{Fib}(1) &= \left(\phi - \psi\right)/\sqrt{5} = \left(\frac{1+\sqrt{5}}{2} - \frac{1-\sqrt{5}}{2}\right)\left(\frac{1}{\sqrt{5}}\right) &\\
            &= \left(\frac{\cancel{2}\cancel{\sqrt{5}}}{\cancel{2}}\right)\left(\frac{1}{\cancel{\sqrt{5}}}\right) = 1
    \end{aligned}$ --> <img style="transform: translateY(0.1em); background: white;" src="..\svg\IpMWnfC3Ir.svg">
</div>

Then, by induction, using the definition of Fibonacci numbers <!-- $\mathrm{Fib}(n) = \mathrm{Fib}(n - 1) + \mathrm{Fib}(n-2)$ --> <img style="transform: translateY(0.1em); background: white;" src="..\svg\KoLYNDRC4p.svg">, we see that for any <!-- $n > 1$ --> <img style="transform: translateY(0.1em); background: white;" src="..\svg\dkzkWWJnAP.svg">, <!-- $Fib(n) = \mathrm{round}(\phi^n / \sqrt{5})$ --> <img style="transform: translateY(0.1em); background: white;" src="..\svg\fXPcvPPfPC.svg">. 
