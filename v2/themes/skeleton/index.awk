# html, one record per line

BEGIN { FS="|"; printf "<p>\n" } 

# only handle items w/ dates -- grep should already handle this, but never
# hurts to check it again.
/[0-9]+/ { 

  # extract the date components from the path
  split($1, d, "/"); 

  # convert source .md references to .html
  sub("\.md$", ".html", $1)

  if (length(baseurl) == 0) baseurl=""

  # entry HTML, simple
  printf "&#8226; <small>%s-%s-%s</small> <a href=\"%s%s\">%s</a><br />\n", d[3], d[4], d[2], baseurl, $1, $2

  # entry HTML, w/ summary
  #printf "<p><small>%s-%s-%s</small> <a href=\"%s\">%s</a><br />%s</p>\n", d[3], d[4], d[2], $1, $2, $3
}

END { printf "</p>\n" }

# EOF
