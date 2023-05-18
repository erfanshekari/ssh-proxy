$TTL    604800
; SOA record with MNAME and RNAME updated
@       IN      SOA     example.com. root.example.com. (
                              6         ; Serial Note: increment after each change
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
; Name server record 
@       IN      NS      example.com.
; A record for name server
@      IN      A       127.0.0.1