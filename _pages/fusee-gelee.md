---
permalink: /fusee-gelee.html
title: Запуск пейлоадера через Fusée Gelée
author_profile: true
---
{% include toc title="Разделы" %}

# Что такое Fusée Gelée? 

Некоторые мобильные процессоры NVIDIA Tegra, выпущенные до 2016 года, содержат Уязвимость переполнения буфера в режиме восстановления BootROM (RCM). Злоумышленник с физическим доступом к USB устройства и возможностью принудительной перезагрузки устройства в RCM может использовать уязвимость для выполнения непроверенного кода.

Fusée Gelée - это цепочка эксплойтов для Nintendo Switch, построенная вокруг аппаратной уязвимости чипа Nvidia Tegra. С её помощью можно будет запускать не подписанный код на Nintendo Switch. Поскольку уязвимость аппаратная, её невозможно закрыть на текущей ревизии железа. 

# Что такое RCM? 

RCM - это штатный режим восстановления на Tegra-устройствах. Для того, чтобы войти в него, нужно выключить консоли, а затем зажать (POWER) + (VOL+) + (HOME). Но не тот (HOME), что мы видим на правом джойконе, а кнопку которую NVIDIA Tegra считает таковой. К сожалению, на самой приставке её нет. , нам понадобится отключить консоль, замкнуть определённый контакт на месте крепления правого joy-con и землю (для этого используется замыкатель), подключить консоль к ПК и отправить на неё пейлоадер любым удобным способом. Ниже мы рассмотрим подробнее как это делать.

# Что понадобится

* Замыкатель (подробнее ниже)
* Карта памяти 
* Кабель USB type C для подключения Switch к ПК или мобильному телефону

## Замыкатель 

Для корректной активации цепочки нам понадобится замкнуть между собой 1-й и 10-й контакты (либо 7-й и 10-й, оба варианта работают одинаково хорошо) на месте установки правого контроллера. Это можно сделать несколькими способами: 

