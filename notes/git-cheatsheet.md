# Git Cheatsheet:

> This document is intended for people who suffer from chronic lower back pain and the occasional bacterial scoliotic menigiosis ... I just made that-up that last thing. It's really just notes about git. 


> "Git is the open source distributed version control system that facilitates GitHub activites on your laptop or desktop.

## Install git:

[Download git!](https://git-scm.com/downloads)

# Basics:

## Configure Git
            $ git config  --global user.name "[name]"           --> Sets the name you want attached to your commits
            $ git config  --global user.email "[email address]" --> Sets the email you want attached to your commits
            $ git config  --global color.ui auto                --> Enables helpful colorization of command line output

## Create repositories
            $ git init [project-name] --> Creates new local repository with the specified theme
            $ git clone [url]         --> Downloads a project and its entire version history

## Make changes
            $ git status  --> Lists all new or modified files to be committed 
            $ git diff    --> Shows all the file differences not yet staged
            $ git diff    --> Shows all the file differences not yet staged

## Group Changes

            $ git branch                                --> Lists all local branches in the current repository
            $ git branch[branch-name]                   --> Creates a new branch
            $ git checkout [branch-name]                --> Switches to the specified branch and updates the working directory
            $ git merge [branch]                        --> Combines the specified branch's history into the current branch
            $ git branch -d [branch-name]               --> Deletes the specified branch
            $ git branch -m oldBranchName newBranchName --> Rename a branch while currently not in the branch to be renamed:


# More interesting things:

## Refactor filenames
            $ git rm [file]                         --> Shows all the file differences not yet staged
            $ git rm --cached [file]                --> Removes the file from version control but preserves the file locally.
            $ git mv [file-original] [file-renamed] --> Changes the file name and prepares it for commit

## Suppress Tracking -> .gitignore file suppresses accidental versioning of files & paths
            *.log
            build/
            temp

`$ git ls-files --other --ignored --exclude-standard`

## Save Fragments
            $ git stash       --> Temporarily stores all modified tracked files
            $ git stash pop   --> Restores the most recently stashed files
            $ git stash list  --> List all stashed changesets
            $ git stash drop  --> Discards the most recently stashed changeset

## Review History 
            $ git log                                   --> Lists all version history for the current branch
            $ git log                                   --> Lists version history for a file, including renames
            $ git diff [first-branch]...[second-branch] --> Shows contents differences between two branches
            $ git show [commit]                         --> Outputs metadata and content changes of the specified commit
            
## Redo commits
            $ git reset [commit]        --> Undoes all commits after [commit] preserving changes locally
            $ git reset --hard [commit] --> Discards all the history and changes back to the specified commit

## Syncronize Changes
            $ git fetch [bookmark]          --> Downloads all history from the repository bookmark
            $ git merge [bookmark]/[branch] --> Combines bookmark's branch into the current local branch
            $ git push [alias] [branch]     --> Uploads all local branch commits to GitHub 
            $ git pull                      --> Downloads bookmark history and incorporates changes



There's always the [comprehensive book thing](https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control) if you're unsure of what you're doing.


Also if you want chill open-source projects search this in Github: 

```label:first-timers-only is:open```

[http://up-for-grabs.net/#/tags/python
](http://up-for-grabs.net/#/tags/python)



# "Notes"

The rest is just notes i took way back when on trying to learn git. Nothing fancy, really. 

### Git vs Github:

        Git is a version control system.
        Git is the tool you use command line utility
        GitHub is the online repository that hosts the code
        Repo = Repository
        Commit = The basis for git. Saved versions of your project/directory, whatever you're tracking.

Git stores everything in this .git/ directory. It's *powerful* stuff. It's a folder with a bunch of stuff.   It's hidden, which is what files with the "." in the beginning hide from you.

Git uses a "SHA" to save everything. It's basically a long ass sequence of numbers and shit that gives everything this "special number" and special ID.

> Also did you know that cows can't walk downstairs, but they can walk upstairs.

### There are 3 main areas in git:

1) Working Directory - Place you're working, with all of your files.
2) Staging Directory - Place you add your changes.
3) Repository - Place where all the commits are stored. Literally. All of them since the start of the project.
 

### Git uses the 'Less navigation' Scheme 

	So for scrolling:
		Up = k and U or B
		Down = J and D or F


### Make sure you configure git too! 

You can do this a few ways. And you can *really* go all out with it too. You can do it globally, per project basis, or at a system level if you're weird idk.

1) Use the command line

            $ git config --global user.name "Your Weirdname"
            $ git config --global user.email weirdname@example.com-user.name="Yourweirdname"

