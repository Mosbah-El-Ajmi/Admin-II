FROM internetsystemsconsortium/bind9:9.18

# Installation des packages nécessaires
RUN apt-get update && apt-get install -y \
    dnsutils \
    nano

# Copie des fichiers de configuration
ADD woodytoys/dns/named.conf /etc/bind/named.conf
ADD woodytoys/dns/l1-10.zone /etc/bind/l1-10.zone

# Attribution des permissions pour les fichiers de configuration et le répertoire de cache
RUN chown -R bind:bind /etc/bind/ && \
    mkdir -p /var/cache/bind && \
    chown -R bind:bind /var/cache/bind && \
    chmod -R 755 /var/cache/bind

RUN mkdir -p /var/log/named && \
    chown -R bind:bind /var/log/named && \
    chmod -R 755 /var/log/named

# Commande CMD
CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]
