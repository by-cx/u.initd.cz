
+++
date = "2014-01-21"
draft = false
title = """Optimalizace Dogecoin charts"""
slug = "optimalizace-dogecoin-charts"
tags = []
banner = ""
aliases = ['/optimalizace-dogecoin-charts/']
+++

Včera ráno jsem se vzbudil k hlášením z monitoringu, že dva projekty na jednom serveru Roští.cz berou výkonu víc než je zdrávo. Jedním z těch projektů byl [dogecharts.org](http://dogecharts.org/) a hned na první pohled se mi zalíbil. Zobrazuje aktuální informace o [Dogecoinu](http://dogecoin.com/) a je to přesně ten typ projektu, které chceme na Roští mít.

Problémů s výkonem bych si ještě nějaký čas asi nevšiml, kdyby se nesešly dva najednou. Na dogecharts.org totiž začalo chodit hodně lidí, v jednu chvíli jich bylo online 160 a každý z nich si sosal nové informace v intervalu 5 sekund. To je v průměru 32 požadavků za sekundu. K tomu se přidal nenažraný skript dalšího uživatele. Aplikace byla uzpůsobená na podobnou zátěž, ale pět procesů, které jsou na Roští maximálně povoleny, to prostě neutáhlo. Data byla cachována do databáze a každý dotaz tak znamenal sáhnutí do databáze a vyvrhnutí zpět uživateli.

Nakonec jsme se s autorem dogecharts.org dohodli, že data necháme servírovat Nginxem. Při této příležitosti jsem zjistil, že Nginx není v cachování tak dobrý, jak jsem si myslel. Nicméně s malým hackem jsme uložili tato data do souboru a odtud už je Nginx dokáže servírovat neuvěřitelnou rychlostí. Při desetinásobném zatížení o tom server skoro ani neví.

Jediný problém tohoto řešení je, že se může stát, že bude uživateli odeslána jen polovina souboru. Malým hackem jsem tak myslel dobře známý postup, kdy se data zapisují do dočasného souboru, třeba *_data.json* a pak se provede *mv _data.json data.son*. Operace přesunu je totiž pro linuxové filesystémy atomická, takže Nginx pošle buď starou nebo novou verzi souboru, nic mezitím.

