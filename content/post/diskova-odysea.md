
+++
date = "2016-10-09"
draft = true
title = """Disková odysea"""
slug = "diskova-odysea"
tags = []
banner = ""
aliases = ['/diskova-odysea/']
+++

Když jsem před pár lety kupoval první servery pro Roští, vybral jsem Seagate SV35 a vybral jsem dobře, 3,5 roku spolehlivě sloužily. Mohly by vydržet ještě pár let víc, ale co už, je to jen disk. Jejich smrt ale byla více než zajímavá.

Co se tedy stalo. Během září jsme si všimli, že se něco začíná dít s disky ve dvou našich starších serverech. Bylo to na serverech, kterých jsme se chtěli zbavit, takže to zas tolik nebolelo, ale neměli jsme ještě připravenou náhradu. Po pár dnech začal v každém serveru disk selhávat. Nemohl přečíst data a tak jsme ho vyhodili z RAIDu.

Začali jsme řešit náhradu novým serverem a než se nám podařilo vyřešit problém se šroubky a šuplíky, tak začal selhávat další disk. Měli jsme tedy problém, který jsme nakonec vyřešili připojeným externím diskem přes USB 3, na který se synchronizoval RAID. Všechno šlo dobře dokud jsme nepřipojili tento disk do RAIDu. Přesně v tomto okamžiku došlo u některých virtuálních serverů k poškození filesystému. U jednoho dokonce tak, že jsme museli obnovit data ze zálohy. Nepodařilo se nám z toho vytáhnout ani crontaby.

Z celkových 2 TB prostoru byly nepoškozenější tři filesystémy s 15 GB, 50 GB a 50 GB. Oddíly, které měly 500 a 350 GB byly naprosto v pořádku. Došlo tedy k problému až na konci disku, protože ty největší oddíly byly na začátku.

