
+++
date = "2016-05-28"
draft = false
title = """WiFI teploměr s ESP8266 (ESP-01)"""
slug = "wifi-teplomer-s-esp8266-esp-01"
tags = []
banner = ""
aliases = ['/wifi-teplomer-s-esp8266-esp-01/']
+++

Chodil jsem na Střední průmyslovou školu v Lanškrouně, dneska SOU a SOŠ Lanškroun a docela živě si pamatuju, jak nás připravovali do života slaboproudých elektrotechniků. Učitelé to s námi neměli jednoduché, ale z opačné pozice to nebylo o moc lepší, no ale koukněte dneska na mě, o 10 let později jsem postavil WiFi teploměr :-)

O škole bych mohl psát ještě dlouho, ale život je na to moc krátký. Před dvěma lety, když se objevilo první Raspberry Pi, přišlo mi poštou a já nevěděl co s ním dělat. Nakonec jsem do něj strčil USB WiFi dongle, připojil k němu tři teplotní senzory DS18B20 na dlouhé trojlince a natáhnul dva do dvou místností a jeden na balkón. Od té doby jsme používali tuhle stránku:

![](/images/2016/05/Spectacle-W21572.png)

Později jsem si hrál s myšlenkou jak se zbavit kabelů a přenášet to bezdrátově. Koupil jsem si i pár levných modulů nRF24L01, ale nakonec z toho sešlo. Rozjet nRF24L01 tak, aby jeden byl připojen k Arduinu a druhý k Raspberry Pi není úplně snadné, resp. to není na jedno odpoledne a tak jsem od toho upustil.

