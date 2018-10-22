# Notes on Bash
**[Taken from bash academy!](https://guide.bash.academy/inception/)**

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


## PATH to a program

On a standard UNIX system, there are a few standardized locations for programs to go.
Some programs will be installed in /bin, others in /usr/bin, yet others in /sbin and so on. 
It would be a real bother if we had to remember the exact location of our programs, especially since they may vary between systems. 
To the rescue comes the PATH environment variable. 
Your PATH variable contains a set of directories that should be searched for programs.

You can find the location of a command with the *type* command.

```$ type -a ping```

Bash only performs a PATH search on command names that do not contain a / character.
Command names with a slash are always considered direct pathnames to the program to execute.

## Quoting Literals

If you want to not have things messy, use literals.

**Note** Bash differentiates between single quotes and double quotes. Double quotes allow more freedom in including variables. 

 
> The golden rule on quoting is very simple:
> If there is whitespace or a symbol in your argument, you must quote it.
> If there isn't, quotes are usually optional, but you can still quote it to be safe.
> The golden rule on quoting is very simple:
> If there is whitespace or a symbol in your argument, you must quote it.
> If there isn't, quotes are usually optional, but you can still quote it to be safe.

An example of a good way to quote literals is such:
```$ rm -vr "/home/$username"```

## Redirection


## Pathname Expansion
            $ cd ~/Downloads
            $ rm -v *
            removed '05 Between Angels and Insects.ogg'
            removed '07 Wake Up.ogg'
            $ ls

tl;dr

* star is the wildcard symbol, tilde is the home directory symbol. 
            $ echo "The file <hello.txt> contains: $(cat hello.txt)"
            The file <hello.txt> contains: Hello world.
