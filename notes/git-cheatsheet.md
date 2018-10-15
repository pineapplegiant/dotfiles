# Git NOTES:

> This document is intended for people who suffer from chronic lower back pain and the occasional bacterial scoliotic menigiosis . I just made that-up that last thing.


This is just meant to be a shitty cheat sheet to print out and have posted in your lonely-ass cubicle somewhere. 


Also if you want chill open-source projects search this in Github: 

```label:first-timers-only is:open```

[http://up-for-grabs.net/#/tags/python
]("http://up-for-grabs.net/#/tags/python")

### SIDE NOTE:

[Download git!](https://git-scm.com/downloads)

### Git vs Github:
        Git is a version control system.
        Git is the tool you use command line utility
        GitHub is the online repository that hosts the code
        Repo = Repository
        Commit = The basis for git. Saved versions of your project/directory, whatever you're tracking.



Git stores everything in this .git/ directory. *It's powerful stuff. It's a folder with a bunch of stuff in it. It's hidden, which is what files with the "." in it show.

Git uses a "SHA" to save everything. It's basically a long ass sequence of numbers and shit that gives everything this "special number" and special ID.

> Also did you know that cows can't walk downstairs, but they can walk upstairs.


### Git uses the 'Less navigation' Scheme 

	So for scrolling:
		Up = k and U or B
		Down = J and D or F

Make sure you configure git too! So it knows what to do. Like with your favorite text editor and all. Basically you can do this by finding your ".gitconfig" file. OR, by just using git config --user.name="Yourweirdname" and stuff. Google git config and it'll help!
So there's this thing called branches.
Female kangaroos have 3 vaginas.
Uhm, branches are just versions of your project that you deal with and make if you don't wanna mess everything up.
Usually the name of the game is 1) You have your main project that's sexy.  2) You want to add something that could be potentially not sexy at all. So how do you reconcile this? You make a branch biiiitch. That way you keep your sexy code and you can eat it too. Yes git is that cool.
Branches are really cool.
Remotes are really cool too. Remotes are like branches, except it's you use them to push your changes to like github or somewhere (Narnia?)
It's used for sharing.
"HEAD" refers to (#whaturmomgavemelastnite) where you're at in the repository.

			There are 3 main areas in git:
* Working Directory - Place you're working, with all of your files.
* Staging Directory - Place you add your changes.
* Repository - Place where all the commits are stored. Literally. All of them since the start of the project.

Then when you level up, you'll see that branches are so useful. AND then, you'll see that remotes are basically just branches on github. Branches are your friend. So on to the git commands..
***************************************
Preface: Anything with the asterisk "*" is your bread & butter commands.
Also: You can make Aliases (shortened versions of your commands by editing your .gitconfig file, I suggest this!)

			Introduction:
git init - brand new repo on computer
git clone - copy existing repo over onto ur shit
git status - check status of the repo
git add . - adds things to your staging directory
git commit - adds things from your staging directory to your repository
	git commit -m "Message" (the -m flag skips your favorite)

			Basics:
git log - shows ALL of the commits ever. You gotta scroll a lot if u gotta a lot of commits.
git show - shows DIFFERENCE between the versions of each commit
**git diff - Shows CURRENT difference between your working directory and the last commit. This command along with git log & git status will be your slut commands.

			Next level: FLAGS!
NOTE: Flags are just little addons to commands that make the commands enhanced stuff.
**git log -p (short for -patch. shows everything, even differences, so it's like it all in one)
**git log --oneline (shows one line, very useful)
git log -2 (shows two things)
git log -w

*************************************************************************************
			***Okay here are my HOLY GRAIL COMMANDs:***
git log --oneline --decorate --graph --all
git shortlog --group commits by author
git shortlog -s -n  -- Ranks number of commits by author
git log --author=<author>  -- Number of commits by that author
git log --grep="string" --filter commits using the grep flag

*************************************************************************************

			Misc shortcuts:
git commit -a (Adds everything you have that's been changed and commits all that you've added, saves you a step!)


			Branches:
git branch <name of branch> - creates a new branch of your project under that name.
git checkout <name of branch> - switches into that branch so you can do stuff!
git reset --hard - tells the branch to not be created
git merge <name of branch> - this merges the branch with the existing main branch. Merging isn't that hard don't freak out.
	Note: if there are conflicts git won't merge the branches, unless you ignore it. So it'll still kinda do it. Git will show you where the conflicts are by adding these bracket things: "<<<" around the conflict. If you're uncertain where it is just search for that sequence, the "<<<".

			Undoing Changes:
git commit --amend - (alter the most recent commit, like if you had a typo)
git revert <SHA-of-commit-to-revert> - reverse given commit, so all lines in that commit are reversed. lines added are deleted
git reset - deletes commit in order **Resetting Is Dangerous**
	If you messup, DON"T WORRY GIT SAVES THINGS FOR 30 DAYS
git reflog - will let you look at the commits you deleted or whatever


			Relative Commit References:
– the following indicate the parent commit of the current commit:
HEAD^
HEAD~
HEAD~1
- The grandparent commit – the following indicate the grandparent commit of the current commit
HEAD~2
HEAD^^


			Undoing Changes with Flags:
git reset --mixed Head~1 - moves the previous commit & changes to the working index
git reset --soft Head~1 - moves the previous commit & changes to the staging index
git reset --hard Head~1 - moves the previous commit & changes to the trash


			Working with other Devs:
Forking: To split it into an identical copy -- like a fork in the road, but an identical road subl
	-Provided by Github and you're an owner of that copy


			Colloborating:
git remote - manage remote repository
git remote -v -- basically tells you the URL for the repository's remote
**git remote add upstream - This is what you'll use on the original dude's repo. The "SOURCE" Repository. What if they updates their codes? Your forked version will be a forked version of the old shit. You'll want to fetch the original dude's repo and then commit it to your brance via that upstream remote.
Remember that the names origin and upstream are just the default or de facto names that are used. If it's clearer for you to name your origin "remote mine" and the upstream remote "source-repo", then by all means, go ahead and rename them. What you name your remote repositories in your local repository does not affect the source repository at all.
Did you know the Romans used to whiten their teeth with urine. It worked. But don't pls do it.
**git remote add <origin> <url> - This is what you'll use on your forked version of the repo.
Note that when you've added a connection to the new upstream remote repository, if you run git fetch upstream master it won't update your forked shit on github.
git push - send changes to the your forked remote repository
git push <remote-shortname> <branch> -Sending Commmits!

		FORCE PUSH:
git push -f origin

git pull - retrieve updates from the remote repository & AUTOMATICALLY MERGES your branch
git fetch - retrieve updates from remote repo BUT DOESN'T MERGE YOUR CHANGES with the ones done on the remote.

	Powerful SQUASHING git command that could fuck up yo shit but is very helpful to clean things up:
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
