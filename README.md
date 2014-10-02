# aircrack-db

aircrack-db is a list of wireless interfaces tested with the dual-card injection test and in the field.

The driver name is the name of the kernel module used by the card. The driver version is either the kernel version or the version of the [compat-wireless / compat-drivers / backports](https://backports.wiki.kernel.org/index.php/Main_Page) drivers if they were installed separately. All of the used drivers are mac80211 drivers. The hardware vendors usually don't bother to implement monitoring mode in their drivers. A common example is the wl driver from Broadcom.

Aircrack-ng's wiki page about [injection testing](http://www.aircrack-ng.org/doku.php?id=injection_test) states:

> If you get a failure on attack 5, it may still work in the field if the injection MAC address matches the current card MAC address. With some drivers, it will fail if they are not the same.

If the wireless interface proves to work in my lab for the fragmentation attack, then it is going to be mentioned in a separate column.

Product | Chipset | PCI ID | Bus | Driver / Version | -0 | -1 (open) | -1 (psk) | -2/-3/-4/-6 | -5/-7 | -5 in the field
---|---|---|---|---|---|---|---|---|---|---
AirForce One 54g | BCM4318 | 14e4:4318 | Mini PCI | b43 / 3.14.5-1 | OK | OK | OK | OK | OK | Yes
