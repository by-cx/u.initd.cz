
+++
date = "2015-03-08"
draft = true
title = """Systemd"""
slug = "systemd"
tags = []
banner = ""
aliases = ['/systemd/']
+++

Asi netušíte co to systemd je, ale níže mu budu pár řádek věnovat a seznámím laskavého čtenáře se vším, co pro těchto pár řádek potřebuje vědět.

Že mám problém s lidmi mé okolí ví už dlouho. Dneska jsem potkal cyklistu bez světel na chodníku, i když je hned vedle cyklostezka. Stejně mě iritují lidé na cyklostezce se psem, i když je vedle chodník. Chodci si to často neuvědomují, ale na kole by měl člověk trochu přemýšlet. Bylo to je jen jedno z mnoha potvrzení, že masu žijících lidí dokáže potopit jediný člověk a co je nejsmutnější, pro každou konkrétní příležitost je to vždy někdo jiný. Běžně se jednotlivec chová předvídatelně, rozumně, ohleduplně, ale pak něco selže a vůči někomu jinému se zachová jako úplné hovado. Proto je masa hloupá, protože spojuje negativní vlastnosti všech a netlačí vpřed to dobré.

A dostáváme se k systemd. Je to základní součást moderních linuxových systémů. Stará se o to, aby systém správně nabootoval a vy s ním mohli pracovat. Díky systemd máte na počítači správný čas, funkční síť, připojené disky, zobrazí se vám přihlášení, funguje tiskárna, je to hned po jádře snad to nejdůležitější co v systému je. Dříve se pro tyto věci používal jednoduchý program, který volal jiné programy. Byl to bordel. Jednotlivé systémy nebyly ani vzdáleně podobné a start systému trval déle než bylo potřeba.

Autorem tohoto systému Lennart Poettering. Stejný člověk, díky kterému zasunete na desktopu sluchátka do USB portu a přesměruje se vám do nich zvuk nebo vytvořil program, díky kterému se sebou mohou komunikovat počítače bez nastavení sítě - pouze mezi nimi připojíte kabel. Ten člověk je mág a ví co dělá.

No a když jste mág a napíšete něco revolučního, postaví se proti vám horda neandrtálců, u nás zastoupená diskutujícími ze serverů Root.cz a abclinuxu.cz. Naposledy se hlas lidu projevil v pátek pod zprávičkou [Vývojová verze Ubuntu plně přechází na systemd](http://www.root.cz/zpravicky/vyvojova-verze-ubuntu-plne-prechazi-na-systemd/) a dovolím si trochu citovat.

Jedna z prvních rekací

> A dokáže z vás někdo v pár slovech vystihnout v čem tkví se systemd zásadní problém?

Rozumný dotaz, protože žádný z kritiků systemd nepřišel s ničím, co by opravdu byl problém.

> Pro mě moc věcí v jednom. Raději bych kdyby vše co začlenili do systemd dělali jako samostatné projekty a systemd zůstal jen init.

Systemd není tak úplně monolotické. Není to jeden program, ale je jich mnoho a nemusíte je používat všechny.

> Maintainer je arogantní pako, Not-Invented-Here syndrom, neuvěřitelná centralizace nesouvisejících projektů, binární logy... (není seřazeno podle nasrávacího faktoru)

Maintainer jedná s lidmi tak jak oni jednají s ním. Chápu, že když pořád někdo omýlá stejné blbosti, tak může reagovat méně politicky, než by bylo dobré. Rozhodně to ale neznamená, že by systemd bylo špatné. Binární logy jsou čitelné na všech platformách a je to argument stejně platný, jako že na čtení logů ze syslogu je potřeba *less* nebo *more*.



