---
layout: post
title:  "Simulating Magnetism"
date:   2019-03-26 00:00:00
categories: physics
---

In this post we will touch on a lot of interesting topics like Markov chains and Monte Carlo methods in the process of trying to understand more about magnetism. More specifically, we will construct a Markov chain Monte Carlo simulation of the Ising model (a ferromagnetism model) for a hyper-cubic lattice with periodic boundary conditions using the Metropolis algorithm. We will write the simulation in Julia since it is an excellent language for mathematical programming due to its robust performance and easy ability to parallelize.

## Modeling Systems with Many Degrees of Freedom

In physics we are often interested in modeling systems that are too complex to be modeled exactly so we have to turn to statistical modeling to to get an understanding of some of the macroscopic properties of the system without having to worry too much about the exact microscopic composition. Naturally computational physics has helped us understand a lot about statistical physics because of our ability to simulate and analyze systems with today's ever increasing computational power.

### Ising Model

One model we have learned a lot from is the Ising model of ferromagnetism. To get an idea of how it works let us consider a lattice where at each site $i$ of the lattice we have a spin $\sigma_i$ that can take on a value of $\pm 1$ corresponding to the spin pointing up or down. The Hamiltonian (energy) of the system in configuration $\{\sigma\}$ using the mean field approximation (i.e. we assume each spin is subject to an effective magnetic field $h$) and assuming a homogeneous coupling constant ($J_{ij} = J$) is then given by:

$$H(\{\sigma\}) = -J \sum_{\langle i j \rangle} \sigma_i \sigma_j - h \sum_i \sigma_i$$

Where the sum over $\langle i j \rangle$ is summing over every neighboring spin pair.

However, we will be examining the case where there is no external magnetic field, thus our Hamiltonian reduces to:

$$H(\{\sigma\}) = -J \sum_{\langle i j \rangle} \sigma_i \sigma_j$$

If $J > 0$ the energy is lowest when all spin pairs are aligned and highest when anti-aligned.

The magnetization of the system is given by:

$$M = \sum_i \sigma_i$$

### Canonical Ensemble

With the energy and magnetization we can now use statistical methods to obtain information about their probability distributions. To continue we must first understand the concept of a statistical ensemble. We can think of it as a virtual collection of all of the possible configurations of the system. Some of the configurations might have the same macroscopic properties but have different microscopic configurations. To get an idea of this we can think of a simple two-spin system where the energy is the same if both spins are up or down, thus two different configurations have the same energy.

In statistical physics we have three main equilibrium ensembles we use to model systems where the probability distribution is not explicitly dependent on time:

* Microcanonical - used for an isolated system whose energy and number of particles remain constant
* Canonical - used for a system in thermal equilibrium with a reservoir at a fixed temperature with which it is allowed to exchange energy, but the number of particles remains constant
* Grand Canonical - used for a system in thermal equilibrium with a reservoir where both energy and particles can be exchanged with the reservoir

Here we will be using the canonical ensemble so let's clarify exactly what that is. The canonical ensemble is a way of representing a system at a constant temperature $T$ with a fixed number of particles $N$, but we allow the energy to fluctuate. This ensemble is characterized by it's partition function $Z$, which contains a lot of information about the system. For a discrete system like the Ising model we have:

$$Z = \sum_{\{\sigma\}} e^{-\beta H(\{\sigma\})}$$

Where $\beta = \frac{1}{k_B T}$ and $k_B$ is Boltzmann's constant.

From this we can obtain some interesting quantities such as the free energy $F$ which is a measure of the amount of useful work one could extract from the system, or the average energy $E$.

$$
\begin{align*}
\begin{split}
	F &= -\frac{\log Z}{\beta} \\
	E &= -\frac{\partial \log Z}{\partial \beta}
\end{split}
\end{align*}
$$

When the system is in thermal equilibrium the probability of the system to be in configuration $\{\sigma\}$ is given by:

$$P_{eq}(\{\sigma\}) = \frac{e^{-\beta H(\{\sigma\})}}{Z}$$

Therefore, we see that the probability is dependent on both the internal energy of the system as well as the temperature.

## Importance Sampling and Monte Carlo Methods

When sampling distributions of systems with many possible configurations it is usually better to use what we call importance sampling rather than random sampling since one would need to take a significant number of random samples to get a good read. We can use an algorithm to propagate a Markov chain and take measurements at each step to get a better read on the probability distribution with less samples, this is called a Monte Carlo method.

The study of Markov chains is a rich subject with a lot of depth, but for this post we will only be covering the essentials needed to understand how they fit into our use case. The most important takeaway is that a Markov process is memoryless, meaning that the future state of the system depends only on the current state and not the states before that.

Let $P(\{\sigma\} \rightarrow \{\sigma\}')$ denote the probability of the system to transition from state $\{\sigma\} \rightarrow \{\sigma\}'$, and $P_\text{eq}$ be the equilibrium distribution. Then, a Markov chain is said to be reversible if it satisfies the detailed balance condition which ensures that the Markov process has a stationary state and $P_\text{eq}$ is the fixed point attractor of $P$. The detailed balance condition is given by:

$$P(\{\sigma\} \rightarrow \{\sigma\}') P_\text{eq}(\{\sigma\}) = P(\{\sigma\}' \rightarrow \{\sigma\}) P_\text{eq}(\{\sigma\}')$$

A Markov chain Monte Carlo (MCMC) simulation must satisfy the following conditions:

* $P(\{\sigma\} \rightarrow \{\sigma\}') > 0$
* $\sum\limits_{\{\sigma\}'} P(\{\sigma\} \rightarrow \{\sigma\}') = 1$
* Detailed balance

### Metropolis Algorithm

The Metropolis algorithm is an MCMC method we will utilize to sample our sample space for the Ising model. The probability of the system to transition from state $\{\sigma\}$ to $\{\sigma\}'$ is given by:

$$P(\{\sigma\} \rightarrow \{\sigma\}') = \min \{1, e^{-\beta \Delta E}\}$$

Where $\Delta E$ is the difference in energy between the proposed and current states. Therefore, if the new state has a lower energy we always transition to it, but if the new state has a higher energy we only transition if $P(\{\sigma\} \rightarrow \{\sigma\}') > R$, where $R \in [0, 1)$ is a randomly generated number. It can easily be shown that this satisfies the above conditions for an MCMC simulation.

The basic idea of what we will do with this is we will take a system of spins and evolve it towards its thermal equilibrium state while measuring quantities of interest. In the end we will be able to see how those quantities behave as a function of the temperature. This helps us understand a lot about the system and how it might behave.

## Implementing in Julia

I have exported the annotated code and results from a Jupyter notebook to an html file which can be viewed [here](/notebooks/ising-metropolis.html).

A copy of the .ipynb file can be downloaded [here](/notebooks/ising-metropolis.ipynb).
