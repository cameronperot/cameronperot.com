---
layout: post
title:  "Electromagnetic Waves"
date:   2018-03-04 00:00:00
categories: physics
---

Electromagnetic radiation is the science of how waves in the electric and magnetic fields propagate through space-time. These waves are made up of EM quanta which we call photons. They can be anything from radio waves and microwaves to x-rays and gamma rays, depending on their frequency/wavelength. In this post let's derive the wave equations for the electric and magnetic fields from Maxwell's equations.

## Maxwell's Equations, Waves, and the Speed of Light

We start with Maxwell's equations in a medium with permittivity $\epsilon$ and permeability $\mu$, and without sources. Our four equations are:

$$
\begin{eqnarray}
\begin{split}
	\nabla \cdot \mathbf{E} &= 0 &\hspace{1cm} (1) \\
	\nabla \cdot \mathbf{B} &= 0 &\hspace{1cm} (2) \\
	\nabla \times \mathbf{E} &= -\frac{\partial \mathbf{B}}{\partial t} &\hspace{1cm} (3) \\
	\nabla \times \mathbf{B} &= \mu\epsilon \frac{\partial \mathbf{E}}{\partial t} &\hspace{1cm} (4)
\end{split}
\end{eqnarray}
$$

We will need to leverage the following vector identity:

$$\nabla \times (\nabla \times \mathbf{A}) = \nabla(\nabla \cdot \mathbf{A}) - \nabla^2 \mathbf{A}$$

Where $\mathbf{A}$ is just a vector, not necessarily the vector potential.

We start by taking the curl of both sides of 3:

$$\nabla \times (\nabla \times \mathbf{E}) = - \nabla \times \frac{\partial \mathbf{B}}{\partial t}$$

Using the vector identity and switching the order of derivation on the right hand side:

$$\nabla(\nabla \cdot \mathbf{E}) - \nabla^2 \mathbf{E} = -\frac{\partial}{\partial t} (\nabla \times \mathbf{B})$$

Plugging in 1 and 4 we arrive at the wave equation for the electric field:

$$ \frac{\partial^2 \mathbf{E}}{\partial t^2} = \frac{1}{\mu\epsilon}\nabla^2 \mathbf{E}$$

The derivation for the magnetic wave equation is the same process taking the curl of both sides of 4 and plugging in 2 and 3. One would arrive at:

$$ \frac{\partial^2 \mathbf{B}}{\partial t^2} = \frac{1}{\mu\epsilon}\nabla^2 \mathbf{B}$$

Seeing that this takes the form of the wave equation we immediately see the velocity at which the wave propagates:

$$c^2 = \frac{1}{\mu\epsilon} \implies c =\frac{1}{\sqrt{\mu\epsilon}}$$

This means that the speed at which electromagnetic waves propagate through a medium is dependent on the permittivity and permeability of the medium. If we look at the case in vacuum we see that the speed of light (which is the speed of all EM waves):

$$c_0 =\frac{1}{\sqrt{\mu_0\epsilon_0}} \approx 3\cdot 10^8 \frac{\text{m}}{\text{s}}$$

## Solution and Analysis of EM Waves

Now let's try to get a feeling for the properties of some of these waves. We start by taking an ansatz to the wave equation:

$$
\begin{align*}
\begin{split}
	\mathbf{E}(\mathbf{x}, t) &= \mathbf{E_0} e^{i(\mathbf{k}\cdot\mathbf{x} - \omega t)} \\
	\mathbf{B}(\mathbf{x}, t) &= \mathbf{B_0} e^{i(\mathbf{k}\cdot\mathbf{x} - \omega t)}
	\end{split}
\end{align*}
$$

Where $\mathbf{E_0}$ and $\mathbf{B_0}$ are constant vectors, $\mathbf{k} = k\mathbf{n}$ is the wave vector pointing in the direction of the unit vector $\mathbf{n}$, and $\mathbf{x}$ is the position vector.

Now let's put our ansatz into Maxwell's equations and see what pops out.

$$
\begin{align*}
\begin{split}
	\nabla \cdot \mathbf{E} &= \nabla \cdot (\mathbf{E_0} e^{i(\mathbf{k}\cdot\mathbf{x} - \omega t)}) \\
	&= i\mathbf{k} \cdot \mathbf{E_0} e^{i(\mathbf{k}\cdot\mathbf{x} - \omega t)} \\
	&= i \mathbf{k} \cdot \mathbf{E} \\
	&= 0
