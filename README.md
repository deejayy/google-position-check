google-position-check
=====================

Google position checker

Create **domains.txt** with url-s to check, like this:

    www.some-url.com
    www.some-other-url.net
    another.url.org
    etc.etc.etc.xxx

Create **phrases.txt** with the search keywords to check, like this:

    keyword no1
    another keyword
    etc etc etc

Run **check.sh** for the result.

The output is a TSV where the rows are the domains, the columns are keywords and the cells contains the position.
