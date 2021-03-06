---
permalink: /xci-convert.html
title: Конвертирование XCI в NSP
author_profile: true
---
{% include toc title="Разделы" %}

Для установки на приставку игры в формате XCI, ее нужно переконвертировать в NSP. Сделать это можно на ПК или на самой консоли
{: .notice--warning}

## Конвертирование на ПК 

1. Выполните [подготовительные работы](games#подготовительные-работы){:target="_blank"}, если ещё не сделали этого
1. Скачайте и распакуйте [4nxci](https://github.com/The-4n/4NXCI/releases){:target="_blank"} в удобную папку на вашем ПК 
1. Положите в папку с программой `keys.dat`, которые находятся в корне карты памяти вашей консоли 
1. Положите игру в формате `.xci` в папку с программой 
1. Перетяните игру в формате `.xci` на `4nxci.exe`
1. Дождитесь окончания установки

Сконвертированная игра будет называться `%TitleID%.nsp`

## Конвертирование на консоли с помощью n1dus

1. Выполните [подготовительные работы](games#подготовительные-работы){:target="_blank"}, если ещё не сделали этого
1. Скачайте ["**n1dus**"](/files/n1dus.zip){:target="_blank"} и поместите содержимое архива в папку `switch` на карте памяти вашей приставки
1. Запустите "**n1dus**"
1. Перейдите в папку, в которой находятся ваши `.xci-`файлы
1. Наведите курсор на любой установочный файл
1. Нажмите (-), чтобы начать конвертирование
1. Вы получите файл в формате `.nsp` в той же папку, в которой лежал ваш `.xci-`файл
