
+++
date = "2014-11-23"
draft = false
title = """Raspberry Pi A+ na čtyřech kolech"""
slug = "raspberry-pi-a-na-ctyrech-kolech"
tags = []
banner = ""
aliases = ['/raspberry-pi-a-na-ctyrech-kolech/']
+++

Minulý týden jsem si [objednal z minidroid.cz](http://eshop.minidroid.cz/raspberry-pi/308-raspberry-pi-model-a-256mb.html) Raspberry Pi A+. Bude to moje třetí RPi. Zatímco první sedí u okna a [měří teplotu](http://home.initd.cz/) (B), druhé sedí [v Logiu](http://logio.cz/) a měří kvalitu WiFi sítě (B+). Třetí umístím na podvozek se čtyřmi koly a čtyřmi motory.

Tohle je takový těšící se zápisek, takže všechny popsané informace nemám otestované :-)

![Podvozek](/images/2014/11/robot.jpg)


To co vidíte nad tímto řádkem je podvozek, který jsem zvolil a už je na cestě ze Španělska. Celkem mě vyšel asi na 960 Kč. Nejsem úplně spokojený, ale je před Vánoci. Navíc spokojený bych byl s brushless motory, ale fyzika tyhle motory dost poráží. Je efektivnější mít jeden výkonný motor (není problém dosáhnout na 1 kW) a rozvedený pohon na kola kardany, poloosami a unašeči než čtyři méně výkonné motory na každém kole. Myslím ale, že se tam jednou dostatnu. [Nebudu první](http://hackaday.com/2014/07/12/independent-wheel-drive-rc-car/), takže nemusím bojovat s obavami zda to je možné či ne.

Víte, motor na každém kole je z pohledu programátora úplný luxus. Takto vybavené auto má absolutní kontrolu nad způsobem, jakým kola zabírají o povrch. Lze snadno naprogramovat ABS, EDS, elektronika pomůže se zatáčením (přidá výkon na vnějších kolech), dokáže auto během zlomku sekundy otočit o 180°, může šetřit energii vypnutím náhonu jedné z náprav a opětovným zapojením když je to potřeba a pokud jste opravdoví borci a zkamarádíte se s akcelerometrem, tak zvládnete naprogramovat i drift asistenta. Prostě zatáhnete za páčku a ono to bude driftovat samo :-)

Ale to už popisuju trochu sci-fi. Nemám dílnu ani znalosti, abych byl schopen postavit vhodný podvozek, takže se musím spokojit s tím prdítkem nahoře. Prý to zvládne 90 cm/s, ale na drift to určitě krouťák mít nebude, zvlášť až na to posadím dvě 3S 20C 3Ah LiPol baterie.

Podvozek už jste viděli, takže co jsem to objednal dál:

* NOIR kamera pro Raspberry Pi
* H bridge HG7881 pro ovládání DC motorů
* [FOXY UBEC 3A](http://www.jino.cz/foxy-ubec-3a-49.html#) pro stabilizaci na 5V

FOXY UBEC použiju na napájení Raspberry Pi i motorů. Stojí dvě kilča a dělá přesně to co potřebuju - vezme vstupní napětí v královském rozsahu 6-25V a udělá z něj 5V či 6V (nastavitelné jumperem). Používá se v RC modelech bez pohonu (větroně) nebo v modelech se spalovacími motory. Nemuset se pájet s běžně dostupným stabilizátorem znamená tři hodiny k dobru a ušetřené nervy. FOXY mají v obchodu kousek odsud, jdu pro něj už zítra.

Ještě nevím zda budu kombinovat IR čidlo a optickou navigaci a nebo použiji jen jednoho z toho. Každopádně v poslední MagPi vyšel článek o optické navigaci, takže budu zkoušet chvíli tu. Exustují ještě ultrazvuková čidla, ale ten jeden typ, co jsem našel k Arduinu, pracuje na 5V a Raspberry Pi nemá rádo 5V.

Na Aukru jsem našel za 119 Kč [H bridge HG7881](http://robotstore.cz/obchod/arduino/hg7881-arduino-radic-pro-2-serva-dc-motory-h-mustek/) pro Arduino. H bridge je běžně používaný obvod na řízení stejnosměrných motorů. Hodí se na něj PWM modulace, ale ještě nevím co vlastně budu mít za motory, takže je možné, že mi bude stačit 1 a 0.

S PWM modulací se to u RPi má tak, že v něm jeden PWM modulátor je. I když je jen jeden, jde napojit více pinů, takže směr dopředu a dozadu nebude problém. Co jsem koukal na řízení toho H bridge, tak by nemělo být problém ani otáčení. S jedním PWM se budou točit obě strany stejně rychle, ale na směru otáčení nezáleží.

Zatím jsem za robůtka dal kolem 3500 Kč, ale už to asi moc neporoste. To je dobrá cena za autíčko s kamerou ovládané přes WiFi, resp. přes internet. Můžete být klidně na druhém konci světa a jet se s ním projet :-)

