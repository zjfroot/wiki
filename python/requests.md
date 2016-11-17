Self signed CA with request:

REQUESTS_CA_BUNDLE=/foo/bar.pem python -c "import requests; requests.get('https://example.com')"

http://docs.python-requests.org/en/master/user/advanced/?highlight=ssl#ssl-cert-verification
