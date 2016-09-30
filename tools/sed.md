Replace a string directly in a file, with "-i"

    sed -i 's/old-word/new-word/g' *.txt

Escape: .^$*+?()[{\|

http://stackoverflow.com/questions/399078/what-special-characters-must-be-escaped-in-regular-expressions

Replace aaa=xxx to aaa=yyy:

    sed "s/aaa=.*/aaa=yyy/g"
