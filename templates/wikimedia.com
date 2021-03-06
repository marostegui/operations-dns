; vim: set expandtab:smarttab
{% from "helpers/langlist.tmpl" import geolanglist with context -%}
@           1D  IN SOA  ns0.wikimedia.org.  hostmaster.wikimedia.org.   (
                    {{ serial }}    ; serial
                    12H     ; refresh
                    2H      ; retry
                    2W      ; expiry
                    1H      ; negative cache TTL
                    )

; Name servers

            1D  IN NS   ns0.wikimedia.org.
            1D  IN NS   ns1.wikimedia.org.
            1D  IN NS   ns2.wikimedia.org.

; Mail exchangers

            1H  IN MX   10  mx1001.wikimedia.org.
            1H  IN MX   50  mx2001.wikimedia.org.


; Canonical names
            600 IN DYNA geoip!text-addrs

; Servers (alphabetic order)

; Service aliases

; Wikis (alphabetic order)

www         600 IN DYNA     geoip!text-addrs

; All languages will automatically be included here
{{ geolanglist() }}
