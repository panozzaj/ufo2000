              **************************************************
              **                UFO2000 0.3.XX                **
              **             aka X-COM: Gladiators            **
              **        http://ufo2000.sourceforge.net/       **
              **                 Polish Manual                **
              **************************************************

             Copyright (C) 2000-2001  Alexander Ivanov aka Sanami
             Copyright (C)      2002  UFO2000 Development Team

                     T�umaczenie: dolny & Sir-Torpeda 

                                       ***

Prace nad UFO2000 s� kontynuowane po ponad roku zastoju. UFO2000 powr�ci�o, wspierane przez grup� "UFO2000 Development Team".
Oryginalny autor, Alexander Ivanov, nie ma ani czasu, ani ch�ci by zajmowa� si� ca�ym projektem samemu. Nale�y doda�, �e gra jest
kompletnie darmowa (na licencji GPL) i nikt nie zarobi� na niej ani centa. Dla informacji przeczytaj plik COPYING, znajduj�cy si�
w folderze z UFO2000. 

Wersje od 0.3.20 nie maj� jednego autora. Kilka os�b dorzuci�o swoje kawa�ki kodu do tej wersji 
(pierwotny autor - Alexander Ivanov jest w�r�d nich). Ka�dy mo�e wzi��� udzia� w tworzeniu UFO2000.
Doceniamy ka�d� pomoc. Odwied� http://sourceforge.net/projects/ufo2000/ i oficjalne forum: http://www.ufo2000.prv.pl
i zamie�� tam swoje komentarze, pomys�y, raporty o b��dach, w�asne patche. 

Podstawowe zadania dla najbli�szych wersji (0.3.xx) to: 
- wyeliminowanie wszystkich znanych b��d�w. 
- uporz�dkowanie i skomentowanie �r�de� 

Cz�onkowie UFO2000 Development Team: 
- Alexander Ivanov aka 'sanami' 
- Serge Semashko aka 'ssvb' 
- Alexander Sabourenkov aka 'lxnt' 
- �&&�  aka 'tavy' 

Zobacz plik CHANGELOG by prze�ledzi� histori� zmian. 

Ten plik zosta� dodany przez Jeremiego Walkera, aka Kuroshi X. 

=============== 
Wst�p 
=============== 

UFO2000 jest multiplayerowym rimejkiem taktycznej cz�ci gry X-COM: UFO Defense (UFO: Enemy Unknown) wyprodukowanej przez firm� Microprose. 

UFO2000 wymaga X-COM'owych plik�w i folder�w: 
GEODATA GEOGRAPH MAPS SOUND TERRAIN UFOGRAPH UFOINTRO UNITS 

Wersja Windowsowa skompilowana zosta�a za pomoc� VC6 i wymaga DirectX 6 lub nowszego. S� tak�e wersje DJGPP oraz Linux. 


=============== 
Edytor Map 
=============== 

Aby zamieni� dany obszar mapy u�yj prawego przycisku myszy, po jego naci�ni�ciu pojawi si� menu z kawa�kami terenu do wyboru. 

F2 Zapis mapy 
F3 Za�adowanie mapy 
ESC Koniec 


=============== 
Connect Chat 
=============== 

Po odpaleniu serwera, przed przej�ciem do ekranu planowania misji pojawi si� ten ekran. Jeden gracz musi za�o�y� gr�,
drugi (klient) musi do��czy� by gra mog�a si� rozpocz��. 

F4 Od�wie�enie ekranu 
F10 Start gry 
ESC Anulowanie 


=============== 
Planowanie Misji 
=============== 

Nast�pnym ekranem, zaraz po Connect Chat, jest ekran Planowania Misji. 
Tutaj mo�esz wybiera� �o�nierzy, ustawia� ich pozycje startowe i zmienia� ich statystyki/stan uzbrojenia,
poprzez przytrzymanie lewego CTRL i klikni�cie na imi� wybranego �o�nierza (wi�cej szczeg��w w sekcji zatytu�owanej "Edytor Jednostek"). 

