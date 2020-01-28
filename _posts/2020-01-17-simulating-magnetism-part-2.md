---
layout: post
title:  "Simulating Magnetism Part 2: Markov Chain Monte Carlo and the Metropolis Algorithm"
date:   2020-01-17 12:00:00
categories: physics
---

In order to simulate systems we need algorithms with which to do so.
There is a certain class of algorithms which are extremely useful for this application called Markov chain Monte Carlo (MCMC) methods.
In this post we will cover some of the basic ideas behind MCMC methods and see the Metropolis algorithm which will help us on our quest to simulate ferromagnetic systems.

## Markov Chains

A Markov process is a stochastic process where the future state is only dependent on the current state and not the past (i.e. memoryless). A discrete-time stochastic process satisfying the Markov property is called a Markov chain.

Let $W(\\{\sigma\\} \rightarrow \\{\sigma\\}')$ denote the probability of the system to transition from state $\\{\sigma\\} \rightarrow \\{\sigma\\}'$, and $P_\text{eq}$ be the equilibrium distribution. Then, a Markov chain is said to be reversible if it satisfies the detailed balance condition, which ensures that the Markov process has a stationary state and $P_\text{eq}$ is a fixed point attractor of $W$:

$$
W(\{\sigma\} \rightarrow \{\sigma\}') P_\text{eq}(\{\sigma\}) = W(\{\sigma\}' \rightarrow \{\sigma\}) P_\text{eq}(\{\sigma\}')
$$

Another (stronger) condition is global balance:

$$
\sum_{\{\sigma\}} W(\{\sigma\} \rightarrow \{\sigma\}') P_\text{eq}(\{\sigma\}) = P_\text{eq}(\{\sigma\}')
$$

## Monte Carlo Simulations

Monte Carlo simulations are based on statistical ensembles. Usually canonical ensembles where $T$ is given. They can be generalized to other ensembles, i.e. microcanonical where $E$ given, or grandcanonical where $T$ and $\mu$ are given and $N$ can change.

If we construct a Markov chain with $P_\text{eq}$ as it's stationary state, then we can get a useful sample of our distribution by sampling the Markov chain after a number of time steps.

There are three conditions a simulation must satisfy to be an MCMC method:

1. $W(\\{\sigma\\} \rightarrow \\{\sigma\\}') > 0$
2. $\sum_{\\{\sigma\\}'} W(\\{\sigma\\} \rightarrow \\{\sigma\\}') = 1$
3. Global balance, but this is often replaced by the sufficient condition of detailed balance (see below)

The reason detailed balance is sufficient is because combined with condition 2 it implies global balance is satisfied.
To see this we can sum both sides of the detailed balance equation over $\\{\sigma\\}$ and find:

$$
\begin{align*}
\begin{split}
	\sum_{\{\sigma\}} W(\{\sigma\} \rightarrow \{\sigma\}') P_\text{eq}(\{\sigma\}) &= \sum_{\{\sigma\}} W(\{\sigma\}' \rightarrow \{\sigma\}) P_\text{eq}(\{\sigma\}') \\
	&= P_\text{eq}(\{\sigma\}') \sum_{\{\sigma\}} W(\{\sigma\}' \rightarrow \{\sigma\}) \\
	&= P_\text{eq}(\{\sigma\}')
\end{split}
\end{align*}
$$

## Simple vs. Importance Sampling

Now that we have some basic yet powerful tools in our toolbox to use in our simulations, let's take a step back and look at the bigger picture.
The goal of this blog series is to simulate ferromagnetic systems so that we can get a better understanding of the physics of the system.
To do this we want to simulate systems of a given size $N$ at a given temperature $T$ (respectively $\beta$) so that we can take measurements of our observables (e.g. the energy $E$ and magnetization $M$) to aid in our analysis of the system.

Unfortunately, as the system size grows it becomes increasingly difficult get a good read on the distribution due to the fact we would need an increasingly larger number of samples.
To put this into perspective, for the Ising model a system of $N$ spins has $2^N$ possible states.
As $N$ grows the number of states grows exponential in $N$, which means that for a square lattice of side length $L = 32 \implies N = 32^2 = 1024$ we would have $2^{1024} \approx 1.8 \cdot 10^{308}$ states.
That is a *very* large number, way too large for us to even think about sampling all of the states in a reasonable amount of time.

Therefore, simple (uniform) sampling is not necessarily the best way to approach this problem. However, there is an alternative: importance sampling. This method gives more probable states heavier weights, allowing us to get a read on the system with a lower number of overall samples taken than with simple sampling.
Here is a summary of the two methods:

* Simple Sampling
	* Draw $\\{\sigma\\}$ at random, choose $\sigma_i = \pm 1$ with equal probability, $i \in \{1, ..., N\}$
	* Corresponds to $\beta = 0$ since all $E$ are equally probable
	* Does **not** work for $T < \infty$
* Importance Sampling
	* Construct a Markov chain (memory only to 1 step back) that propagates configurations
	* $\\{\sigma\\} -^W\rightarrow \\{\sigma\\}' -^W\rightarrow \\{\sigma\\}''$
	* With the operator $W(\\{\sigma\\} \rightarrow \\{\sigma\\}')$ s.t. $P(\\{\sigma\\}) \propto P_\text{eq}(\\{\sigma\\}) \propto e^{-\beta E(\\{\sigma\\})}$

## The Metropolis Algorithm

In 1953 an article titled *Equation of State Calculations by Fast Computing Machines*  appeared in the Journal of Chemical Physics, written by Nicholas Metropolis, Arianna W. Rosenbluth, Marshall Rosenbluth, Augusta H. Teller, and Edward Teller.
Their work is now known by every computational physicist out there, and is the basis upon which we will begin our simulations.

The Metropolis algorithm is a local update algorithm, meaning that only a single spin update is evaluated at each time.
The way it works is that at each step in the algorithm a spin is chosen (either at random or sequentially) and a new value for that spin is proposed.
If the probability for the spin to transition to the proposed value is greater than a randomly generated number $R \in [0, 1)$, then the spin is flipped and the algorithm moves on to the next step where another spin is chosen and the process repeated.

What this algorithm is actually doing is it's taking the system from it's initial state (we initialize the lattice either randomly (hot start) or with all spins pointing in the same direction (cold start)) and propagating it towards thermal equilibrium for the given temperature.
Due to the stochastic nature of the algorithm it will oscillate around the equilibrium point allowing the more probable states the occur more often and the less probably states to occur less often, thus the observables we obtain from this are importance sampled.

In the case of the Ising model the probability for a the system to transition from $\\{\sigma\\} \rightarrow \\{\sigma\\}'$ (i.e. for the chosen spin to flip) in the Metropolis algorithm is given by:

$$W(\{\sigma\} \rightarrow \{\sigma\}') = \min\{1, e^{-\beta \Delta E}\}$$

Where $\Delta E = E_\text{new} - E_\text{old}$.
Analyzing the above function we can see that when $E_\text{new} \le E_\text{old} \implies W(\{\sigma\} \rightarrow \{\sigma\}') = 1$, i.e. the system will always transition states if flipping the spin will decrease the energy or leave the energy unchanged. When $E_\text{new} > E_\text{old} \implies W(\{\sigma\} \rightarrow \{\sigma\}') < 1$, i.e. the system will only transition if the randomly generated number $R < e^{-\beta \Delta E}$.

We can verify that this satisfies the detailed balance equation for the two possible cases:

* $E_\text{new} \le E_\text{old}$
	* $W(\\{\sigma\\} \rightarrow \\{\sigma\\}') P_\text{eq}(\\{\sigma\\}) = 1 \cdot e^{-\beta E(\\{\sigma\\})} = e^{-\beta E(\\{\sigma\\})}$
	* $W(\\{\sigma\\}' \rightarrow \\{\sigma\\}) P_\text{eq}(\\{\sigma\\}') = e^{-\beta (E(\\{\sigma\\}) - E(\\{\sigma\\}'))} \cdot e^{-\beta E(\\{\sigma\\}')} = e^{-\beta E(\\{\sigma\\})}$
* $E_\text{new} > E_\text{old}$
	* $W(\\{\sigma\\} \rightarrow \\{\sigma\\}') P_\text{eq}(\\{\sigma\\}) = e^{-\beta (E(\\{\sigma\\}') - E(\\{\sigma\\}))} \cdot e^{-\beta E(\\{\sigma\\})} = e^{-\beta E(\\{\sigma\\}')}$
	* $W(\\{\sigma\\}' \rightarrow \\{\sigma\\}) P_\text{eq}(\\{\sigma\\}') = 1 \cdot e^{-\beta E(\\{\sigma\\}')} = e^{-\beta E(\\{\sigma\\}')}$

Written in pseudocode:

```
algorithm Metropolis(β, N, N_steps)
	σ ← initialize the lattice of N spins (all values ∈ {-1, 1})
	E ← the current energy

	for step in 1 to N_steps
		R     ← random number ∈ [0, 1)
		σ_i   ← choose a spin from σ
		E_new ← the energy as if σ_i were flipped

		if E_new - E < 0 or exp(-β(E_new - E)) > R
			σ_i ← -σ_i
			E   ← E_new
		end
	end
end
```

## Up Next

Now that we have an algorithm we can use in our simulations it's time to start constructing the simulations themselves.
In the next post in the series we will cover the implementation of the Ising model and Metropolis algorithm in Julia and some tips and tricks to make it faster and more efficient.
We will run some simulations for square lattices of varying sizes at varying temperatures to see how the underlying physical system behaves.
Coding the simulation is the most fun part so stay tuned!
