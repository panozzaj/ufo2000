
              **************************************************
              **                UFO2000 0.3.XX                **
              **             aka X-COM: Gladiators            **
              **        http://ufo2000.sourceforge.net/       **
              **                Finnish Manual                **
              **************************************************

             Copyright (C) 2000-2001  Alexander Ivanov aka Sanami
             Copyright (C)      2002  UFO2000 Development Team

				Suomennos: bunie

					***

UFO2000 pelin kehityst� on jatkettu noin vuoden kest�neen tauon j�lkeen.
Nyt UFO2000 on kuitenkin palannut ryhm�n nimelt� "UFO2000 Development Team"
tukemana. Alkuper�isell� tekij�ll� Alexander Ivanovilla ei ole aikaa, eik�
halua tehd� koko ty�t� yksin. Yksityisen henki�n olisi eritt�in hankalaa
s�ilytt�� moinen projekti omissa k�siss��n. Lis�ksi peli on t�ysin
ilmainen eik� kukaan ansaitse siit� sentti�k��n. Lis�tietoja varten lue UFO2000
kansiossa sijaitseva COPYING tiedosto.

Versioilla 0.3.20:st� eteenp�in ei ole vain yht� tekij��. Itseasiassa muutamat
ihmiset ovat lahjoittaneet kirjoittamiansa ohjelmointikoodeja t�h�n versioon
(alkuper�inen tekij� Alexander Ivanov mukaan luettuna).

Kuka tahansa voi ottaa osaa UFO2000 pelin kehitt�miseen. Kaikenlainen apu olisi
arvostettua. Vieraile http://sourceforge.net/projects/ufo2000/ ja lis�� kommentteja,
ideoita, virheilmoituksia ja p�ivityksi� sinne.

P��tavoitteet t�lle versio haaralle (0.3.xx) ovat:
- Korjata kaikki tunnetut virheilmoitukset.
- Siivota ja kommentoida l�hteet.

ufo2000 kehitysryhm�n j�senet:
- Alexander Ivanov tunnettu my�s nimell� 'sanami'
- Serge Semashko tunnettu my�s nimell� 'ssvb'
- Alexander Sabourenkov tunnettu my�s nimell� 'lxnt'
- ����� tunnettu my�s nimell� 'tavy'

CHANGELOG tiedostosta voit l�yt�� t�ydelliset muutos listaukset.

T�m�n tiedoston on tarkastanut ja parannellut Jeremy Walker, tunnettu my�s nimell�
Kuroshi X.

===============
Pelist�
===============

UFO2000 on moninpelattava muunnelma Microprosen pelin X-COM: UFO Defense:n
(UFO: Enemy Unknown) taktisesta osasta.

Se tarvitsee X-COM pelitiedostot kansioista:
   GEODATA GEOGRAPH MAPS SOUND TERRAIN UFOGRAPH UFOINTRO UNITS

Windows versio on laadittu VC6:lla ja tarvitsee DirectX 6:n tai uudemman toimiakseen.

===============
Kartan Muokkain
===============

K�yt� hiiren oikeaa painiketta valitaksesi ruudun jonka haluat korvata ja valinta
ikkuna ilmestyy. Sen j�lkeen valitse haluamasi 10x10 ruudun tyyli.

F2          Tallenna
F3          Avaa
ESC         Poistu


===============
Liittymis Keskustelu
===============

K�ynnistetty�si palvelimen, mutta ennen kuin siirryt teht�v�n suunnitteluun t�m� on
n�kym� jonka tulet n�kem��n. Yhden pelaajista on aloitettava palvelimena ja toisen
liityj�n�.

F4          Uudelleenpiirr� kuva
F10         Aloita peli
ESC         Kumoa


===============
Teht�v�n Suunnittelu
===============

Seuraava vaihe Liittymis Keskustelun j�lkeen on teht�v�n suunnittelu. T��ll� voit
valita sotilaita, m��r�t� heid�n aloitus asemansa ja muokata heid�n aloitus
tietoja/aseitansa pit�m�ll� CTRL n�pp�int� painettuna ja sitten napsauttamalla
valitsemaasi sotilasta (katso alla oleva Yksik�n Muokkain osio).

