Core perforce concepts

depots - folder on server side, stores history
workspaces - folder on user's local machine, managed by Perforce
changelists - lists contain changes
The Perforce mindset

Unlike some other version control tools, the Perforce clients and the server do not perform actions unless they are told explicitly to do them. So your workspace files will not be updated unless you select an action or run a command to do so. Your files will not be submitted to the server unless you, the user, select that action.
It is also expected that users inform the server about changes they intend to make to workspace files by running specific client commands such as add or edit. This allows the server to communicate those status changes to other users. It is a slightly different way of working to tools such as Git or Subversion, where users just start editing files locally and then resolve the status later at the time of commit.
Setup example perforce server:

Download sampledepot.tar.gz and p4d (from perforce)
extract sampledepot and follow the instruction in readme.html.
Solve problem : Case-handling mismatch: server uses Windows-style (-C1) but journal flags are Unix-style (-C0)! when importing the checkpoint file by converting checkpoint file to the right version:

grep -v '^@nx@' checkpoint.N > checkpoint.N.new
