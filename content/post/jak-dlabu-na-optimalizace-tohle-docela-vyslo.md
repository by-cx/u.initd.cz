
+++
date = "2014-01-27"
draft = false
title = """Jak dlabu na optimalizace, tohle docela vyšlo"""
slug = "jak-dlabu-na-optimalizace-tohle-docela-vyslo"
tags = []
banner = ""
aliases = ['/jak-dlabu-na-optimalizace-tohle-docela-vyslo/']
+++

Když jsem před lety zakládal Roští, určil jsem si směr a za ním šel. Co se týče PHP, tak jsem se rozhodl pro [mod_fcgid](http://httpd.apache.org/mod_fcgid/) a server Apache schovaný na Nginxem. Všechny ostatní technologie se bez Apache obejdou, ale pro PHP je Apache něco jako prs a PHP nikdy nepřestalo sát. Může za to hlavně mod_rewrite. Lidem nevysvětlíte, že mod_rewrite mají jen ošklivé hostingy s Apachem a oni musí "hezká" URL řešit jinak

PHPku jsem nikdy moc péče nevěnoval a Martin, který se k Roští minulý rok přidal, taky není zrovna nadšený PHPkař. Dneska ale dorazil na podporu e-mail, ve kterém byla věta:

    Jde zejména o prestashop, který u vás běží 2x rychleji než na WEDOSU.

Chlapci z Wedosu věnují optimalizacím mnoho času a věřím, že se snaží, aby u nich aplikace bežěly maximálně efektivně a aby jeden server zvládal tisíce takových. Pak přijde uživatel na Roští, na server s ušmudlanými dvěmi jádry hodí Prestashop, který můžeme označit za benchmark, a napíše, že mu to běží 2x rychleji než na nabušenejch serverech, kterým admini věnovali víc času než já strávil vývojem administrace. Na druhou stranu, Roští není za dvacku, my nemusíme sedřít ze serverů plechy, abychom na něj naskládali naše zákazníky.