Asettaaksesi yksikk�si paina vasenta hiirenpainiketta h�nen nimens� yll� ja osoita
valitsemaasi aloitus asemaa kartalta. Paina uudelleen vahvistaaksesi. Poistaaksesi
sotilaan valinnan napsautta hiiren oikeaa painiketta h�nen nimens� yl�puolella.

Tietoa pelaaja yksik�ist�:
   1) "total men points=..." (kokonais mies pisteet) Valitun yksik�n parametrien
      summa (Aika Yksik�t(TU), Terveys...(Health...)).
   2) Jokaisen tyyppisten aseiden m��r� valituille yksik�ille.

Luodaksesi uuden kartan napsauta "NEW" ja lataaksesi vanhan paina "LOAD". Jos olet
s��t�nyt karttasi koon ufo2000.ini tiedostosta, mutta sinulla on silti vanha
karttasi paina "NEW" tai lataa haluamasi kartta.

Lopetettuasi suunnittelun napsauta oman puolesi (palvelin(server)/liityj�(client))
"SEND" sanaa l�hett��ksesi omat pelaajatietosi vastapelaajalle. Sen j�lkeen "SEND"
muuttuu vihre�ksi. Aloittaakseen pelin pelaajien on napsautettava "START" sitten 
kun kaikki "SEND" vaihtoehdot ovat vihrein�. Peli alkaa vasta kun kaikki
n�m� vaihtoehdot ovat muuttuneet vihreiksi. Sotilaittesi s��t�minen tai kartan
vaihtaminen muuttaa kaikki sanat takaisin punaisiksi.

Kaksi pelaajaa samalla tietokoneella -pelityypiss� voit painaa F10 "START" toiminnon
k�ytt�mist� varten ("SEND" tekstisi on silti oltava vihre�n�).

Palataksesi p��valikkoon paina ESC.


===============
Yksik�n Muokkain
===============

T�nne p��set yksik�n sijoitus ruudusta. Pid� CTRL painettuna ja napsauta sotilasta
jota haluat muokata.

T��ll� voit s��t�� sotilaan parametrej� ja varustusta. Sotilailla k�yt�ss� olevat
parametrit ovat: Aika Yksik�t, Terveys, sek� Ampumis- ja Heitt�mistarkkuus. Muut
parametrit, kuten Voima ovat poissa k�yt�st�, koska emme tied� miten ne toimivat
sis�ll� peliss�. Jos viel� sen j�lkeen kun olet j�rjest�nyt varustuksesi haluat
muokata tietojasi uudelleen, niin napsauta oikealla sijaitsevaa taulukkoa.

Jokainen parametri on rajoitettu v�lille >= 50 ja <= 80. N�iden parametrien summan
on oltava <= 240 jokaista yksikk�� kohden. Yksik�iden aseiden tyypeille ja m��r�lle
ei ole olemassa rajoituksia, joten Teht�v�n Suunnittelu vaiheen aikana on
suositeltavaa, ett� katsot vihollisesi aseistusta.

F2          Tallenna
F3          Avaa

Vasen CTRL   N�ytt�� esineen vahinko tilan (muokkaimessa -- maksimi arvo), t�m�
Vasen ALT    toimii my�s tavaraluettelo ruudussa.


===============
Pelin Hallinta
===============

Kaikki yksik�iden toiminnot, kuten UFO1:ss� ovat hallittavissa hiirell�. Voit
l�hett�� ja vastaanottaa viestej� toisille pelaajille/toisilta pelaajilta pelin
aikana kirjoittamalla viestisi n�pp�imist�ll�si ja painamalla enter.

N�it� n�pp�imi� k�ytet��n pelin hallintaan:

F1          P��ll�/Pois p��lt�  Pakettejen n�ytt�minen.
F4          Uudelleenpiirr� kuva.
F5          Uudelleenk�ynnist�
F10         Kokon�ytt�/Ikkuna tila.
ESC         Poistu p��valikkoon.
ALT-X       Nopea poistuminen OS:iin.

Kursorit &  Vaihda kartta ruudun kokoa.
N�pp�inpaneeli +/-

