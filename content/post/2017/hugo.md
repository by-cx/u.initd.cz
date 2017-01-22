
+++
tags = []
draft = false
date = "2017-01-22T01:56:00Z"
title = """Hugo"""
+++

Nějaký jsem na tomto blogu používat [blogovací platformu Ghost](https://ghost.org/). Díky ní mělo [Roští](https://rosti.cz/) jako jeden z prvních hostingů v ČR podporu pro [Node.js](https://nodejs.org/en/). Bylo to ještě na starém Roští, ale stejně jako na něj, i na tento blog začal padat prach.

Tak jsem udělal nějaké změny. Blog jsem začal generovat jako statickou stránku pomocí nástroje [Hugo](https://gohugo.io/) a vymanil jsem ho ze spár starého Roští. Web server mu dělá [Caddy](https://caddyserver.com/) a celé je to hostované na virtuálním stroji za pár 3 EURa [na ScaleWay](https://www.scaleway.com/).

Výhodou staticky generovaného webu je, že může běžet témět kdekoli. Můžete ho umístit na web pomocí [GitHub Pages](https://pages.github.com/) nebo ho [hostovat přes S3](https://discuss.gohugo.io/t/howto-deploying-hugo-on-s3-and-cloudfront/2800). Případně použít trochu toho DIY umění jako já a umístit ho někam sami. Minimáně v druhém případě se z webu stane prakticky neshodilné médium. Bude totiž replikovaný minimálně přes několik zón jednoho datancetra, ale je možné ho mít umístěný i na několika místech na světe. S dalšími funkce od Amazonu se to dá ještě vylepšit a pokud něco může mít dostupnost téměř 100 %, je to kombinace těchto technologií.

Jenom to dostat do S3 zas tak jednoduché není a tak jsem to nakonec neudělal a pořídil si levné VPSko. ScaleWay používáme teď na Roští, kvůli velmi dobré ceně, která je konečně pod úrovní vlastního hardwaru. Má to i nějaké nevýhody, ale o tom možná jindy. Tohle je čistě oznamovací blogpost.

A teď se rozhoduju co bude s blogem dál. Rád bych začal psát anglicky, takže CZ blog minimálně na nějakou dobu uspím. Je ale možné, že mě to přestane bavit a vrátím se k němu. Mám tu také ještě kolem třicíky nezveřejněných textů, kde by alespoň některé stály za zveřejnění. Uvidíme.
