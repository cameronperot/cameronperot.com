---
layout: post
title:  "Hamilton's Equations"
date:   2018-03-02 00:00:00
categories: physics
---

Hamiltonian mechanics are similar to Lagrangian mechanics, and in the end will yield the same equations of motion. The concept of the Hamiltonian is heavily used in many aspects of physics, and most notably in the formulation of quantum mechanics.

The Hamiltonian, $H$, of a system is the total energy of the system, and thus is conserved if the total time derivative is equal to zero (more on that near the end).

In order to obtain the Hamiltonian from the Lagrangian, one must perform a Legendre transform because the Hamiltonian is a function of $p$ and $q$ and the Lagrangian is one of $q$ and $\dot{q}$.

$p$ is the momentum conjugate to $q$. It is not necessarily (but sometimes can be) momentum in the traditional sense of $mv$. For example if $q$ is the angular coordinate of a pendulum then $p$ might be the corresponding angular momentum. We define as follows:

$$p = \frac{\partial L}{\partial \dot{q}}$$

From the Euler-Lagrange equation we also know that:

$$\dot{p} =\frac{\partial L}{\partial q}$$

We start by taking the total differential of the Lagrangian of a system with $N$ degrees of freedom $L = L(q_1, ..., q_N, \dot{q}_1, ..., \dot{q}_N, t)$:

$$dL =\sum\limits_{i=1}^{N} \bigg[ \frac{\partial L}{\partial q_i}dq_i +\frac{\partial L}{\partial \dot{q}_i}d\dot{q}_i \bigg] +\frac{\partial L}{\partial t}dt$$

Using the above relations for the momentum conjugates and rearranging we find:

$$
\begin{align*}
\begin{split}
	dL &=\sum\limits_{i=1}^{N} [ \dot{p}_i dq_i + p_i d\dot{q}_i ] + \frac{\partial L}{\partial t}dt \\
	&=\sum\limits_{i=1}^{N} [ \dot{p}_i dq_i + d(p_i \dot{q}_i) - \dot{q}_i dp_i ] + \frac{\partial L}{\partial t}dt
\end{split}
\end{align*}
$$

Which leads us to:

$$d \bigg( \sum\limits_{i=1}^{N} p_i \dot{q}_i - L \bigg) =\sum\limits_{i=1}^{N} [-\dot{p}_i dq_i + \dot{q}_i dp_i] -\frac{\partial L}{\partial t}dt$$

Where we have the energy of the system as the differential on the LHS, thus:

$$H =\sum\limits_{i=1}^{N} p_i \dot{q}_i - L$$

However, we also know:

$$dH =\sum\limits_{i=1}^{N} \bigg[ \frac{\partial H}{\partial q_i}dq_i +\frac{\partial H}{\partial p_i}dp_i \bigg] +\frac{\partial H}{\partial t}dt$$

Comparing the two differentials for $H$ we find Hamilton's equations:

$$
\begin{align*}
\begin{split}
	\dot{q}_i &=\frac{\partial H}{\partial p_i} \\
	\dot{p}_i &= -\frac{\partial H}{\partial q_i}
\end{split}
\end{align*}
$$

As well as:

$$\frac{\partial H}{\partial t} = -\frac{\partial L}{\partial t}$$

Talking the total time derivative of $H$ we get:

$$\frac{dH}{dt} =\sum\limits_{i=1}^{N} \bigg[ \frac{\partial H}{\partial q_i}\dot{q}_i +\frac{\partial H}{\partial p_i}\dot{p}_i \bigg] +\frac{\partial H}{\partial t}$$

Plugging in Hamilton's equations we arrive at:

$$\frac{dH}{dt} = \frac{\partial H}{\partial t} = -\frac{\partial L}{\partial t}$$

Which tells us that if the Lagrangian or Hamiltonian is not explicitly dependent on time, then the energy of the system (Hamiltonian) is conserved!
