
              **************************************************
              **                UFO2000 0.4.0                 **
              **             aka X-COM: Gladiators            **
              **        http://ufo2000.sourceforge.net/       **
              **       Deutsches Handbuch / German Manual     **
              **************************************************

                                  $Rev: 444 $

             Copyright (C) 2000-2001  Alexander Ivanov aka Sanami
             Copyright (C) 2002-2004  ufo2000 development team

Die Entwicklung von UFO2000 schreitet nun, nach einem Jahr der Inaktivit�t, 
wieder voran.
Durch die gemeinsamen Anstrengungen von mehreren Entwicklern, kurz dem 
"ufo2000 development team", wird UFO2000 nun weiter programmiert und verbessert.

In der Datei AUTHORS im Verzeichnis UFO2000 finden Sie Informationen 
zu den Personen, die zu diesem Projekt beigetragen haben.

Der urspr�ngliche Autor, Alexander Ivanov, ist zur Zeit nicht an der 
Entwicklung beteiligt, aber er hat bereits eine grossartige Vorarbeit 
geleistet, vielen Dank daf�r !
Ohne seine Initiative w�re dieses Spiel nicht entstanden.

Dieses Spiel ist freie Software (GPL). N�here Informationen zur Lizenz
stehen in der Datei COPYING, die sich im Verzeichnis UFO2000 befindet. 

Jeder kann sich an der Entwicklung von UFO2000 beteiligen, 
jede Hilfe ist willkommen.
Besuchen Sie dazu die Webseite http://ufo2000.sourceforge.net.
Dort k�nnen Sie die ufo2000-Mailingliste abonnieren 
und Kommentare, Ideen, Bugreports und Patches einsenden.

Die Liste der �nderungen von Version zu Version
finden Sie in der Datei "ChangeLog".

=========
Allgemein
=========

UFO2000 ist ein Remake des taktischen Teils des Spiels "X-COM: UFO Defense"
(bzw. "UFO: Enemy Unknown") von Microprose. 
Gespielt wird per Netzwerk (Internet bzw. lokales Netzwerk) gegen 
einen anderen Spieler.
Es ist auch ein "Hotseat"-Spiel mit nur einem Rechner m�glich.

Es werden Dateien von einem X-COM Originalspiel ben�tigt (Grafiken etc.).

Das Spiel funktioniert eingeschr�nkt auch mit einer Demoversion von X-COM.
Dann stehen allerdings nur die "City"-Karte und nur bestimmte Einheiten zur 
Verf�gung.  Die Verwendung einer Vollverson von X-COM wird daher empfohlen.

Zus�tzlich k�nnen auch Daten von "X-COM: Terror from the deep"
verwendet werden, bzw. von der entsprechenden Demoversion.

Die Demoversionen stehen zum Download zur Verf�gung auf:
ftp://ftp.microprose.com/pub/mps-online/x-com/xcomdemo.zip
ftp://ftp.microprose.com/pub/mps-online/demos/terror.zip

Das Spiel l�uft unter den Betriebssystemen Windows, Linux und FreeBSD.
Vermutlich funktioniert es auch unter anderen UNIX-systemen.
Falls es Ihnen gelingt, UFO2000 auf einem anderen System zu compilieren 
und zum laufen zu bringen, bitten wir um R�ckmeldung.

Detailierte Informationen zum installieren von UFO2000 befinden sich in der
Datei INSTALL im UFO2000 Verzeichnis.


=========
Programme
=========

ufo2000-srv.exe - Server: f�r ein Spiel im lokalen Netzwerk oder per Internet.
                  Der Server l�uft nach dem Start im Hintergrund und
                  erledigt die Kommunikation zwischen den Clients.

ufo2000.exe     - Client: mit diesem Programm wird gespielt.

=========
Main Menu - Hauptmen�
=========

