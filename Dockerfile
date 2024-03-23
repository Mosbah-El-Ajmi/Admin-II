FROM internetsystemsconsortium/bind9:9.18

ADD woodytoys/dns/named.conf /etc/bind/named.conf
ADD woodytoys/dns/l1-10.zone /etc/bind/l1-10.zone
RUN chown -R bind:bind /etc/bind/

CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]
