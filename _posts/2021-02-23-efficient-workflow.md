---
layout: post
title:  "An Efficient Workflow (Updated)"
date:   2021-02-23 12:00:00
categories: programming
---

One of the most important things you can do to be more productive is to make using your working environment as efficient as possible.
In this blog post I will talk about my current setup and what I have done to increase efficiency.

This post isn't intended to be a full guide, rather a rough outline.
If there's something in here that you haven't heard of or want to learn more about, I encourage you to search the web for it, as most of the stuff mentioned here has excellent documentation.

## My OS of Choice
I usually run the latest release of Fedora Linux as I find it to be a nice balance between stability and cutting edge.
The reason I use Linux is because I am a fan of open source and customizability.
Linux is also, in my opinion, the best OS for programming and software development because of how easy it is to install required packages.
Now before that starts a flame war, I must say that it doesn't really matter which OS you use as long as you know how to use it.
I have used a multitude of Linux distros over the years; Fedora is what stuck with me on the desktop, and Debian is what I use on servers.

My Fedora desktop setup can be seen [here](https://github.com/cameronperot/fedora-setup), and my Debian server setup can be seen [here](https://github.com/cameronperot/server-setup).

## From Desktop Environment to Window Manager
What's much more important than the distro itself is the desktop environment or window manager that you use with it.
I was a long time XFCE user because of how lightweight and snappy it is, then i3 window manager for a few years, and now sway window manager.
The goal is to minimize the number of keystrokes it takes to switch between applications/projects, and doing so in a methodical manner.
The reason I like window managers is because they help you easily configure your workspaces in a way such that every window is a just few keystrokes away.

Workspaces are another thing everyone should take advantage of.
Being able to group applications by project makes it easy to keep work for multiple projects open on different workspaces and switch between them with much less confusion and distractions.
I also find it extremely useful to group certain types of applications onto their own workspaces, e.g. I group communications (Signal, Slack, etc.) together on their own workspace as to keep them separate from whatever I'm currently working on.

Within sway I can navigate between workspaces using `sway_mod_key + sway_workspace_key`, and between the two previous workspaces using `sway_mod_key + tab`.
Within workspaces I can navigate between windows using `sway_mod_key + {h, j, k, l}`, and move the windows around within the workspace using `sway_mod_key + shift + {h, j, k, l}` and between workspaces using `sway_mod_key + shift + sway_workspace_key`.

My sway config can be seen [here](https://github.com/cameronperot/environment-setup/blob/main/dotfiles/.config/sway/config).

## Terminal Transcendence
For my shell I use zsh with oh-my-zsh and antigen plugin manager.

An extremely useful tool that I can't recommend enough is tmux (short for terminal multiplexer).
tmux allows us to create advanced terminal sessions with windows and panes that can run detached and persist even if you have closed the terminal window within your desktop environment/window manager.
These are handy when working on remote servers because in the case you are disconnected from the server your tmux session will still be running and there for you when you reconnect.
I find it best to have separate projects in different tmux sessions; this works well as long as you are in the habit of naming your sessions/windows descriptively.
Coming back to a long running tmux session where your work is exactly the way you left it is immensely satisfying and time saving.

Within tmux I can navigate between sessions by using `tmux_prefix + s` then selecting the session I wish to go to.
Within a session I can navigate between windows by using `tmux_mod_key + tmux_window_key`, and between the two previous windows with `tmux_mod_key + tab`.
Within a window I can navigate between panes using `tmux_mod_key + {h, j, k, l}`.

I also use ranger as a terminal based file manager, you can see my config [here](https://github.com/cameronperot/environment-setup/tree/main/dotfiles/.config/ranger).

My zsh config can be seen [here](https://github.com/cameronperot/environment-setup/blob/main/dotfiles/.zshrc), my tmux config can be seen [here](https://github.com/cameronperot/environment-setup/blob/main/dotfiles/.tmux.conf), and my ranger config can be seen [here](https://github.com/cameronperot/environment-setup/blob/main/dotfiles/.config/ranger/rc.conf).

## A Powerful Editor
For my editor I use neovim because I find the vi keybindings to be extremely efficient to navigate with.
Neovim has come a long way since it was first released, and has an amazing plugin ecosystem due to the successful integration of Lua.
Having a terminal based editor allows me to use the same editor both locally and remotely.

My neovim config can be seen [here](https://github.com/cameronperot/environment-setup/blob/main/dotfiles/.config/nvim/).

## Scripting for Convenience and Reproducibility
Scripting is a very useful tool to have in your toolbox, plays a key role in reproducibility, and makes a lot of things significantly more convenient.
If there is something that you foresee doing multiple times then it is probably something you should write a script for (e.g. bash or Python).
I prefer to use bash scripts most of the time when working with OS level components, and Python scripts when I'm working on something more complicated and need advanced logic.

My collection of useful shell scripts can be seen [here](https://github.com/cameronperot/shell-scripts/).

## Programming Environments
My languages of choice are Python and Julia.
For Python I recommend using [micromamba](https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html) and [uv](https://docs.astral.sh/uv/).
It's extremely important to keep your environments reproducible, and micromamba and uv help make that fairly seamless.
For Julia I recommend using the built-in environment management capabilities.

My programming environment setups can be seen [here](https://github.com/cameronperot/programming-environment-setup/).

## Quick Setup
Sometimes I find myself working on a remote server, and the most important thing for me is getting my environment up and running quickly with minimal effort.
Therefore, I created a repo which I use to quickly install and configure my environment which can be seen [here](https://github.com/cameronperot/environment-setup/).

## Wrapping Up
All together the tools I've mentioned in this post help me achieve a level of working efficiency that I am quite satisfied with allowing me to spend more time focusing on the task at hand.
I hope that reading this helps give you some ideas on how to increase your working efficiency!
