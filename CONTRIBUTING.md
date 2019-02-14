# Contributing Guide

## How to contribute

Work In Progress, for now the minimum:

* Fork the project and submit a Pull Request (PR)
  * Explain what the PR fixes or improves
  * Screenshots for bonus points
* Use sensible commit messages
  * If your PR fixes a separate issue number, include it in the commit message

## Things to keep in mind
* Smaller PRs are likely to be merged more quickly than bigger changes
* If it is a useful PR it **will** get merged in eventually
  * [E.g. see how many have already been merged vs. still open](https://github.com/ryanoasis/vim-devicons/pulls)
* This project is using [Semantic Versioning 2.0.0](http://semver.org/)
* I try to group fixes into milestones/versions
  * If your bug or PR is *not* trivial it will likely end up in the next **MINOR** version
  * If your bug or PR *is* trivial *or* critical it will likely end up in the next **PATCH** version
* Most of the time PRs and fixes are *not* merged directly into `master` without being present on a new versioned branch
  * Sometimes for small items I will make exceptions to get the fix or readme change on master sooner but even after there will *always* be a versioned branch to keep track of each release
