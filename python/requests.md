Self signed CA with request:

REQUESTS_CA_BUNDLE=/foo/bar.pem python -c "import requests; requests.get('https://example.com')"
