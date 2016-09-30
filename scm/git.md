Good Stackoverflow git questions:

What exactly does git’s “rebase —preserve-merges” do (and why?) http://stackoverflow.com/questions/15915430/what-exactly-does-gits-rebase-preserve-merges-do-and-why

Generate a git patch for a specific commit 
http://stackoverflow.com/questions/6658313/generate-a-git-patch-for-a-specific-commit

Count number of lines in a git repository 
http://stackoverflow.com/questions/4822471/count-number-of-lines-in-a-git-repository


What's the difference between git clone --mirror and git clone --bare
http://stackoverflow.com/questions/3959924/whats-the-difference-between-git-clone-mirror-and-git-clone-bare

How to update a git clone --mirror?
http://stackoverflow.com/questions/6150188/how-to-update-a-git-clone-mirror

Checkout remote branch using git svn
http://stackoverflow.com/questions/3239759/checkout-remote-branch-using-git-svn

Undo a Git merge that is pushed?
http://stackoverflow.com/questions/2389361/undo-a-git-merge/6217372#6217372

Deleting branches in git causes gitk to go wild
http://stackoverflow.com/questions/2182334/deleting-branches-in-git-causes-gitk-to-go-wild

What is the format of an authors file for git svn, specifically for special characters like backslash or underscore?
http://stackoverflow.com/questions/2159567/what-is-the-format-of-an-authors-file-for-git-svn-specifically-for-special-char

Making git “forget” about a file that *was* tracked but is now “.gitignored”
http://stackoverflow.com/questions/1274057/making-git-forget-about-a-file-that-was-tracked-but-is-now-gitignored

Number of commits in a git repository
http://stackoverflow.com/questions/1199312/number-of-commits-in-a-git-repository

Make .gitignore ignore everything except a few files
http://stackoverflow.com/questions/987142/make-gitignore-ignore-everything-except-a-few-files

Restore a deleted file in a Git repo
http://stackoverflow.com/questions/953481/restore-a-deleted-file-in-a-git-repo

How to merge a specific commit in git
http://stackoverflow.com/questions/881092/how-to-merge-a-specific-commit-in-git

How do I change the author of a commit in git?
http://stackoverflow.com/questions/750172/how-do-i-change-the-author-of-a-commit-in-git

How to git-svn clone the last n revisions from a Subversion repository?
http://stackoverflow.com/questions/747075/how-to-git-svn-clone-the-last-n-revisions-from-a-subversion-repository

Web interface for Git repositories? [closed]
http://stackoverflow.com/questions/438163/web-interface-for-git-repositories

Detach subdirectory into separate Git repository
http://stackoverflow.com/questions/359424/detach-subdirectory-into-separate-git-repository

What's the difference between 'git pull' and 'git fetch'?
http://stackoverflow.com/questions/292357/whats-the-difference-between-git-pull-and-git-fetch

How to do a “git export” (like “svn export”)
http://stackoverflow.com/questions/160608/how-to-do-a-git-export-like-svn-export

Removing untracked files from your Git working copy
http://stackoverflow.com/questions/61212/removing-untracked-files-from-your-git-working-copy

What's the difference between 'git reset' and 'git checkout'?
http://stackoverflow.com/questions/3639342/whats-the-difference-between-git-reset-and-git-checkout

How do I edit an incorrect commit message in Git?
http://stackoverflow.com/questions/179123/how-do-i-edit-an-incorrect-commit-message-in-git

Whats the difference between git reset --mixed, --soft, and --hard?
http://stackoverflow.com/questions/3528245/whats-the-difference-between-git-reset-mixed-soft-and-hard

How do you make an existing Git branch track a remote branch?
http://stackoverflow.com/questions/520650/how-do-you-make-an-existing-git-branch-track-a-remote-branch

How do I add an empty directory to a git repository
http://stackoverflow.com/questions/115983/how-do-i-add-an-empty-directory-to-a-git-repository

