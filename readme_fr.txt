              **************************************************
              **                UFO2000 0.4.0                 **
              **             aka X-COM: Gladiators            **
              **        http://ufo2000.sourceforge.net/       **
              **              Manuel en fran�ais              **
              **************************************************

                                  $Rev: 324 $

             Copyright (C) 2000-2001  Alexander Ivanov aka Sanami
             Copyright (C) 2002-2004  ufo2000 development team

		Traduit par Benjamin Power et JFarceur

Le d�veloppement de UFO2000 reprend apr�s pr�s d'un an d'inactivit�.
UFO2000 est maintenant de retour et est am�lior� gr�ce aux efforts
coop�ratifs de plusieurs d�veloppeurs, la "ufo2000 development team"
pour faire court. Pour plus d'informations sur qui a contribu� � UFO2000,
lisez le fichier AUTHORS dans le r�pertoire UFO2000. Le premier auteur,
Alexander Ivanov, n'est pas impliqu� en ce moment dans le processus de
d�veloppement, mais il a d�j� fourni un �norme travail, donc merci
� lui! Sans son excellent travail ce jeu n'aurait jamais exist�.

Ce jeu est un logiciel en distribution libre (GPL). Pour plus d'informations 
sur la licence, lisez le fichier COPYING, situ� dans le r�pertoire
UFO2000.

N'importe qui peut prendre part dans le d�veloppement de UFO2000.
Toute aide serait appr�ci�e. Veuillez visitez la page web
http://ufo2000.sourceforge.net/ o� vous pouvez vous inscrire �
la liste de diffusion par courriel ("mailing list")de UFO2000 
et faire parvenir vos commentaires,id�es, rapports de bugs et patchs.

Voir le fichier Changelog pour la liste compl�te de mises � jour.

===============
� Propos
===============

UFO2000 est un remake multijoueur de la partie tactique du jeu de
Microprose, X-COM: UFO Defense (UFO: Enemy Unknown).

Vous avez besoin des fichiers de donn�es de la version originale de X-COM pour
pouvoir jouer � UFO2000. Le jeu peut aussi fonctionner avec les fichiers de
donn�es de la d�mo de X-COM, mais vous ne pouvez dans ce cas que jouer sur la
carte 'City' et n'utiliser qu'un nombre limit� d'unit�s. La possession de la
version compl�te de X-COM est donc vivement recommand�e.

Le jeu compile et fonctionne sous les syst�mes d'exploitation Windows,
Linux et FreeBSD. Le jeu peut probablement aussi marcher sous d'autres
syst�mes semblables � UNIX. Si vous avez r�ussi � compiler et ex�cuter
UFO2000 sous un de ces derniers, veuillez nous en faire part.

De l'information plus d�taill�e sur l'installation de UFO2000 peut �tre trouv�e
dans le fichier INSTALL depuis le r�pertoire UFO2000.

=========
Main Menu (Menu Principal)
=========

Apr�s avoir lanc� le jeu, vous verrez un certain nombres d'options dans le menu:

   Connect to internet server (Se connecter au serveur internet)

      Le jeu peut se connecter � un serveur sur internet ou sur un r�seau
      local (pour le d�marrer de votre ordinateur, lancez l'ex�cutable
      'ufo2000-srv' inclus dans la distribution de ufo2000). Apr�s avoir
      s�lectionn� cette option du menu, vous verrez un dialogue de connexion.
      Vous devez entrer une adresse de serveur, lxnt.info est utilis� par d�faut
      et est pour le moment le serveur officiel de ufo2000 sur internet. Si vous
      voulez jouer en r�seau local, vous devez commencer un serveur ufo2000 sur
      un ordinateur et entrer son adresse IP pour s'y connecter depuis ufo2000.
      Les deux autres champs requis sont login et password. Ils sont utilis�s
      pour identifier un joueur et garder des statistiques
      (http://ufo2000.lxnt.info/results.php en ce moment). Le nom de login
      doit �tre un nom inutilis� par les autres joueurs et le mot de passe doit
      avoir au moins 6 caract�res. Apr�s un login ou enregistrement effectu�,
      vous verrez l'�cran de chat du serveur internet.

   Start hotseat game (D�marrer un jeu hotseat)

      Commence le jeu sur un seul ordinateur (pas de r�seau n�cessaire). Les
      joueurs alternent � la fin leur tour. Apr�s avoir cliqu� cette option
      du menu, vous allez directement � l'�cran de planification de mission.

   Load saved game (Charger une partie sauvegard�e)

      Charge une partie sauvegard�e au pr�alable. Ne marche que pour les
      parties hotseat.

   Quit (Quitter)

      Pas de commentaires ;)