Nach dem starten von UFO2000.exe wird ein Men� mit den folgenden Optionen 
angezeigt:


   Connect to internet server 

      Verbindung zu einem UFO2000-Server im LAN oder Internet aufnehmen.
      Es wird ein Dialog angezeigt zur Eingabe von Server-Adresse, Login 
      und Passwort.

      Als Server-Adresse ist voreingestellt "lxnt.info", dies ist z.Zt. 
      der offizielle ufo2000-server im Internet. 
      Bei einem Spiel im LAN muss auf einem der erreichbaren Rechner 
      das Serverprogramm ufo2000-srv.exe laufen. 
      Als Server-Adresse wird die IP-Adresse dieses Rechners 
      eingetragen (z.B. "192.168.1.2" ).

      Mit Login-Name und Passwort wird der Spieler identifiziert.
      Alle Spieler sollten unterschiedliche Login-Namen verwenden,
      Passworte sollten mindestens 6 Zeichen lang sein.
      Bei Spielen auf lxnt.info wird auch eine Statistik der Spiele gef�hrt,
      siehe http://ufo2000.lxnt.info/results.php.

      Nach erfolgreichem Login gelangt man in den Chat-Modus und kann dort mit 
      anderen Spielern Kontakt aufnehmen und sie zu einem Spiel herausfordern.


   Start hotseat game 

      Startet UFO2000 auf einem einzelnen Computer f�r ein "Hotseat"-Spiel,
      dazu wird kein Netzwerk ben�tigt.
      "Hotseat" = "heisser Stuhl" bedeutet, dass beide Spieler den selben PC 
      benutzen und abwechselnd Ihre Z�ge eingeben, w�hrend der andere jeweils 
      wegschaut.
      Dieser Men�punkt f�hrt direkt zum Missions-Planer.


   Load saved game 

      Laden eines gespeicherten Spiels, nur f�r lokale Hotseat-Spiele.


   Quit

      Programm beenden


====================
Internet Server Chat
====================

Sobald die Verbindung zum ufo2000-Server besteht, wird die Chat-
Konsole angezeigt. 
Die rechte Spalte zeigt eine Liste der anwesenden Spieler.

Die Farbe des Spielernamens zeigt den Status des Spielers an:

Weiss - der eigene Spielername
Grau  - bereit zum Chat
Gelb  - an diesen Spieler wurde eine Herausforderung gesendet
Gr�n  - Spieler hat Herausforderung akzeptiert, 
        bzw. selbst eine Herausforderung gesendet
Rot   - Spieler ist besch�ftigt (spielt gerade mit jemand anderem)

Um einem anderen Spieler eine Herausforderung zu senden, 
einfach dessen Namen anklicken, der Name wird dann gelb.
Durch anklicken eines gr�nen Namens kann man eine Herausforderung annehmen,
und damit ein Spiel starten.  Dies f�hrt zun�chst zum Missions-Planer.


===============
Mission Planner - Missions-Planer
===============

Oben in der Mitte wird die aktuell ausgew�hlte Karte angezeigt,
links und rechts davon die Soldaten der beiden Spieler, 
unten in der Mitte die Optionen f�r das Spiel.

Einer der beiden Spieler kann hier die allgemeinen Daten zum Spiel festlegen, 
d.h. insbesondere die Karte ausw�hlen (mittlere Box unterhalb der Karte).

Weiterhin kann jeder Spieler hier die Zusammensetzung seines Teams �ndern
(Namensliste der Soldaten links bzw. rechts der Karte).

Spieldaten:
  Durch anklicken von "NEW" wird eine neue, zuf�llige Karte erzeugt.
  Mit "LOAD" kann eine vorbereitete Karte geladen werden.
  Zum erstellen von solchen Karten wird ein extra Karteneditor ben�tigt.