Oikea CTRL  Vaihda rus ja lat v�lill� jos p��ll� INI:ss�.

Vasen CTRL  N�yt� valitun miehen reitti kursori ruutuun kuluvien Aika Yksik�iden
	    	kanssa. Kohteenvalinta tilassa n�ytt�� laukaustesi ja heitett�vien
		esineiden lentoradan. Tavaraluettelo ruuduss� n�ytt�� esineiden
		vahinko arvot. (ALT vaihtoehtoinen)

Vasen SHIFT Pohjassa pidettyn� vasemmalla hiirenpainikkeella ampumisen j�lkeen
		sallii tarkan t�ht��misen.

ENTER	    l�het� viesti
BKSP        poista viimeinen kirjain viestiss�

F11   Huomautus tila p��ll�/pois p��lt�, jota k�ytet��n tarkastamaan yhteyden tila.
      L�hett�� "NOTE" paketin toiseen tietokoneeseen joka sekunti ja vastaanottaa
	vastauksen. Jos paketti ei tule l�pi sekuntien laskin k�ynnistyy aloittaen
	viimeisest� vastaanotetusta paketista ja n�ytettyn� tieto (Info) ikkunan
	oikeassa yl� kulmassa. Jos pakko tyydytt�� rauhaton modeemi komento
	terminaalissa, kuten "atdp123456", on parempi k��nt�� Huomautus tila jatkossa
	pois p��lt�.

F12         tallenna n�kym� "snapshot.pcx" tiedostoon


===============
INI tiedosto
("ufo2000.ini")
===============

(T�htimerkkien selitykset ovat listattuna t�m�n osion j�lkeen. Esim. '*1')

[General]
port=2000            #IP Portti (ei Windows versiolle)
server=10.0.0.2      #Palvelimen oletus IP osoite (ei Windows Versiolle)
width=500            #Taistelu Ruudun leveys
height=280           #Taistelu Ruudun pituus
map_width=4          #   "UUSI" kartan koko
map_height=4         #   map_width*map_height <= 36 !
russian=yes          #no poista k�yt�st� CTRL rus/lat,  yes - p��ll�
bloodymenu=no        #no - ei verisi� valikoita, yes - kyll�!
sound=yes            #yes - ��nitehosteet p��ll�, no - pois p��lt�
comport=2            #   modeemin COM portti (ei Windows versioille)
                     #   1 - COM1, 2 - COM2, 3 - COM3, ...
digvoices=16         # ^2  (2, 4, 8, ...)  ��nien m��r� tehosteissa
modules=no           #   ei k�yt�ss�
modvoices=8          #      "
modname=templsun.xm  #      "
modvolume=125        #      "
speed_unit = 30      #S��t�� yksik�n nopeuden. *1
speed_bullet = 30    #Sama kuin yll�, mutta ammuksille.
speed_mapscroll = 30 #Sama kuin yll�, mutta kartan kelaukselle.
mapscroll = 10       #

[Editor]
platoon_size=8       #sotilaiden m��r� "soldier.dat" tiedostossa *2
last_map_name = c:\ufo2000\geoscape.dat  #viimeisen kartan nimi
last_unit_name = team_ru.units           #viimeisen yksik�n nimi

[Flags]
F_FULLSCREEN = 0  # Aseta 1 k�ynnist��ksesi pelin kokon�yt�ll�.
F_FILECHECK = 1   # Aseta 0 poistaaksesi data tiedostojen eheyden tarkistuksen
                  # k�ynnistyksen yhteydess�
F_SELECTENEMY = 1 # Aseta 0 poistaaksesi siniset merkinn�t vihollis
                  # sotilaiden yll�

*1: Voidaan s��t�� sis�ll� peliss� asetukset valikosta.
*2: "soldier.dat" tiedoston formaatti on sama kuin UFO1:ss�, joten voit k�ytt��
mit� tahansa "soldier.dat" tiedostoja pelist�. Sinun on kuitenkin kirjoitettava
vastaava platoon_size ufo2000.ini tiedostoon. (esim. sotilaiden m��r�
"soldier.dat" tiedostossa).

--TIEDOSTON LOPPU--