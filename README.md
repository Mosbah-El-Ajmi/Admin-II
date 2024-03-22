# Admin-II
Groupe L1-10

l1-10.ephec-ti.be

Container DNS :

docker run -d --name=dns -p 53:53/udp -p 53:53/tcp --mount type=bind,source=/home/woody/woodytoys/dns/named.conf,target=/etc/bind/named.conf --mount type=bind,source=/home/woody/woodytoys/dns/l1-10.zone,target=/etc/bind/l1-10.zone internetsystemsconsortium/bind9:9.18