2) Just configure the file yourself. It can look something like this.

        Global .gitconfig file. (Usually it's in ~/.gitconfig)
        [user]
            name = Your Weirdname
            email = weirdname@example.com

        [core] 
            excludesfile = location/ofyour/.gitignore_global


## Colloborating:

### Remotes are really cool too. 

Remotes are like branches, except it's you use them to push your changes to like github or somewhere (Narnia?).
It's used for sharing.


"HEAD" refers to (**#whaturmomgavemelastnite**) your current status in the repository.
            git remote - manage remote repository
            git remote -v -- basically tells you the URL for the repository's remote

**git remote add upstream - This is what you'll use on the original dude's repo. 

The "SOURCE" Repository. What if they updates their codes? Your forked version will be a forked version of the old shit. You'll want to fetch the original dude's repo and then commit it to your brance via that upstream remote.

Remember that the names origin and upstream are just the default or de facto names that are used. If it's clearer for you to name your origin "remote mine" and the upstream remote "source-repo", then by all means, go ahead and rename them. What you name your remote repositories in your local repository does not affect the source repository at all.
Did you know the Romans used to whiten their teeth with urine. It worked. Pls don't do it.

            git remote add <origin> <url> - This is what you'll use on your forked version of the repo.

Note that when you've added a connection to the new upstream remote repository, if you run git fetch upstream master it won't update your forked shit on github.
git push - send changes to the your forked remote repository
git push <remote-shortname> <branch> -Sending Commmits!
 
 
 
# Git Commands (Finally)
Also: You can make Aliases (shortened versions of your commands by editing your .gitconfig file, I suggest this!)

### Next level: FLAGS!

NOTE: Flags are just little addons to commands that make the commands enhanced stuff.

            git log -p (short for -patch. shows everything, even differences, so it's like it all in one)
            git log --oneline (shows one line, very useful)
            git log -2 (shows two things)
            git log -w

## HOLY GRAIL COMMANDs

            git log --oneline --decorate --graph --all
            git shortlog --group commits by author
            git shortlog -s -n  -- Ranks number of commits by author
            git log --author=<author>  -- Number of commits by that author
            git log --grep="string" --filter commits using the grep flag


### Misc shortcuts:
            git commit -a (Adds everything you have that's been changed and commits all that you've added, saves you a step!)


### Undoing Changes:
            git commit --amend - (alter the most recent commit, like if you had a typo)
            git revert <SHA-of-commit-to-revert> - reverse given commit, so all lines in that commit are reversed. lines added are deleted
            git reset - deletes commit in order **Resetting Is Dangerous**
                If you messup, DON"T WORRY GIT SAVES THINGS FOR 30 DAYS
            git reflog - will let you look at the commits you deleted or whatever

### Relative Commit References:
– the following indicate the parent commit of the current commit:

HEAD^
HEAD~
HEAD~1

- The grandparent commit – the following indicate the grandparent commit of the current commit
HEAD~2
HEAD^^


### Undoing Changes with Flags:
        git reset --mixed Head~1 - moves the previous commit & changes to the working index
        git reset --soft Head~1 - moves the previous commit & changes to the staging index
        git reset --hard Head~1 - moves the previous commit & changes to the trash

### Working with other Devs:
Forking: To split it into an identical copy -- like a fork in the road, but an identical road subl
	-Provided by Github and you're an owner of that copy


### FORCE PUSH:

            git push -f origin
            git pull - retrieve updates from the remote repository & AUTOMATICALLY MERGES your branch
            git fetch - retrieve updates from remote repo BUT DOESN'T MERGE YOUR CHANGES with the ones done on the remote.


### Powerful SQUASHING git command that could fuck up yo shit but is very helpful to clean things up:

git rebase -i HEAD~n -- this command will change all the commits into one commit. Just in case you mess up. It's suggested you make a new branch call it "backup" or whatever, just to make sure you don't mess up everything.

Inside the interactive list of commits, all commits start out as pick, but you can swap that out with one of the other commands (reword, edit, squash, fixup, exec, and drop):

            use p or pick – to keep the commit as is
            use r or reword – to keep the commit's content but alter the commit message
            use e or edit – to keep the commit's content but stop before committing so that you can:
            add new content or files
            remove content or files
            alter the content that was going to be committed
            use s or squash – to combine this commit's changes into the previous commit (the commit above it in the list)
            use f or fixup – to combine this commit's change into the previous one but drop the commit message
            use x or exec – to run a shell command
            use d or drop – to delete the commit


## Github change name of repo

```git remote set-url origin new_url```