Teamdaten:
  Hier kann man seine Soldaten ausw�hlen, Ihre Werte �ndern, Waffen und 
  Ausr�stung w�hlen, und ihre Startpositionen auf der Karte festlegen.
  In den Einheiten-Editor gelangt man durch anklicken eines Soldaten-Namen,
  w�hrend man die linke CTRL-Taste festh�lt ( = "STRG-links" ).
  N�here Einzelheiten siehe n�chster Abschnitt "Einheiten-Editor".

Soldaten auf der Karte plazieren (nur im eigenen Bereich der Karte) :
  mit linker Maustaste Namen anklicken, dann Position auf Karte anklicken.
  Zur Best�tigung nochmals klicken.
  Ein rechter Mausklick auf einen Namen deselektiert den zugeh�rigen Soldaten.

Infos zu den Einheiten:
   1) "total points=..." Die Summe aller Parameters (TU, Gesundheit,.. )
      aller aufgestellten Einheiten.
   2) Anzahl der Waffen und Ausr�stungsgegenst�nde

Mit dem "SEND"-Button in der Box "Server" werden die fertigen Daten zum Server 
und von dort zum anderen Spieler �bertragen, der Button wird daraufhin gr�n.

Sobald der andere Spieler seine Aufstellung per SEND-Button �bertragen 
hat, wird auch dessen SEND-Button gr�n.
Wenn beide Send-Buttons gr�n sind, k�nnen die Spieler das Spiel 
starten durch anklicken ihrer jeweiligen "START"-Buttons.

Bei �nderungen nach einem SEND werden alle Statusanzeigen wieder rot.

Bei einem Hotseat-Spiel muss der "START"-Button gleich nach dem "SEND"-Button
bet�tigt werden, anschliessend ist der zweite Spieler an der Reihe mit seinen
Vorbereitungen.

Mit ESC gelangt man zur�ck ins Hauptmen�.


===========
Unit Editor - Einheiten-Editor
===========

Vom Missions-Planer aus erreicht man den Einheiten-Editor 
durch CTRL-Klick auf einen Soldatennamen.

Hier kann man Daten und Ausr�stung seiner Soldaten �ndern.

Angezeigt werden
links : die "Beladung" des Soldaten f�r Rucksack, Taschen, H�nde etc.,
        darunter "Ground" die Ablagefl�che an seiner aktuellen Position.
rechts: die Daten und Werte des Soldaten (Chart mit Balkendiagrammen)
unten : die verf�gbaren Waffen, Munition etc.

Man kann das Team seiner Soldaten komplett abspeichern und wieder laden:

F2          Save - Speichern des Teams
F3          Load - Laden

Links-CTRL und Links-ALT:
            Zustands-Anzeige f�r alle Gegenst�nde (Schaden bzw. Munitionsvorrat)
            durch einen eingeblendeten Balken (gr�n=ok) bzw. Zahlenwert.
            Dies funktioniert auch in der Inventar-Anzeige w�hrend des Spiels.

ESC         Einheiten-Editor verlassen



Werte der Soldaten:

Time Units - Zeiteinheiten f�r Bewegung, Schiessen und Aktionen
Stamina    - Ausdauer
Health     - Gesundheit = Hitpoints
Reactions  - Chance f�r Reaktions-Sch�sse in der gegnerischen Phase
Firing     - Zielgenauigkeit mit Schusswaffen
Throwing   - Zielgenauigkeit beim Werfen
Strength   - St�rke = maximale Beladung

Die anderen Parameter (Bravery, PSI etc.) werden z.Zt. nicht verwendet.

Ein Klick auf den Chart mit den Werten �ffnet den Werte-Dialog.
Dort k�nnen der Name ge�ndert werden, sowie Panzerungstyp ("Skin") 
und die Werte per Mausklick eingestellt werden.

Alle Werte m�ssen im Bereich zwischen 50 un 80 liegen.
Punkte f�r St�rke z�hlen doppelt, hier ist der Bereich 25 bis 40.
Es gibt ein Limit f�r die Gesamtsumme der Werte, man kann daher 
nicht alle Werte auf Maximum setzen.

