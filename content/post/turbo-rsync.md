
+++
date = "2014-01-17"
draft = false
title = """Turbo rsync"""
slug = "turbo-rsync"
tags = ['Linux', 'rsync', 'backup', 'zálohy', 'daemon']
banner = ""
aliases = ['/turbo-rsync/']
+++

Určitě znáte takové to, když šéf napíše, jak to dopadlo se zálohami a vy si vzpomenete, že jste je měli přes třemi dny spustit, protože to chvilku trvá, než se přenese 1 TB dat. Zbývalo 15 hodin a tak jsem narychlo spustil *rsync* přes *SSH*. Hned jak jsem kouknul na graf jsem si uvědomil, že SSH limituje rychlost přenosu a tam kde mělo být několik stovek Mbps byly pouze desítky a navíc dost nízké.

Zoufalé situace vyžadují zoufalé činy, takže rychle, do souboru */etc/rsyncd.conf* jsem hodil:

	[vms]
        comment = VMs
        path = /home/pole/
        read only = yes
        list = yes
        uid = root
        gid = root
        transfer logging = yes

Na firewallu povolil port pro rsync (873), spustil rsync v daemon módu:

	# rsync --daemon
    
A nakonec spustil přenos:

	rsync -avz muj.server.cz::vms/cesta/k/zalohovani/ /lokalni/misto/pro/zalohy/
    
Rychlost sice není úplně gigabitem, ale to se dá pochopit, protože servery jedou na sdílené lince a do věci se ještě míchá komprese. Ale pro přesun v daném šibeničním termínu to je akorád.

