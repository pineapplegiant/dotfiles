# Setup

# .macos

This is meant to help bootstrap my home nvim setup with the latest macosx. It'd be nice to have something for linux and Windows one, but c'est la vie.

It's not as sexy as I'd want. It's not using nix-env or home manager. It's not using ansible.
There's even some symlinking of .profile, .zprofile, and alacritty into the the right places (gross).

The `Brewfile` contains the tools I use the most (tmux, nvim, exa, tldr), but could probably use some cleaning.


## Brewfile

1. To update the Brewfile run:
`brew bundle dump`

2. To install from Brewfile run:
`brew bundle`


```bash
.
├── .mac-os-setup
├── Brewfile
└── README.md

1 directory, 3 files
```


## Git setup

[Sign commits](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits)

```bash
    gpg --list-secret-keys --keyid-format=long
```

## Some other things

```bash
    pip3 install -U gay
```