* Использовать обычную [канцелярскую скрепку](https://www.reddit.com/r/SwitchHacks/comments/8f0ugz/hardwarediy_switch_paperclip_jig_for_rcm_mode/){:target="_blank"}
* Использовать [кусочек фольги](https://xghostboyx.github.io/RCM-Guide/#tin_foil){:target="_blank"}
* Спаять между собой контакты непосредственно в самом joy-con [напрямую, или через резистор](https://xghostboyx.github.io/RCM-Guide/#soldered_joycon_710){:target="_blank"}
* [Вмонтировать в правый joy-con кнопку](https://www.reddit.com/r/SwitchHaxing/comments/8ho4h0/modded_my_joycon_to_have_a_clear_case_and_home/){:target="_blank"}
* Использовать [замыкатель, распечатанный на 3D-принтере](https://www.thingiverse.com/thing:2877484){:target="_blank"} (вы можете купить уже готовый: <a href="https://www.olx.ua/obyavlenie/nintendo-switch-rcm-jig-IDAWSI6.html" target="_blank"><img src="/images/ua.png" alt="Украина" style="vertical-align: baseline !important;"></a>, <a href="https://vk.com/switch_underground?w=product-166310958_1417155%2Fquery" target="_blank"><img src="/images/ru.png" alt="Россия" style="vertical-align: baseline !important;"></a>)
* И другие [более странные методы](https://xghostboyx.github.io/RCM-Guide/){:target="_blank"}

Далее в инструкции будет фигурировать именно замыкатель, однако помните, что все эти способы релевантны. 

# Инструкция

Хост - компьютер или телефон с которого вы будете передавать пейлоадер на Switch. 
{: .notice--info}

## Часть I - Вход в RCM

Если вы используете AutoRCM, переходите сразу к следующей части

1. Выключите консоль
1. Подключите ваш USB type C кабель к хосту
1. Отсоедините правый joy-con
1. Вставьте замыкатель в направляющую правого джойкона до упора 

	![](https://cdn.thingiverse.com/renders/a7/54/70/c4/3a/52e69bd058c5f59ef94f53c6d81c93c2_preview_featured.jpg) 
	{: .text-center}
	{: .notice--info}
	
1. Зажмите **одновременно** кнопки (POWER)+(VOL+) и удерживайте их примерно 3-4 секунды, затем отпустите 
1. Вставьте ваш USB type C кабель, подключенный к хосту, в Switch

На экране приставки не должно ничего происходить. Если после подключения кабеля экран остаётся чёрным, то вы все делаете правильно! Если экран загорается надписью Nintendo - отключите консоль и повторите всё заново. 

Может не получаться по следующим причинам:
* Замкнуты не те контакты
* Замыкатель ничего не замыкает, например проволока порвалась и контакты не замыкаются, или он изначально собран с ошибками
* Кнопки зажаты не одновременно. Пробуйте зажимать вначале (VOL+), а затем, не отпуская её, нажмите (POWER)

## Часть II - Использование Fusée Gelée

Выберите платформу, которая будет использоваться в качестве хоста:

* [Windows](#windows)
* [Linux\MacOS\ChromeOS\Android](#linuxmacoschromeosandroid)
* [Донгл SX OS Pro](#%D0%94%D0%BE%D0%BD%D0%B3%D0%BB-sx-os-pro)

___

### Windows

#### Что понадобится

* Последняя версия [Zadig](http://zadig.akeo.ie/downloads/zadig.exe){:target="_blank"}
* Свежая версия [TegraRcmSmash](https://switchtools.sshnuke.net/){:target="_blank"}
* Пейлоад, который вы собираетесь запускать на приставке
* USB type С на USB type A кабель для подключения Switch к ПК 

#### Установка драйверов 

Если драйвера уже были установлены, пропустите эту часть

1. Запустите `Zadig.exe` от имени Администратора 
1. В верхнем поле (на изображении '1') вы должны увидеть строку "APX" (иногда "Unknown Device")
	* Если там ничего нет, вы либо не ввели Switch в RCM, либо не подключили его после этого к ПК 

	![](/images/screenshots/zadig.png) 
	{: .text-center}
	{: .notice--info}
	
1. В поле "Driver" (на изображении '2') выберите `libusbK (v3.0.7.0)`
1. Нажмите "Install Driver"
1. После успешной установки драйвера нажмите "Close" и закройте программу 

#### Запуск пейлоада

1. Откройте архив с TegraRcmSmash
1. Перейдите в папку `Win32` и перетащите из архива `TegraRcmSmash.exe` в любую удобную для вас папку
	* В дальнейшем в эту папку так же будут складываться пейлоадеры и вам каждый раз придётся ей пользоваться для запуска взлома, имейте это ввиду
1. В эту же папку закиньте пейлоад, который планируете запускать 
	* В одной папке должна находится программа `TegraRcmSmash.exe` и необходимый `.bin` пейлоада
1. Перетяните пейлоад на `TegraRcmSmash.exe`
1. Пейлоад запустится на консоли
	* Если пейлоад не запускается проверьте правильно ли установлены драйвера. Правильно установленный драйвер устройства будет отображаться в диспетчере устройств в списке `libusbK USB Devices`
	* Попробуйте передать пейлоад еще раз
1. Можете доставать замыкатель
	
___

### Linux\MacOS\ChromeOS\Android

#### Что понадобится

* Пейлоад, который вы собираетесь запускать на приставке
* USB type С на USB type A кабель для подключения Switch к ПК
* Браузер Chrome (с другими браузерами работать не будет!)

#### Запуск пейлоада

1. Откройте эту [веб-страницу](https://elijahzawesome.github.io/web-cfw-loader/){:target="_blank"}
1. В части "Setup Payload Delivery" выберите пейлоад из списка, или загрузите свой, выбрав в списке "Upload payload" (нажмите "Выберите файл", после чего выберите `.bim`-файл вашего пейлоада)
1. Нажмите "Deliver payload!"
1. В открывшемся окне выберите "APX" и нажмите "Подключение"
1. Пейлоад запустится на консоли
1. Можете доставать замыкатель

___

### Донгл SX OS Pro

#### Что понадобится

* Пейлоад, который вы собираетесь запускать на приставке
* Xecuter Dongle, входящий в комплект SX PRO 
* MicroSD-карта памяти, отформатированная в FAT32 или exFAT
* [boot.dat](){} с прошивкой SX OS

#### Запуск пейлоада

1. Выключите консоль
1. Вставьте карту памяти приставки в ПК
1. Поместите выбранный пейлоад и `boot.dat` в корень карты памяти приставки
1. Верните карту памяти в консоль
1. Вставьте донгл в консоль и удерживая (VOL+) включите приставку (замыкатель должен быть вставлен в Switch)
1. Приставка загрузится в бутлоадер SX OS 
1. Выберите "Options"
1. Выберите "Launch external payload"
1. Выберите пейлоад, который хотите запустить
1. Пейлоад запустится на консоли
1. Можете доставать замыкатель