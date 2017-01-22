
+++
date = "2015-07-18"
draft = true
title = """Autozahrada #1"""
slug = "autozahrada-1"
tags = []
banner = ""
aliases = ['/autozahrada-1/']
+++

Zapojil jsem prototyp automatické zahrady a vyzkoušel ho se solárním panelem. Vůbec nepřichází v úvahu, že by zahrada jela 24/7. Z panelu sice teklo 250 mA i když bylo pod mrakem, ale jen při velmi přesném namíření panelu na zbytky slunce, co se z mraku dostaly, začalo fungovat relé.

Arduino a senzor vlhkosti s dostupným proudem neměly sebemenší problém, ale na relé už to nestačilo a to k němu má být na stejném napájení připojen ještě 12 V solenoidový ventil, přes step up převodník.

Arduino by mělo brát kolem 25 mA, senzor tipuju na jednotky mA a relé 15 až 20 mA. Něco si vezme ještě převodník na 5 V na Arduinu. 60 mA, které dává solární panel při nejlepším nasměrování, když je pod mrakem, tak sotva stačí na uživatení Arduina a na relé můžu v tomhle zapomenout.


![](/images/2015/07/IMG_20150717_225947.jpg)

Zapomenout můžu tedy i na 24/7 měření, takže zadání trochu upravím, odeberu měření teploty, které teď nepotřebuji, nebudu se zabývat ani dalšími senzory vlhkosti a využitím všech relé. Musím vyřešit napájení. Koupím tedy LiIon baterii, protože by na rozdíl od LiPolky měla fungovat v nižších teplotách a podívám se na sleep režim Arduina. Ideálně bych ho chtěl probouzet každých deset minut, aby vše přeměřil a případně zalil kytky. K tomu musím vyřešit odpojení všech periférií od napájení, aby fungovaly jen v době, kdy je to opravdu potřeba.

Projekt se mi tedy trochu protáhne, protože zase budu čekat na věci.

