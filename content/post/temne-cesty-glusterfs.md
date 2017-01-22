
+++
date = "2014-01-17"
draft = false
title = """Temné cesty GlusterFS"""
slug = "temne-cesty-glusterfs"
tags = ['GlusterFS', 'Linux', 'fs', 'webserver']
banner = ""
aliases = ['/temne-cesty-glusterfs/']
+++

Vzkládal jsem naděje do GlusterFS, že vyřeší problém se sdílením hromady dat na více serverech. Šlo mi o to, abych mohl na jednom serveru něco zapsat a mít to k dispozici co nejdříve na i na druhém. Failover je také fajn, když vypadne jeden node, dá se nasadit jiný a pokračovat s jedněmi daty.

Všechno šlo vcelku dobře, dokud jsem nenarazil na nepříjemné nuance v chování GlusterFS. Třeba to, že je GlusterFS úplně nechutně pomalý na malých souborech a navíc se umí chovat pěkně schizofrenně. Jeden command napíše, že volume existuje a tak nejde pokračovat, ve výpisu ale žádný volume není a problém nakonec vyřeší až reset serveru. No a pak jsem narazil na toto:

    gluster> peer status
    Number of Peers: 1

    Hostname: web3
    Uuid: ae156da1-d4b9-4b57-aeb7-8bda4b69c141
    State: Peer Rejected (Connected)
    
Nejdřív jsem myslel, že spojení odstřeluje firewall, ale po pár pokusech jsem narazil na [dokumentaci](http://www.gluster.org/community/documentation/index.php/Resolving_Peer_Rejected), kde mě odvařil poslední bod.

* Stop glusterd
* In /var/lib/glusterd, delete everything except glusterd.info (the UUID file)
* Start glusterd
* Probe one of the good peers
* Restart glusterd, check 'gluster peer status'
* **You may need to restart glusterd another time or two, keep checking peer status.**

