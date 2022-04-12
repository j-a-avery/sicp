# Exercise 1.13

Prove that $Fib(n)$ is the closest integer to $\phi^n / \sqrt{5}$, where $\phi = \left(1 + \sqrt{5}\right) / 2$. (NB: In this case I am assuming "round" means the grade school round half-away-from-zero rule, where $\mathrm{round}(0.5) = 1$ and $\mathrm{round}(-0.5) = -1$.)

**Hint:** Let $\psi = \left( 1 - \sqrt 5\right) / 2$. Use induction and the definition of the Fibonacci numbers $$\mathrm{Fib}(n) = \left\{ \begin{array}{ll} 0 & n = 0 \\ 1 & n = 1 \\ Fib(n-1) + Fib(n-1) & otherwise \\ \end{array} \right.$$ to prove that $\mathrm{Fib}(n) = (\phi^n - \psi^n) / \sqrt{5}$.

**Proof:**

When $n = 0$, we can use arithmetic to verify the first base case that $\mathrm{Fib}(0) = \mathrm{round}(\phi^n / \sqrt{5}) = \left(\phi^0 - \psi^0\right) / \sqrt{5} = 0$:
    $$\begin{aligned}
        \mathrm{Fib}(0) &= \mathrm{round}(\phi^0 / \sqrt{5}) = \mathrm{round}(1 / \sqrt{5}) = \mathrm{round}(0.4472\dots) = 0 \\
        \mathrm{Fib}(0) &= \left(\phi^0 - \psi^0\right) / \sqrt{5} = \left(1 - 1\right) / \sqrt{5} = 0
    \end{aligned}$$

Similarly, for the second base case, $n = 1$:
    $$\begin{aligned}
        \mathrm{Fib}(1) &= \mathrm{round}(\phi / \sqrt{5}) = \mathrm{round}\left(0.7236\dots\right) = 1 &\\
        \mathrm{Fib}(1) &= \left(\phi - \psi\right)/\sqrt{5} = \left(\frac{1+\sqrt{5}}{2} - \frac{1-\sqrt{5}}{2}\right)\left(\frac{1}{\sqrt{5}}\right) &\\
            &= \left(\frac{\cancel{2}\cancel{\sqrt{5}}}{\cancel{2}}\right)\left(\frac{1}{\cancel{\sqrt{5}}}\right) = 1
    \end{aligned}$$

Then, by induction, using the definition of Fibonacci numbers $\mathrm{Fib}(n) = \mathrm{Fib}(n - 1) + \mathrm{Fib}(n-2)$, we see that for any $n > 1$, $Fib(n) = \mathrm{round}(\phi^n / \sqrt{5})$. 
