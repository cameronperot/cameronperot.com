---
layout: post
title:  "The Principle of Least Action"
date:   2018-03-01 12:00:00
categories: physics
---

There's several different ways one can approach mechanics. Analytical mechanics is the term that encompasses some of these ways including the well known Lagrangian and Hamiltonian mechanics. I will start by explaining what the Lagrangian approach is and derive how we arrive at the famous Euler-Lagrange (differential) equation that describes how the system evolves in time.

It all begins with Hamilton's principle of least action, one of the most fundamental concepts in physics. If at time $t_1$ the system is in the configuration $q(t_1) = q_1$ and at time $t_2$ is in the configuration $q(t_2) = q_2$, then Hamilton's principle of least action says that the path taken between $q_1$ and $q_2$ will be the path such that the action $S$ of the system is minimized.

The action of the system is given by:

$$S = \int\limits_{t_1}^{t_2} L(q(t), \dot{q}(t), t)dt$$

where

$$L = T - V$$

with $T$ and $V$ being the kinetic and potential energies of the system, respectively. For simplicity of notation from here on $q(t) = q$ and $\dot{q}(t) = \dot{q}$.

In order for the action to be minimized, we require that small perturbations to the path leave the action unchanged. The best way to think about it is that when we have extrema (minima/maxima) the derivative of a function is equal to zero, thus a small "step" in any direction will not change the value of the function. Applying that concept to this we can think of the entire path being the minimum if for each point along the path we can take a small step in any direction without affecting the action.

To do this we start by holding the endpoints $q_1$ and $q_2$ fixed in time. Now we say that for every point along the path we should be able to change it by some small amount $\delta q(t)$, thus we have:

$$
\begin{align*}
\begin{split}
	q  &\rightarrow q + \delta q \\
	\dot{q} & \rightarrow \dot{q} + \delta\dot{q}
\end{split}
\end{align*}
$$

Now let's see how this change affects the action. Knowing we need the change in the action to be zero, we see that:

$$
\begin{align*}
\begin{split}
	\delta S &= \delta \int\limits_{t_1}^{t_2} L(q, \dot{q}, t)dt \\
	&= \int\limits_{t_1}^{t_2} [L(q + \delta q, \dot{q} + \delta\dot{q}, t) - L(q, \dot{q}, t)] dt \\
	&= 0
\end{split}
\end{align*}
$$

To the first order we have:

$$\delta S = \int\limits_{t_1}^{t_2} \bigg[ \frac{\partial L}{\partial q}\delta q +\frac{\partial L}{\partial \dot{q}}\delta\dot{q} \bigg] dt$$

Using integration by parts:

$$\delta S = \bigg[ \frac{\partial L}{\partial \dot{q}} \delta q \bigg]_{t_1}^{t_2} +  \int\limits_{t_1}^{t_2} \bigg[ \frac{\partial L}{\partial q} - \frac{d}{dt}\frac{\partial L}{\partial \dot{q}}\bigg] \delta q dt$$

Since we've held the endpoints fixed, the first term is zero because $\delta q(t_1) = \delta q(t_2) = 0$, leaving us with:

$$\delta S = \int\limits_{t_1}^{t_2} \bigg[ \frac{\partial L}{\partial q} - \frac{d}{dt}\frac{\partial L}{\partial \dot{q}}\bigg] \delta q dt = 0$$

In order for the above to be zero we need:

$$\frac{d}{dt}\frac{\partial L}{\partial \dot{q}} = \frac{\partial L}{\partial q}$$

Which is the beautiful Euler-Lagrange equation. This can be scaled to systems with $N$ degrees of freedom, as each $q_i$ will satisfy it's own corresponding Euler-Lagrange equation, and there will be $N$ equations of motion. This is the requirement for the action to be minimized. Thus if we know the kinetic and potential energies of the system, the equations of motion are fairly easy to obtain (although solving them might not be so trivial). In a future post I will derive Hamilton's (coupled differential) equations from the Lagrangian, which is yet another way of arriving at the same equations of motion.
