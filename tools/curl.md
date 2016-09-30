To get response time of a web:

curl -o /dev/null -s -w %{time_total}\\n http://macmanpages.com/