Čas plynul, až jsem si jednou začal hrát s Influx DB a nástrojem Grafana. InfluxDB je databáze pro časově závislá data. Jakákoli čísla, která se mění v čase, do ní můžeme uložit a ona se postará o to, abychom s nimi mohli později rychle pracovat. Grafana se zase k InfluxDB umí připojit a udělat z dat uvnitř grafy. Implementoval jsem obojí na na našem [hostingu Roští.cz](https://rosti.cz), kde toto duo používáme na statistiky z používání administrace. Během jednoho víkendu mě ale napadlo, že bych mohl mít někde uložena i data o teplotách ze senzorů, co se mi válí na balkóně a v bytě.

Shodou okolností jsem se také pustil do prozkoumávání chipu ESP8266, resp. vývojové desky NodeMCU, který se mi už dva měsíce válel na stole. Jedná se o mikročip s WiFi taktovaný na 80 MHz se 4 MB flash pamětí a s běžícím interpretrem Lua. Připojil jsem to k USB portu a nestačil jsem zírat. Mohl jsem si povídat přes sériovou linku s Lua interpretrem a dělat všechno, co znám z Arduina, jen nemusím nic kompilovat a můžu rovnou zkoušet. Tohle je hodně důležitá část. Moct si vyzkoušet jeden řádek kódu a pak ho strčit do celku je pro vývoj mnohem efektivnější, než testovat celek a čekat až se běh programu k tomu řádku dostane. Možná je Lua trochu overkill na podobném zařízení, ale jde to s ní prostě rychle.

Google mi začal předhazovat eshop [arduino-shop.cz](http://arduino-shop.cz/), tak jsem si tam objednal teplotní a vlhkostní senzor a když všechno dorazilo, začal jsem si hrát. A tady to začíná být zajímavé. Místo NodeMCU jsem použil ohackované ESP-01, což je deska s ESP8266, 1 MB flash pamětí a přizpůsobená k tomu, aby dělala jen WiFi modem pro Arduino nebo jiné mikroprocesory. Na téhle hračce jsou k dispozici dva GPIO piny, z nichž jeden jde použít. Senzor mám 1-Wire, takže jeden GPIO pin je víc než dost. Druhý pin slouží k přepnutí do flash režimu. Proti NodeMCU má ESP-01 výhodu, že neobsahuje nic, co jsem pro tenhle účel nepotřeboval. Zapojení nakonec vypadá takto:

![](/images/2016/05/Spectacle-u21572.png)

Z továrny má ESP-01 nahrán AT firmware a reaguje tedy jen na AT příkazy. Potřeboval jsem Lua firmware, který se dá najít na stránce [nodemcu-build.com](http://nodemcu-build.com/). Když tuto stránku otevřete, zaklikáte pluginy, které chcete použít a pak vám firmware přijde na email. Pro potřeby teploměru to jsou hlavně DHT, timer, ADC, node, wifi a net.

Když jsem k TX a RX zapojil RX a TX piny mého USB-UART převodníku s 3.3V výstupem,  nahrání firmwaru bylo jen otázkou jednoho příkazu:

    esptool.py -p /dev/ttyUSB0 write_flash 0 Downloads/nodemcu-master-16-modules-2016-05-27-23-09-57-float.bin

Tool esptool.py mám z AUR repositáře v Arch Linuxu. Po nahrání firmwaru jsem odstranil z GPIO0 pinu propojku se zemí a deska byla téměř připravená. ESP-01 má jednu malou nevýhodu. ESP 8266 usíná tak, že nastaví timer a vypne se, resp. programátor ho vypne. U toho nastaví interní timer na nějaký čas, který pošle signál na RST pin ve správnou chvíli. ESP8266 se pak zapne, provede to co najde ve flash paměti v souboru init.lua a skriptem se nechá zase uspat. Rozdíl ve spotřebě jsou jednotky mA při idlení a mikro μA při spánku. Během spánku je možné nechat zapnutou wifi a tak dále, ale komunikace přes WiFi saje až 150 mA, takže tudy v tomto případě spíš ne.

Teploměr má tedy jednoduchý úkol. Probudit se, začít se připojovat k WiFi, změřit teplotu, poslat ji přes MQTT a uspat chip. Chip se uspí i v případě, že se něco nepovede. Jedno vynechané měření nevadí. Tohle celé zabere cca 6 sekund a 2 sekundy mám nastavené čekání. Čekání je důležité, protože když deska začne hned konat, tak než na ní uděláte nějakou programátorskou změnu, tak se zase uspí. První dvě sekundy mám tedy k tomu, abych měl čas přerušit nastavené timery, které desku postupně oživí a nakonec také uspí. Když timery zastavím, můžu do ní nahrát nový kód.

Ale zpátky k ESP-01. Pin s interním timerem na probuzení není vyveden na hlavním osmipinu a tak je nutné připájet jeden drát k jednomu z pinů na chipu a druhý konec připojit k RST pinu. Chce to trochu umu, ale dá se to. Stačí si pocínovat drát, pinzetou ho přiložit ke správnému pinu a zahřát ho mikropájkou kousek výš. Třetí ruka taky hodně pomůže. I když se drát chytne, tak moc nedrží, takže jsem ho byl nucen zajistit pomocí hot glue. Na ESP-01 se dá ušetřit pár mA denně ještě jedním zásahem a to odpájením diody, která nepřetržitě svítí (červeně). Nedá se přehlédnout. Je to SMD dioda a mikropájkou se dá odstranit snadno.

![](/images/2016/05/esp-01-hack.png)

K zapojení bych měl několik poznámek. ESP8266 má psaný v datasheetu rozsah napětí 3.0 až 3.7 V. Podle zkušeností lidí, které se mi podařilo dohledat, je možné použít napětí 1.7 V až 4.6 V a chip by to měl přežít. Mělo by tedy být možné napájet ESP8266 z Li-Ion baterie, ale osobně jsem zvolil dvě NiMH baterie.

NiMH baterie se dají dobře nabíjet ze solárního panelu bez nabíjecích obvodů. Solární panel ještě nemám doma, takže zkušenosti zatím nepopíšu. V mém případě bere teploměr kolem 20-40 mA denně při odesílání dat každých 15 minut. Nemám spotřebu úplně přesně změřenou. Rozhodl jsem se jít praktickým testem, protože na nic jiného nejsem vybavený a z toho budu mít výsledky až za několik týdnů, takže číslo výše je jen odhad. Přidáním 4 V solárního panelu se shottkyho diodou by mělo baterie krmit 3.7 V za ideálních světelných podmínek. Dioda je nutná, aby solární panel nevysál baterie v době, kdy slunce nesvítí. Nejsem si úplně jist, jak bude solární panel fungovat, ale uvidím až přijde.

Stav baterie je možné kontrolovat přes ADC pin ESP8266. Chip má v sobě jeden ADC převodník a ten buď měří napájecí napětí nebo napětí na ADC pinu. Ten není na ESP-01 vyveden, takže v tomto případě to je jasný. Napětí NiMH bateriím klesá na začátku vybíjecího cyklu, pak je relativně stabilní a na konci, když jsou vybité, začne padat rychle. Poslední část se pokusím přes ADC převodník odhadnout, abych zjistil, kdy má teploměr posílat informaci o výměně baterií. Zatím mám na sledování napětí graf.

Během zapojování na breadboardu jsem se setkal s tím, že čidlo často vrátilo chybu. Je to způsobené elektromagnetickým bordelem všude okolo, který indukuje napětí na drátech a samovolně se pak přepínají piny z 0 na 1. Řeší se to pull-up rezistorem, který nastaví pin na 1 a v případě, že se spojí se zemí, se nastaví na 0. Pull-up rezistor nebudu moc vysvětlovat, našel jsem na to parádní video.

https://youtu.be/wxjerCHCEMg

Tento problém zmizí společné se zkrácením kabelů. Pull-up rezistor, i s hodnotou 10 kOhm, bude v takovémto zařízení dělat 8 mA denně, což je energie, se kterou se dá měřit třetinu dne. Pokud bych použil větší, přestal by zase plnit svou funkci. Nicméně problém s čidlem zmizel společně se zkrácením kabelů a s připájením všeho na univerzální plošňák, takže ve výsledném prototypu není potřeba.

Zbývá mi napsat něco o softwaru, ale detaily si nechám na příště. V současné době řeším sběr dat takto:

* Naměřím hodnoty,
* pošlu je přes WiFi a protokol MQTT do RaspberryPi,
* RaspberryPi uloží data do InfluxDB v internetu,
* Grafanou si data zobrazím.

Je to robustní řešení, které se nebojí růstu o další senzory. Navíc je možné ho propojit s Amazoními IoT technologiemi a možná i s Azure od Microsoftu, ale k tomu bude ještě dlouhá cesta. Nakonec tedy přidávám dvě fotky ze současného stavu.

![](/images/2016/05/Spectacle-C23215.png)

![](/images/2016/05/DSC_0091.JPG)

![](/images/2016/05/DSC_0092.JPG)

