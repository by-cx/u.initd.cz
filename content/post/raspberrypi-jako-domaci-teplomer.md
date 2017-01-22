
+++
date = "2014-02-23"
draft = true
title = """RaspberryPi jako domácí teploměr"""
slug = "raspberrypi-jako-domaci-teplomer"
tags = ['RaspberryPi', 'Teploměr']
banner = ""
aliases = ['/raspberrypi-jako-domaci-teplomer/']
+++

Od dob QuadroCoptéry jsem Raspberry Pi vytáhl jen jednou, zkoušel jsem jeho výkon na databázích. O tom ale mluvit nechci, minulý týden jsem ho vytáhl podruhé a rozhodl jsem se trochu potrápit pacičky jeho procesoru nějakými vstupy z venku a měřit teplotu na třech místech našeho bytu. Chci ji použít k ovládání hlavic radiátorů, ale o tom jindy.

Dnešní svět je prolezlý různými DYI gadgety, takže sehnat senzory teploty pro RaspberryPi je otázka 56 Kč([DS18B20](http://www.ges.cz/cz/cidlo-teploty-ds18b20-GES05600306.html)). Třemi dráty se dá připojit hned několik senzorů, stačí následovat třeba [toto schéma](http://learn.adafruit.com/adafruits-raspberry-pi-lesson-11-ds18b20-temperature-sensing/hardware).

Poskládat všechno na stole je na pět minut, spájet to a napsat nějaké rozhraní mi zabralo 4 hodiny. Nakonec mám z webu dostupné následující:

![](/images/2014/Feb/home.png)

RaspberryPi posílá teploty na vzdálený server, takže kdekoli, kde mám připojení k internetu, vím, kolik mám doma stupňů :-)

Dalším krokem bude regulace teploty v jednotlivých místnostech. Kolega má nějaké hlavice, které se ovládají způsobem vypnuto/zapnuto přes 24V, takže mě čeká pájení relátek a shánění zdroje. Zatím ale netuším, o jaký se konkrétně jedná typ hlavic, takže to ještě chvilku vydrží. Než sem postnu update, můžete mrknout na dvě fotky současného stavu:

![](/images/2014/Feb/2014_02_23_21_30_39.jpg)

Na DPS není, kromě jednoho ze senzorů, nic jiného než zenerka a klasická dioda, které chrání vstupovýstup RaspberryPi a jeden rezistor mezi + a vstupovýstupem RaspberryPi. Jsou to dobře známá zapojení, která najdete Googlem. Trochu ještě váhám, co se stane, když se senzor dostane nešťastně pod vodu. Nemám totiž zapojený rezistor do série se vstupovýspem, takže při zkratu by se tam mohl objevit nebezpečně vysoký proud. Vyřeším dalším updatem.

![](/images/2014/Feb/2014_02_23_21_31_05.jpg)