\end{split}
\end{align*}
$$

The above tells us that it is only satisfied when $\mathbf{k}$ is orthogonal to $\mathbf{E}$, or in other words the electric field is perpendicular to the direction the wave is propagating.

$$
\begin{align*}
\begin{split}
	\nabla \cdot \mathbf{B} &= \nabla \cdot (\mathbf{B_0} e^{i(\mathbf{k}\cdot\mathbf{x} - \omega t)}) \\
	&= i\mathbf{k} \cdot \mathbf{B_0} e^{i(\mathbf{k}\cdot\mathbf{x} - \omega t)} \\
	&= i \mathbf{k} \cdot \mathbf{B} \\
	&= 0
\end{split}
\end{align*}
$$

A similar result tells us that the magnetic field is also orthogonal to the direction of propagation.

Using the third equation we find:

$$
\begin{align*}
\begin{split}
	\nabla \times \mathbf{E} &= \nabla \times (\mathbf{E_0} e^{i(\mathbf{k}\cdot\mathbf{x} - \omega t)}) \\
	&= i\mathbf{k} \times \mathbf{E_0} e^{i(\mathbf{k}\cdot\mathbf{x} - \omega t)} \\
	&= ik \mathbf{n} \times \mathbf{E} \\
	&= -\frac{\partial \mathbf{B}}{\partial t} \\
	&= -\frac{\partial}{\partial t}\mathbf{B_0} e^{i(\mathbf{k}\cdot\mathbf{x} - \omega t)} \\
	&= i \omega\mathbf{B_0} e^{i(\mathbf{k}\cdot\mathbf{x} - \omega t)} \\
	&= i\omega \mathbf{B}
\end{split}
\end{align*}
$$

Which simplifies to:

$$\mathbf{B} = \frac{k}{\omega} \mathbf{n} \times \mathbf{E}$$

This tells us that the magnetic field is perpendicular to the electric field as well as the propagation direction.

And from the fourth equation:

$$
\begin{align*}
\begin{split}
	\nabla \times \mathbf{B} &= \nabla \times (\mathbf{B_0} e^{i(\mathbf{k}\cdot\mathbf{x} - \omega t)}) \\
	&= i\mathbf{k} \times \mathbf{B_0} e^{i(\mathbf{k}\cdot\mathbf{x} - \omega t)} \\
	&= ik \mathbf{n} \times \mathbf{B} \\
	&= \mu\epsilon \frac{\partial \mathbf{E}}{\partial t} \\
	&=\mu\epsilon \frac{\partial}{\partial t}\mathbf{E_0} e^{i(\mathbf{k}\cdot\mathbf{x} - \omega t)} \\
	&= -i \omega\mu\epsilon \mathbf{E_0} e^{i(\mathbf{k}\cdot\mathbf{x} - \omega t)} \\
	&= -i \omega\mu\epsilon \mathbf{E}
\end{split}
\end{align*}
$$

Which simplifies to:

$$\mathbf{E} = -\frac{1}{\mu\epsilon}\frac{k}{\omega} \mathbf{n} \times \mathbf{B}$$

Let's take the cross of the normal with the magnetic field:

$$
\begin{align*}
\begin{split}
	\mathbf{n} \times \mathbf{B} &= \frac{k}{\omega} \mathbf{n} \times (\mathbf{n} \times \mathbf{E}) \\
	&= -\frac{k}{\omega} \mathbf{E}
\end{split}
\end{align*}
$$

With a little algebraic manipulation and equating to the above we find:

$$\frac{k^2}{\omega^2} = \mu\epsilon = \frac{1}{v^2}$$

$$\implies k = \frac{\omega}{v}$$

This tells us that the wave number is proportional to the frequency, and inversely proportional to the velocity at which the wave propagates (determined by the medium).

From Maxwell's equations we have shown that electromagnetic waves propagate at a speed of $v = \frac{1}{\sqrt{\mu\epsilon}}$ with the electric and magnetic field vectors transverse to the propagation direction. I find this entire topic fascinating as EM radiation is something that is all around us yet we only see such a small portion of it. We as humans have learned how to use this to our advantage to send information across the world, and even out into space!
