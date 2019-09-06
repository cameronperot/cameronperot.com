---
layout: post
title:  "Laurent Series"
date:   2018-03-03 00:00:00
categories: math
---

Laurent series are generalized power series for complex valued functions that allows the use of negative indices (with the $a_{-1}$ coefficient being the residue of the function at the point of expansion). I recently came across this neat example of one that I found illustrates the idea of a disc or annulus of convergence pretty well. A nice interpretation of the radius of convergence is the distance to the nearest singularity in the complex plane.

## A Cool Example

The function we have is:

$$f(z) = \frac{1}{(z-a)(z-b)}$$

Where $a, b \in \mathbb{C}$ and $\|a\|<\|b\|$

Using partial fraction expansion we find:

$$f(z) = \frac{1}{a-b} \bigg(\frac{1}{z-a} - \frac{1}{z-b}\bigg)$$

Most of the time the Laurent series coefficients aren't so trivial to obtain, so we start from a series we know and try to manipulate ours into a form we can recognize. We know the common power series:

$$\frac{1}{1-x} = \sum\limits_{n=0}^{\infty} x^n$$

Because we have singularities of our function at $a$ and $b$ we have several different areas of convergence. They are as follows.

### Disc of Convergence $0<|z|<|a|$

$$
\begin{align*}
\begin{split}
	f(z) &= \frac{1}{a-b} \bigg(-\frac{1}{a} \sum\limits_{n=0}^{\infty}\bigg(\frac{z}{a}\bigg)^n + \frac{1}{b} \sum\limits_{n=0}^{\infty}\bigg(\frac{z}{b}\bigg)^n\bigg) \\
	&= \frac{1}{a-b} \sum\limits_{n=0}^{\infty}(-a^{-n-1} + b^{-n-1})z^n
\end{split}
\end{align*}
$$

### Disc of Convergence $0<|z-a|<|b-a|$

Let $w = z-a$

$$
\begin{align*}
\begin{split}
	f(w) &= \frac{1}{a-b} \bigg(\frac{1}{w} - \frac{1}{w-(b-a)}\bigg) \\
	&= \frac{1}{a-b} \bigg(\frac{1}{w} + \frac{1}{b-a} \sum\limits_{n=0}^{\infty}\bigg(\frac{w}{b-a}\bigg)^n\bigg)
\end{split}
\end{align*}
$$

Substituting $w$ back in we find

$$
\begin{align*}
\begin{split}
	f(z)& = \frac{1}{a-b} \bigg(\frac{1}{z-a} + \frac{1}{b-a}\sum\limits_{n=0}^{\infty}\bigg(\frac{z-a}{b-a}\bigg)^n\bigg) \\
	&= \frac{1}{a-b}\bigg(\frac{1}{z-a} + \sum\limits_{n=0}^{\infty}(b-a)^{-n-1}(z-a)^n\bigg) \\
	&= \frac{1}{a-b}\sum\limits_{n=-1}^{\infty}(b-a)^{-n-1}(z-a)^n \\
	&= -\sum\limits_{n=-1}^{\infty}(b-a)^{-n-2}(z-a)^n \\
\end{split}
\end{align*}
$$

### Disc of convergence $0<|z-b|<|a-b|$

Process is similar to that of the previous disc, resulting in:

$$
\begin{align*}
\begin{split}
	f(z) = -\sum\limits_{n=-1}^{\infty}(a-b)^{-n-2}(z-b)^n
\end{split}
\end{align*}
$$

### Annulus of Convergence $|a|<|z|<|b|$

$$
\begin{align*}
\begin{split}
	f(z) &= \frac{1}{a-b}\bigg(\frac{1}{z}\sum\limits_{n=0}^{\infty}\bigg(\frac{a}{z}\bigg)^n + \frac{1}{b}\sum\limits_{n=0}^{\infty}\bigg(\frac{z}{b}\bigg)^n\bigg) \\
	&= \frac{1}{a-b}\sum\limits_{n=0}^{\infty}(a^n z^{-n-1} + b^{-n-1} z^n)
\end{split}
\end{align*}
$$

Laurent series are a powerful tool we can use, and are actually pretty fun to work with once you get the hang of it. For some functions finding the residue might not be so easy so it might be a good idea to try and expand it into a series and see if the answer pops right out!