====================
Internet Server Chat (Chat du serveur internet)
====================

Une fois connect� � un serveur ufo2000, vous verrez une console de chat
et une liste de joueurs connect�s au m�me serveur. Le statut de chaque
joueur est d�termin� par la couleur de son nom:

nom de joueur blanc - votre propre nom
nom de joueur gris  - disponible pour chat
nom de joueur jaune - vous avez envoy� un d�fi � ce joueur
nom de joueur vert  - vous pouvez accept� un d�fi de ce joueur
nom de joueur rouge - le joueur est occup� � d�fier une autre personne.

Pour d�fier un joueur, cliquez seulement sur son nom, qui deviendra jaune.
Si le nom de quelqu'un est vert, cela signifie qu'il vous a d�fi� et
apr�s avoir cliqu� sur son nom, le jeu commencera et la console de chat
sera remplac�e par l'�cran de planification de mission.

Le joueur qui lance le d�fi (la premi�re qui clique sur le nom de l'autre)
sera l'h�te de la partie, tandis que le second sera le client.
===============
Mission Planner (Planificateur de mission)
===============

Ici vous pouvez s�lectionner vos soldats, choisir leurs emplacements de
d�part et modifier leurs statistiques/armes de d�part en maintenant
la touche CTRL(gauche) et en cliquant sur le soldat voulu (voir
la section sur l'Editeur d'Unit�s ci-dessous).

Pour placer vos unit�s cliquer avec le bouton gauche de la souris sur son
nom puis pointer sur la place d�sir�e sur la carte. Cliquer de nouveau pour
confirmer. Pour d�s�lectionner un soldat faites un clic droit sur son nom. 
Notez que vous ne pouvez placer vos soldats que dans 10 (dix) premi�res
cases de votre c�t� (celles du c�t� que vos noms de joueurs sont affich�s).

Info sur les unit�s du joueur (affich�e sous les noms de soldats):
    1) "total men points=..." (Somme totale de points) La somme totale des
       param�tres (TU [unit� d'action], Health [vie],...)
    2) Nombre d'armes de son type pour les unit�s choisies.

Pour g�n�rer une nouvelle carte cliquer "NEW". La taille de la carte est 
ajustable dans le fichier ufo2000.ini. L'option "LOAD" (charger) ne fonctionne
pas pour le moment. Vous devrez vous contenter de cartes al�atoires.

Apr�s avoir termin� vos plans cliquer sur le mot "SEND" de votre c�t�
(serveur/client) pour envoyer vos donn�es � l'autre joueur. "SEND"
deviendra alors vert. Pour commencer la partie, les joueurs doivent
cliquer sur "START" apr�s que tous les mots "SEND" soient verts. Le jeu
ne d�butera que si toutes les options sont vertes. Modifier vos joueurs
ou changer la carte r�initialisera les options au rouge.

Notez que m�me en hotseat, les options send/start doivent �tre mises au vert.

Pour retourner au menu principal, appuyez sur ESC.

===============
Unit Editor     (Editeur d'Unit�s)
===============

Vous pouvez acc�der � ce menu depuis l'�cran de positionnements des unit�s.
Maintenez CTRL(gauche) et cliquer sur le soldat que vous voulez �diter.

En entrant dans l'�diteur vous pouvez modifier les param�tres de vos soldats
et son �quipement. Les param�tres concern�s pour vos soldats sont:

Name (Nom)			Le nom du soldat

Skin (Apparence)		L'apparence du soldat d�termine non seulement
				l'image utilis�e sur le jeu, mais aussi l'armure
				dont disposera le soldat. Comme l'armure risque 
				fortement de d�balancer le jeu, il est conseill�
				aux joueurs de s'entendre sur le type d'armure
				utilis�e pendant la partie.

Time Units (Unit�s de temps)	D�terminent surtout la distance maximale
				que le soldat peut parcourir pendant un tour.
  (TU's)			Toute action n�cessite des unit�s de temps, mais
				la majorit� de celles-ci consomment un pourcentage
				des unit�s de temps (toutes sauf le d�placement).
				Garder suffisamment d'unit�s de temps � la fin
				d'un tour permet au soldat de pouvoir faire un
				tir de r�action. Les unit�s de temps se rechargent
				au complet � chaque tour. 

Stamina/Energy (Endurance)	D�termine le niveau d'endurance � la course du
				soldat. Chaque pas d'un soldat co�te quelques
				points d'endurance (� l'instar des TU's), mais 
				celle-ci ne se reg�n�re pas au complet au d�but
				d'un tour (au contraire des TU's). Si vous n'avez
				plus d'endurance, votre soldat ne peut plus marcher
				pendant le tour en cours.

Bravery (Courage)		Le courage n'est pas encore impl�ment�.

Reactions (R�actions)		Si votre soldat dispose suffisamment d'unit�s de 
				temps � la fin du tour, il a la chance de faire un 
				tir de r�action pendant le tour de l'ennemi, si un
				ennemi passait dans le champ de vision du soldat. 
				La probabilit� qu'un tir de r�action ait lieu d�pend 
				du nombre de TU's restants et du niveau de R�actions
				du soldat.

Firing (capacit� de tir)	Plus cette valeur est haute, plus le soldat a de
				chances de toucher sa cible avec des armes � feu. 
				Notez qu'un soldat � genoux a un bonus � sa pr�cision
				au tir.

Throwing (pr�cision de lancer)	Plus cette valeur est haute, plus le soldat a de chances
				de lancer un objet (grenade ou autre) au bon endroit.

Strenght (Force)		L'�quipement qu'un soldat peut porter d�pend de la
				force dont il dispose. Le poids total de son �quipement
				(WEIGHT) ne doit pas d�passer l'attribut de force du
				soldat, sinon une p�nalit� de TU's sera faite au d�but
				de chaque tour, de telle sorte que (force/poids = TU/TU_max).
				Notez qu'un point de force co�te deux points, au 
				contraire des autres statistiques.

D'autres param�tres sont d�sactiv�s parce que nous savons pas exactement comment ils 
fonctionnent dans le jeu (tels que le courage et le moral). 

Pour modifier l'�quipement, cliquez sur l'objet que vous voulez et glissez le
dans l'inventaire du soldat. Notez que certaines armes n�cessitent des munitions.
Pour charger les armes, d�poser des munitions sur une arme dans l'�quipement du 
soldat. Pour v�rifier si elle est charg�e, cliquez dessus, l'image des munitions
devrait appara�tre � droite. 

Chaque param�tre est restreint � �tre >= 50 et <= 80 (la force est de 25 � 40).
La somme de ces param�tres a une certaine limite pour chaque unit�,
donc vous ne pouvez pas mettre toutes les comp�tences au maximum. Il n'y a pas
de restrictionspour le type ou le nombre de chaque arme pour vos unit�s (sauf
pour ce qui est de la force des soldats),donc pendant la phase de Planification
de Mission il est conseill� de regarder la s�lection adverse d'armes, et de
discuter du choix des armes et des armures, afin que la partie soit la plus
int�ressante possible.

F2            Save (Sauvegarder l'�quipe)
F3            Load (Charger une �quipe existante)

CTRL Gauche   Montre le "item damage status", statut des d�g�ts d'un objet
ALT  Gauche   (dans l'�diteur -- valeur maxi), fonctionne aussi dans l'�cran de
              l'inventaire pendant une partie.

===============
Game Controls   (Commandes de jeu)
===============

Toutes les actions des unit�s, comme dans X-COM, sont dirig�es � l'aide de la
souris. Vous pouvez aussi envoyer et recevoir des messages �/de l'autre joueur
pendant la partie en tapant votre message au clavier puis en validant avec entr�e.

Ces touches sont utilis�es pour contr�ler le jeu:

F10         Mode plein �cran/fen�tr�e
ESC         Retour au menu principal

Touches directionnelles   	Change la taille de l'�cran de la carte
Clavier num�rique +/-		Notez qu'en minimisant la taille de l'�cran, vous aurez
				acc�s � une mini-carte � droite, qui affichent les
				unit�s et votre champ de vision.


CTRL Droit  Echange rapide entre les deux plans de clavier choisis dans le fichier
            ufo2000.ini avec primary_keyboard et secondary_keyboard .

CTRL Droit + 'b', 'd', 'e', 'p' or 'r' Echanger entre les plans de claviers bi�lorusse,
                     allemand, anglais, polonais et russe (d'autres langues
                     peuvent �tres choisies dans le fichier ufo2000.ini)

CTRL Gauche   Montre le chemin du soldat s�lectionn� � la cellule du pointeur avec le
              co�t en TU. Dans le mode de vis�e, montre la trajectoire de vos tirs et de
              vos objets lanc�s. Dans l'inventaire, montre le "item damage value", statut
              des d�g�ts d'un objet (ou alternativement avec ALT).

SHIFT Gauche 	Permet une vis�e pr�cise si maintenu pendant le mode vis�e, 
		avec une arme � feu.

ENTER       Envoye un message.
BKSP        Supprime dernier caract�re d'un message.

F12         Sauvegarde la capture d'�cran dans le fichier "snapshot.pcx"

PageUP/PageDOWN		Change "d'�tage" plus rapidement.

===============
INI file
("ufo2000.ini")
===============
[System] = 
keyboard = us		Change la langue du clavier 
			(voir le fichier pour les choix disponibles)

# les 2 claviers alternatifs atteignables avec CTRL droit pendant le jeu
primary_keyboard = us
secondary_keyboard = ru

[General]
width = 640				#Largeur de l'�cran de jeu au d�marrage
height = 360				#Hauteur de l'�cran de jeu au d�marrage
map_width = 4				#Largeur des cartes g�n�r�es au hasard
map_height = 4				#Hauteur des cartes g�n�r�es au hasard
speed_unit = 30				#La vitesse de l'animation des soldats
speed_bullet = 30			#La vitesse de l'animation des balles	
speed_mapscroll = 30			#La vitesse de d�filement de la carte en jeu
mapscroll = 10				

# La police d'�criture de la console doit �tre parmi celles-ci : default, xcom_small, xcom_large
consolefont = default

# La limite de temps par tour (valeur n�gative = temps illimit�)
time_limit = -1

# r�solution de l'�cran d�sir�e, si possible. Sinon 640x480 est utilis�e
screen_x_res = 640
screen_y_res = 400

# Profondeur de couleur minimale d�sir�e. Si impossible,
# des modes vid�o avec des profondeurs plus �lev�es sont utilis�es.
color_depth = 16

# Fichiers musicaux utilis�s pour les divers moment du jeu (.MIDI .XM .S3M .OGG .IT .MOD)
menu_music = $(ufo2000)/newmusic/WISDOM.XM	#menu d'ouverture du jeu
setup_music = $(ufo2000)/newmusic/mindbox.S3M	#�cran de positionnement des soldats
editor_music = $(xcom)/sound/gmdefend.mid	#�diteur (non disponible)
combat_music = $(ufo2000)/newmusic/ATeX.OGG	#musique de combat
win_music = $(xcom)/sound/gmwin.mid		#musique de victoire
lose_music = $(ufo2000)/newmusic/areda.S3M	#musique de d�faite
net_music1 = $(xcom)/sound/gmgeo1.mid		#musique sur le serveur internet
net_music2 = $(xcom)/sound/gmgeo2.mid		#musique alternative sur internet

# images d'arri�re-plan
loading_image = $(ufo2000)/arts/text_back.jpg	#image au chargement du jeu
menu_image = $(ufo2000)/arts/menu.jpg		#image du menu principal
endturn_image = $(xcom)/ufograph/tac00.scr	#image de fin de tour
win_image = $(xcom)/geograph/back01.scr		#image de victoire
lose_image = $(xcom)/geograph/back02.scr	#image de d�faite

[Server]
host = lxnt.info		#adresse du serveur
login = JFarceur		#nom de login
autologin = 1			#login automatique : 1 pour oui, 0 pour non
# http proxy settings (it must support CONNECT method to work)
# one of the following 3 values should be set: 
#   host:port (host name and port of http proxy)
#   auto (take value from http_proxy environment variable)
#   disabled (do not use http proxy)
http_proxy = disabled
password = 

[Editor]
platoon_size = 10		#taille de l'�quipe (conseill� de laisser � 10)
last_map_name = geodata.dat	#la derni�re carte utilis�e
last_unit_name = team_ru.units	#la derni�re �quipe utilis�e

[Flags]
F_FULLSCREEN = 0  # Plein �cran au d�marrage du jeu ( 1 pour oui , 0 pour non )
F_LARGEFONT = 0   # Configurez � 1 pour utiliser la police large de ufo pour les dialogues et la console
F_SMALLFONT = 0   # Configurez � 1 pour utiliser la police petite de ufo, annule F_LARGEFONT
F_SOUNDCHECK = 0  # Ex�cute un test des sons si configur� � 1
F_LOGTOSTDOUT = 0 # Copie les "init output" dans le fichier stdout (pour retracer des bugs)
F_PLANNERDBG = 1  # Permet de placer ses unit�s partout sur la carte. 


