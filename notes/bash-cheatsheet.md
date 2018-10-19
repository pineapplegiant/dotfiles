# Notes on Bash
**[Taken from bash academy!]("https://guide.bash.academy/inception/")**

tl;dr just go to the bash academy if u wanna learn stuff

## Bash is basically a program on your computer, that's *easy* to talk to 

It's a shell. It can do *things*:

            Read files, start programs, math, control shit. It's a shell program, and more than that, it's a shell programming language. It allows you to interact with your system via text.

There are  other shells too:

* C shell
* Z shell(zsh)
* Korn shell (ksh)
* Friendly-interactive shell (fish)
* cmd.xe


## What's bash *exactly* ?

Bash is a simple executable program. It's usually located on one of your system's binary diretories.

A binary is an executable program that contains "binary code" which is executed directly by the system's kernel.
If you're running a system that does not ship with bash pre-installed, such as FreeBSD or Windows, you'll need to either use a distribution platform to download and install it, or obtain bash's source code and build the binary yourself.
FreeBSD users can use ports, Windows users can use  cygwin, but there are alternative distributions.

## Two modes:
1) Interactive - You give it a command, you wait, then it spits something out.

2) Non-interactive - Scripts! Generally saved in files.

            Each time a program is started, the system creates a running process for it. Processes have plugs, called file descriptors which allow them to connect streams that lead to files, devices or other processes.

## File Descriptor:

* File Descriptor 0 - Standard input: Your keyboard
* File Descriptor 1 - Standard output: Your display
* File Descriptor 2 - Standard error: Still your display, essentially.


## Commands

If 

