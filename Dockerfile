FROM internetsystemsconsortium/bind9:9.18

# Installation des packages nécessaires
RUN apt-get update && apt-get install -y \
    dnsutils \
    nano 

# Copie des fichiers de configuration
ADD woodytoys/dns/named.conf /etc/bind/named.conf
ADD woodytoys/dns/l1-10.zone /etc/bind/l1-10.zone

# Attribution des permissions
RUN chown -R bind:bind /etc/bind/

# Commande CMD
CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]