By rozstawi� swoje jednostki, naci�nij lewy przycisk myszy na imieniu �o�nierza, a potem nakieruj kursor na mapk�.
Ponownie naci�nij lewy przycisk myszy, zatwierdzaj�c sw�j wyb�r. Je�li chcesz zrezygnowa� z umieszczenia �o�nierza na mapie,
naci�nij prawy przycisk myszy na jego imieniu (p�niej jednak�e b�dzie mo�na zn�w go wybra� i ustawi�). 

Informacje na temat jednostek gracza: 
1) "total men points=..." - suma statystyk (TU, Health,..) dla jednostek umieszczonych na mapie. 
2) Liczba i rodzaj wybranego uzbrojenia dla jednostek umieszczonych na mapie. 

Aby wygenerowa� now� map�, naci�nij "NEW", je�li chcesz wgra� zapisan� wcze�niej mapk�, wybierz "LOAD".
Je�li zosta�a zmieniona wielko�� mapy w ufo2000.ini, jednak ta si� nie zmieni�a, wybierz "NEW" do wygenerowania w�a�ciwej,
b�d� wgraj now� (wedle w�asnego wyboru). Gdy ju� zako�czysz planowa� misj�, nacisnij "SEND" w okienku serwera,
b�d� klienta (zale�nie od tego, czy hostujesz gre, czy te� do��czasz si� do gry tworzonej przez kogo�).
S�owo to zmieni wtedy kolor na zielony. Aby rozpocz�� rozgrywk�, gracze musz� nacisn�� "START", gdy ju� u ka�dego "SEND" b�dzie mia�o
zielony kolor. Jakiekolwiek zmiany we w�asnym oddziale, b�d� zmiana mapy, zmieni� kolor s�ow na czerwony (w takim przypadku trzeba po
prostu powt�rzy� procedur� opisan� w tym akapicie). Dla gry typu "hotseat" mo�na nacisn�� F10, aby rozpocz�� rozgrywk�
(jednak "SEND" musi mie� zielony kolor). 

Aby powr�ci� do g��wnego menu, naci�nij ESC. 

=============== 
Edytor Jednostek 
=============== 

Dost�p do edytora jednostek mo�na uzyska� z ekranu Planowania Misji. Przytrzymaj CTRL i nacisnij na imi� �o�nierza,
kt�rego chcesz podda� edycji. Mo�esz tutaj zmieni� wyposa�enie �o�nierza i jego niekt�re statystyki. Zmodyfikowa� mo�emy warto��
parametr�w: Time Units, Health, Firing i Throwing Accuracy. Inne, takie jak Strength, s� wy��czone, poniewa� nie wiemy jaki wp�yw maj�
na rozgrywk�. Edycja statystyk nast�puje po klikni�ciu lewym przyciskiem myszy na na dane znajduj�ce si� po prawej stronie ekranu. 

Ka�dy z parametr�w musi mie� warto�� wi�ksz�, lub r�wn� 50 i mniejsz�, b�d� r�wn� 80. Suma czterech parametr�w musi zamyka� si� w 240.
Nie ma jednak ogranicze� dla ilo�ci i rodzaju ka�dej z broni dla Twoich jednostek, wi�c podczas fazy Planowania Misji sugerowane jest
bra� poprawk� na uzbrojenie przeciwnika. 

F2 Zapis oddzia�u do pliku 
F3 Wgranie ju� poprzednio zapisanego oddzia�u 

Lewy CTRL; Lewy ALT - pokazuje maksymaln� ilo�� obra�e�, jak� mo�e zada� bro� - te klawisze dzia�aj� tak�e podczas gry. 


=============== 
Klawiszologia 
=============== 

Wszystkie akcje, tak jak w UFO1, s� wykonywane za pomoc� myszy. 
Mo�esz wysy�a� i otrzymywa� wiadomo�ci do/od przeciwnika. Wystarczy wpisa� wiadomo�� i nacisn�� enter. 

