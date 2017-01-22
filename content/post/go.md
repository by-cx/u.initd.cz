
+++
date = "2014-12-07"
draft = true
title = """Go"""
slug = "go"
tags = []
banner = ""
aliases = ['/go/']
+++

Posledních 14 dní programuju hodně [v Go](https://golang.org/). Díky [gobyexample.com](https://gobyexample.com/) jsem se velmi rychle naučil základy a na zbytek už [stačí dokumentace](http://golang.org/doc/). Četl jsem teď o víkendu nějaké články od Jakuba Vrány o tom, co se mu nelíbí na PHP, Javě, JavaScriptu a [také na Go](http://php.vrana.cz/co-se-mi-nelibi-na-go.php). Vesměs s ním souhlasím, některé věci mi jsou jedno a PHP bych nepoužíval ani za prachy. Go bych se chtěl na druhou stranu zastat.

### Paralelizace

Proti jiným jazykům má Go má jednu ohromnou výhodu, když napíšte:

> go funkce()

Spustí se *funkce()* na pozadí a kód pokračuje dál. Není to nějaké asynchronní hašteření v jenom vlákně jako v JavaScriptu, ale vytvoří se plnohodnotný thread a kód funkce pracuje v něm. Tuto vlastnost ještě doplňuje snadná komunikace mezi thready díky kanálům. Když si na Go trochu zvyknete, začnete uvažovat paralelně. Začnete na pozadí posílat věci, které budete potřebovat až za chvilku a ve správný čas si je vyzvednete. Go je kompilovaný jazyk a je rychlý i bez paralelizace. S ní je výsledek fenomenální. Stačí si vyzkoušet třeba [framework Revel](http://revel.github.io/) a jen čučet otevřenou pusou.

### Chytání chyb

Go nemá výjimky. Pro někoho vlastnost, kvůli které na Go nikdy nesáhne. Je to škoda, ale jde pravděpodobně o ústupek paralelizaci. Výjimky se špatně chytají, když vám kód běží v několika vláknech a to je v Go častý jev.

Osobně jsem si na výjimky nikdy nezvykl. Používám je v Pythonu, ale Pythoní dokumentace je k nim dost stručná. Ani funkce standardní knihovny nemají uvedené, které výjimky mohou vyhazovat a když už, je to buď ztracené v popisu funkce nebo někde jinde u daného modulu. Ve výsledku kód testuji na různé stavy a výjimky chytám dodatečně.

Že nemá Go výjimky by mu asi někteří programátoři odpustili, co mu ale neodpouštějí, jsou návratové hodnoty ve formátu *value, err*. Některé funkce vrací dvě hodnoty a druhá je vždy chyba. Když existuje chyba, v hodnotě je nějaký nesmysl nebo nějaká výchozí hodnota. U mě tento přístup vede k tomu, že chyby ošetřuju ve větší míře než s výjimkami, ale chápu, že pro čistotu kódu to není úplně ono. Když si mám vybrat, mám raději přístup Go, ale neznamená to, že bych měl Python o to méně raději :-)

### Ukazatele a dereference

Jakub Go vyčítá existenci ukazatelů a jejich "magickou" dereferenci. Go totiž provádí dereferenci ukazatelů sám, ale občas ne. Případy, kdy tomu tak není, jsou podle mě hodně vzácné a Go jde na ruku programátorovi. Nesetkal jsem se s problémy, kdy bych používal ukazatel tak, aby aplikace spadla. Když už, kompilátor mě vždy upozornil, že takto to nepůjde. Výtka k existenci ukazatelů je úplně mimo mísu.

### GO určitě zkuste

Umět jen jeden programovací jazyk je omezující. Každý se hodí na jiný task, některé jsou univerzálnější, jiné ne. Go je relativně mladý jazyk, ale to že v něm je napsaný třeba Docker, Rocker nebo Lime ukazuje, že patří do té první skupiny a snadno se v něm dá psát pro moderní vícejádrové procesory. Osobně bych ho popsal jako takové vyšší Cčko s trochou Pythonu, ale pravdou je, že Go je své a přineslo nový pohled na to, jak psát programy.