F�r die Bewaffnung gibt es kein festes Limit, die Spieler k�nnen aber
entsprechende Vereinbarungen treffen.


==========
Kontrollen w�hrend des Spiels
==========

Die Bedienung erfolgt, wie in X-COM, haupts�chlich mit der Maus:

linker  Mausklick: Aktions-Buttons oder Waffe anklicken, 
                   zur Cursor-Position laufen / schiessen
rechter Mausklick: Soldat in Richtung zum Cursor drehen, T�r �ffnen


Tastenbefehle:

Man kann Textnachrichten von/an den anderen Spieler senden/empfangen.
Dazu einfach den Text per Tastatur eingeben. Abschicken mit der ENTER-Taste.

ENTER       Chat-Text senden
BACKSPACE   letztes Zeichen des Chat-Textes l�schen

F10         Umschaltung Vollbild / Fenster-Modus

F12         Bildschirmfoto in Datei "snapshot_XX.pcx" abspeichern

ESC         Zur�ck zum Hauptmen�


Cursor  
            Gr�sse der Kartenanzeige auf dem Bildschirm �ndern

Keypad +/- 
            Musik-Lautst�rke regeln

F9          Umschaltung zwischen Tastenbelegung primary_keyboard und 
            secondary_keyboard, wie eingestellt in Datei ufo2000.ini 

Rechts-CTRL + 'b', 'd', 'e', 'p' or 'r' 
            Umschaltung zwischen Tastenbelegung f�r Belarusian, Deutsch, 
            Englisch, Polnisch und Russisch.
            (andere Sprachen k�nnen in der Datei ufo2000.ini gew�hlt werden)

Links-CTRL  Einblendung zus�tzlicher Daten:
  Bewegung: Anzeige des Weges des aktiven Soldaten zur Cursor-Position,
            mit TU-Kosten.
  Waffe   : Anzeige der Schusslinie bzw. Wurfbahn.
  Inventar: Zustands-Anzeige f�r alle Gegenst�nde (Schaden bzw. Munitionsvorrat)

Links-SHIFT Erlaubt genaueres Zielen durch Anvisieren eines bestimmten Teils
            des Zielfeldes.
            Dazu muss diese Taste festhalten werden, w�hrend man
            mit der linken Maustaste den Schuss ausl�st.
            Es erscheint dann ein Men� zur Auswahl des genauen Zielpunkts.


===============
INI file
("ufo2000.ini")
===============

(Markierung mit Stern, z.B. "*1": siehe Anmerkungen unten)

[General]
width=500            #Battle Screen width
height=280           #Battle Screen height
map_width=4          #   "NEW" map size
map_height=4         #   map_width*map_height <= 36 !
sound=yes            #yes - sound fx on, no - off

speed_unit = 30      #Sets unit speed. *1
speed_bullet = 30    #Same as above, but for game projectiles.
speed_mapscroll = 30 #Same as above, but for map scrolling.
mapscroll = 10       #

[Editor]
platoon_size=8       #number of soldiers in "soldier.dat" file *2
last_map_name = c:\ufo2000\geoscape.dat  #last map name
last_unit_name = team_ru.units           #last unit name

[Flags]
F_FULLSCREEN = 0    # Set to 1 to start the game in fullscreen mode
F_SELECTENEMY = 1   # Set to 0 to disable blue markers above enemy soldiers


*1: Kann w�hrend des Spiels im Options-Men� ge�ndert werden.

*2: Das Format der Datei " "soldier.dat" ist das gleiche wie im Spiel 
    X-COM: UFO Defense, es k�nnen also solche Dateien z.B. von gespeicherten 
    Spielst�nden verwendet werden.
 Allerdings muss hier in ufo2000.ini der Parameter "platoon_size" 
 entsprechend der Anzahl von Soldaten eingetragen werden.

--ENDE--