Te klawisze s� u�ywane podczas gry: 

F1 On/Off Raw packets show 
F4 Od�wie�enie ekranu 
F5 Restart 
F10 ryb pe�noekranowy/okienkowy 
ESC Wyj�cie do menu g��wnego 
ALT-X Szybkie wyj�cie z gry 

Kursory i +/- na klawiaturze numerycznej - zmiana wielko�ci ekranu gry 

Prawy CTRL - zmiana j�zyka (je�li uaktywnione w INI). 

Lewy CTRL - pokazuje drog� wybranej postaci do wybranej kratki z uwzgl�dnieniem kosztu w TU (Time Units - Jednostki Czasu). 

W trybie celowania pokazuje trajektori� strza�u lub rzutu. Na ekranie ekwipunku, pokazuje obra�enia zadawane przez przedmiot. 

Lewy SHIFT - pozwala na precyzyjne celowanie je�li przytrzymany przed strza�em. 

ENTER - wys�anie wiadomo�ci 

BACKSPACE - usuni�cie ostatniego znaku w wiadomo�ci 

F11 - Tryb powiadamiania w��czony/wy��czony. U�ywany do sprawdzania po��czenia. (Sends "NOTE" packet each second to remote computer and
receive the responce. If such packet do not come through, the counter of seconds activated starting from last packet received and shown
in top right corner of Info window. If it is necessary to fulfill ceaseless modem command in terminal, e.g. "atdp123456", better turn the
notifying mode off in advance.) 

F12 - Zrzut ekranu do pliku "snapshot.pcx" 

=============== 
Plik INI 
("ufo2000.ini") 
=============== 

[General] 
port=2000 # Port IP 
server=10.0.0.2 # Domy�lne IP serwera 
width=500 # Szeroko�� ekranu gry 
height=280 # Wysoko�� ekranu gry 
map_width=4 # Szeroko�� mapy 
map_height=4 # Wysoko�� mapy - map_width*map_height <= 36 ! 
russian=no # no wy��cza zmian� CTRL rus/lat, yes - w��cza 
bloodymenu=no # no - bloody menu wy�., yes - w��czone! 
sound=yes # yes - d�wi�k w�., no - wy��czony 
comport=2 # port COM modemu (nie dla wersji Windows) 
# 1 - COM1, 2 - COM2, 3 - COM3, ... 
digvoices=16 # ^2 (2, 4, 8, ...) ilo�� g�os�w (number of voices for fx) 
modules=no # nie u�ywane 
modvoices=8 # " 
modname=templsun.xm # " 
modvolume=125 # " 
speed_unit = 30 # Ustala szybko�� jednostki. *1 
speed_bullet = 30 # Szybko�� pocisk�w. 
speed_mapscroll = 30 # Szybko�� scrollingu/przesuwu mapy. 
mapscroll = 10 # 

[Editor] 
platoon_size=8 # ilo�� �o�nierzy z "soldier.dat" *2 
last_map_name = c:\ufo2000\geoscape.dat # nazwa ostatniej mapy 
last_unit_name = team_ru.units # ostatnie nazwy jednostek 

[Flags] 
F_FULLSCREEN = 0 # Ustaw na 1 by uruchamia� gr� w trybie pe�noekranowym 
F_FILECHECK = 1 # Ustaw na 0 by wy��czy� sprawdzanie integralno�ci danych na starcie 
F_SELECTENEMY = 1 # Ustaw na 0 by wy��czy� niebieskie markery nad g�owami wroga. 

*1: Mo�e by� zmienione w opcjach podczas gry. 
*2: Format pliku "soldier.dat" jest taki sam jak ten z UFO1, wie� mo�esz u�y� "soldier.dat" z UFO. Pami�taj jednak wpisa� poprawny
platoon_size w ufo2000.ini (r�wny liczbie �o�nierzy w "soldier.dat"). 

--KONIEC PLIKU--