Revert to previous Git commit
http://stackoverflow.com/questions/4114095/revert-to-previous-git-commit

Force git to overwrite local files on pull
http://stackoverflow.com/questions/1125968/force-git-to-overwrite-local-files-on-pull

Removing multiple files from a Git repo that have already been deleted from disk
http://stackoverflow.com/questions/492558/removing-multiple-files-from-a-git-repo-that-have-already-been-deleted-from-disk

View the change history of a file using Git versioning
http://stackoverflow.com/questions/278192/view-the-change-history-of-a-file-using-git-versioning

How do you discard unstaged changes in git?
http://stackoverflow.com/questions/52704/how-do-you-discard-unstaged-changes-in-git

Showing which files have changed between git branches
http://stackoverflow.com/questions/822811/showing-which-files-have-changed-between-git-branches



http://www.cnblogs.com/lhb25/p/10-useful-advanced-git-commands.html


Advanced Git from github:
https://help.github.com/categories/52/articles

Good tutorial from Atlassian:
https://www.atlassian.com/git/tutorial


Remove untracked files from the working tree:

    #dry-run
    git clean -n
    #force delete
    git clean -f
  
git patch and apply:

    <code>
        #create patches 0001, 0002.. beginning from <sha1>, not include that hash
        git format-patch <sha1>
        #test apply a patch, 
        git apply --check <path to patch>
        #apply a patch
        git apply <patch to patch>
    ref :http://ariejan.net/2009/10/26/how-to-create-and-apply-a-patch-with-git/

    git create a branch from tag:
    git co -b newbranch v1.0

    clean un-tracked files and folders
    git clean -f -d

    Rename a local branch:
    git branch -m <oldname> <newname>

    Diff a file between branches:

    git diff mybranch master -- myfile.cs

    Delete a remote branch:
    git push origin --delete branchname

    List remote tags:
    git ls-remote --tags

    Fix last commit message:
    git commit --amend -m "New commit message"

    Push and track a branch to a remote:
    git push -u origin <branch-name>

    Only show changed file names:
    git --name-only

    Create meaning full build number:
    git describe


    Convert mercurial repo to git repo:
    cd ~/Desktop
    git clone git://repo.or.cz/fast-export.git
    git init git_repo
    cd git_repo
    ~/Desktop/fast-export/hg-fast-export.sh -r /path/to/old/mercurial_repo

    git checkout HEAD
    Git generate patches since commit abcdeftg (not including this commit)

    git format-patch abcdeftg
    git format-patch -o ../ --ignore-space-at-eol abcdeftg
    Remove untraced files from working tree
    git clean -f
    apply a patch
    git am --ignore-whitespace <../aaa.patch
    Go back one commit
    git reset --hard HEAD~1
    Reset the working copy
    git reset --hard HEAD

    remove a remote branch
    git branch -d -r branchname

    reselect commits to rebase. Commits from commit xxxx will be put in a list and can be kicked out.
    git rebase -i xxxx^

    push tags
    git push --tags

    delete a tag, both local and remotely
    git tag -d 12345
    git push origin :refs/tags/12345

    </code>

My .gitconfig:

    <code>
    [core]
        editor = emacs
        autocrlf = input

    [diff]
        tool = xxdiff
    [color]
        ui = auto
    [user]
        name = Jifeng Zhang
        email = jifeng.zhang@tradedoubler.com

    [alias]
        ci = commit
        co = checkout
        br = branch
        df = diff
        lg = log -p
        st = status
        who = shortlog -s --
        undo = reset --hard
        pl = pull --rebase
        graph = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --
        #graphall = log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"
        graphall = log --color --graph --full-history --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --
        dlog = log --oneline --decorate
        unstage = reset HEAD --
    [push]
        default = tracking
    [credential]
        helper = cache --timeout=36000000
    [http]
        sslVerify = false
    </code>

git svn:

Clone from a revison till HEAD:
  
    git svn clone -s -r172760:HEAD <url> <localname>
