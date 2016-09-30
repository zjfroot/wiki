====== Mercurial/hg======

hg pull does not update subrepos automatically by default, but use `hg pull -u` will trigger it

>Notably, the 'pull' command is by default not recursive. This is because Mercurial won't know which subrepos are required until an update to a specific changeset is requested. The update will pull the requested subrepositories and changesets on demand. To get pull and update in one step, use 'pull --update'.

http://mercurial.selenic.com/wiki/Subrepository#Pull

To display recent commit and diff:

  hg tip -vp
  
Check the incoming changeset from central repo:
  hg incoming

Check what changes will be pushed:
  hg outgoing
  
How many heads (commit without parent) do I have?
  hg heads
  
Missing files. Deleted manually, want to remove it from hg?
  hg remove --after path/to/file

Missing files, deleted manually, want to bring it back?
  hg revert path/to/file
  
Add untracked files, deleted missing files:
  hg addremove
  
Diff that shows renames:
  hg diff -g
  
Like git bare repo?
  hg clone -U
  
Create a new branch in repo:
  hg branch foo

switch to a branch:
  hg update bar
  
How hg revert works:
  * If you modify a file, it will restore the file to its unmodified state.
  *If you hg add a file, it will undo the “added” state of the file, but leave the file itself untouched.
  *If you delete a file without telling Mercurial, it will restore the file to its unmodified contents.
  *If you use the hg remove command to remove a file, it will undo the “removed” state of the file, and restore the file to its unmodified contents.

To revert previous commit, use hg backout:
  hg backout tip -m "bfadadf"
  
To revert one commit in history:
  hg backout --merge -m "fadsfadsf" -r revId
  
To export current rev to tar ball:
  hg archive foo.tar.bz2
  
Clean untracked files:
  hg st -un0 | xargs -0 rm
