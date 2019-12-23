---
layout: post
title:  "An Efficient Workflow"
date:   2019-12-22 12:00:00
categories: programming
---

One of the most important things you can do to be more productive is to make using your environment as efficient as possible.
In this blog post I will talk about my current setup and what I have done to increase efficiency.

This post isn't intended to be a full guide, rather a rough outline.
If there's something in here that you haven't heard of or want to learn more about, I encourage you to search the web for it, as most of the stuff mentioned here has excellent documentation.

# My OS of Choice
I usually run the latest release of Fedora Linux as I find it to be a nice balance between stability and cutting edge.
The reason I use Linux is because I am a fan of open source and customizability.
Linux is also (IMO) the best for programming and software development because of how easy it is to install required packages.
Now before that starts a flame war, I must say that it doesn't really matter which OS you use as long as you know how to use it.
I have used a multitude of Linux distros over the years; Fedora is what stuck with me on the desktop, and Debian is what I use on servers.

# From Desktop Environment to Window Manager
What's much more important than the distro itself is the desktop environment or window manager that you use with it.
I was a long time XFCE user because of how lightweight and quick it is, but I have recently switched to i3 window manager, and plan to move to Sway when Wayland goes mainstream.
The goal here is to minimize the number of keystrokes it takes to switch between applications/projects, and doing so in a methodical manner.
The reason I like window managers is because they help you easily configure your workspaces in a way such that every window is a few keystrokes away.

# Scripting for Reproducibility
Scripting is a very useful tool to have in your toolbox due to the efficiency and reproducibility.
If there is something that you foresee doing multiple times then it is probably something you should write a script for (e.g. bash or Python).
One of the most useful scripts I have is one that configures my OS from the base install to about 90% of the way I want it, which saves me a great deal of time when I need to reinstall or install on a new computer.
Another script runs on a cron job and backs up all of my important configuration files.
It's not a necessity, but it is a nice peace of mind knowing that if your computer suffers a catastrophic event (e.g. drive failure, theft, etc.) that you do not lose more than the hardware itself and maybe a few hours worth of work (always back up your work offsite!).

# Workspaces for Separation of Projects/Applications
Workspaces are another thing everyone should take advantage of.
Being able to group applications by project makes it easy to keep work for multiple projects open on different workspaces and switch between them with much less confusion and distractions.
I also find it extremely useful to group certain types of applications onto their own workspaces, e.g. I group my communications (Signal, Slack, etc.) on their own workspace as to keep them separate from whatever I'm currently working on.

# Terminal Transcendence
An extremely useful tool that I can't recommend enough is tmux (short for terminal multiplexer).
tmux allows us to create advanced terminal sessions with windows and panes that can run detached and persist even if you have closed the terminal window within your desktop environment/window manager.
These are handy when working on remote servers because in the case you are disconnected from the server your tmux session will still be running and there for you when you reconnect.
I find it best to have separate projects in different tmux sessions; this works well as long as you are in the habit of naming your sessions/windows descriptively.
Coming back to a long running tmux session where your work is exactly the way you left it is immensely satisfying and time saving.

# Programming Environments
As far as my actual programming environment goes I use a combination of vim and Atom (with vim key bindings).
I use Atom for larger projects and anything I need to be interactive with (checkout the Hyrdogen package).
Unfortunately, Atom can be a bit clunky at times (especially starting up) so I use vim for quick edits and modifying something when I'm already in a terminal.
vim's keybindings are something I think everyone would benefit from learning, because once you have them down they can help you do a lot more in less keystrokes.

My languages of choice are Python and Julia, and for Python I highly recommend conda and conda environments for separating projects, then I will manually install Julia within those environments.
It's extremely important to keep your environments reproducible, and conda really helps with that because you can export and import the environments with ease using .yml files.

# Wrapping Up
All together the tools I've mentioned in this post help me achieve a level of working efficiency that I am quite satisfied with which allows me to spend more time focusing on the task at hand and I hope that reading this helps you increase your working efficiency!
