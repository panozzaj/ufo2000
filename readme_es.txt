
              **************************************************
              **                UFO2000 0.4.0                 **
              **             aka X-COM: Gladiators            **
              **        http://ufo2000.sourceforge.net/       **
              **              Manual en Castellano            **
              **************************************************

             Copyright (C) 2000-2001  Alexander Ivanov aka Sanami
             Copyright (C) 2002-2004  ufo2000 development team

El desarrollo de UFO2000 continua tras cerca de un a�o de inactividad. 
Ahora UFO2000 ha regresado y con la ayuda de nuevos desarrolladores, 
"ufo2000 development team" para acortar. Para la informaci�n 
sobre qui�n ha contribu�do a UFO2000, lea el fichero AUTHORS en el directorio
UFO2000. El autor original, Alexander Ivanov, actualmente no est� 
involucrado en el proceso de desarrollo, pero ha creado un excelente trabajo,
y le damos las gracias! Sin su excelente trabajo, este juego jam�s podr�a 
haber existido.

Este juego es software libre (GPL). Para m�s informaci�n sobre la licencia 
de uso, lea el fichero COPYING, que se encontrar� en el directorio de UFO2000. 

Cualquier persona puede formar parte en el desarrollo de UFO2000 development.
Toda ayuda ser� bien recibida. Por favor, visite la p�gina: http://ufo2000.sourceforge.net/.
Ah� podr� subscribirse a la lista de correo de ufo2000 y poder comunicar 
sus ideas, fallos y parches.

Vea el fichero ChangeLog para ver la lista completa de cambio.


===============
Acerca de
===============

UFO2000 es un remake multijugador de la parte t�ctica del juego de Microprose,
 X-COM: UFO Defense (UFO: Enemy Unknown).

Necesitar�s tener instalados el X-COM original para jugar a UFO2000. Podr� funcionar
con la versi�n demo de X-COM, pero tan solo podr�s jugar en los escenarios tipo
ciudad, y utilizar una cantidad limitada de unidades. Se recomienda en cualquier caso
tener la versi�n completa de X-COM.

El juego compila y funciona en Windows, Linux el sistema operativo FreeBSD.
Probablemente el juego funcionar� en otros sistemas como UNIX. Si es capaz 
de compilar y ejecutar UFO2000 en uno de ellos, por favor, haganoslo saber.

M�s detalles referentes a la compilaci�n de UFO2000 puede encontrarse en el fichero
INSTALL en el directorio de UFO2000.

==============
MENU DE INICIO
==============

Tras iniciar el juego, aparecer�n varias opciones:

  Conectarse a un servidor de internet

	El juego puede conectarse a un servidor de internet o a una red de �rea local
	(para iniciar tu propio servidor, ejecuta ufo2000-srv inclu�do en la instalaci�n)
	Tras elegir esta opci�n, aparecer� conectarse al servidor ("connect to server").
	Hay que introducir la direcci�n; lnxt.info se utiliza por defecto, es actualmente
	el servidor oficial de ufo2000 en internet. Si quieres jugar en una red local, tendr�as
	que iniciar el servidor en un ordenador y su direcci�n ip con lo conectes desde otro
	ordenador.
	Los otros dos campos son nombre de usuario (login) y contrase�a (password). Se utilizan
	para identificar al usuario para las estad�sticas (http://ufo2000.lxnt.info/results.php,
	en la actualidad.) El nombre de usuario debe tener una longitud m�nima de 6 caracteres.
	Tras conectarse correctamente, aparecer� la ventana de chat.

  Iniciar juego Hotseat

	Inicia una parta en un solo ordenador. (no requiere una red) El jugador debe alternar el juego
	cada turno. Tras hacer click en esta opci�n, aparecer� directamente el planificador de misiones.

  Cargar partida grabada
	Carga una partida grabada. Tan s�lo funciona en partidas hotseat.

  Quit

	Sin comentarios ;)

===============
Chat
===============

Tras conectarse al servidor de ufo2000, ver�s una consola de chat y una lista de jugadores
conectados al servidor. El estado de cada jugador est� determinado por el color de su nombre:

Blanco - ese es tu propio nombre
Gris - disponible para hablar
Amarillo - has retado a �ste jugador
Verde - puedes aceptar un reto de �ste jugador
Rojo - est� ocupado jugando con alguie.

Para retar a un jugador, tan solo haz click en su nombre (se volver� amarillo.) Si alguien
tiene el nombre en verde, significa que te ha retado. Tras hacer click en su nombnre, el juego
se iniciar� y la pantalla de chat ser� reemplazada por el planificador de misiones.


===============
Planificador de Misiones
===============

Aqu� podr� elegir sus soldados, determinar las ubicaciones de inicio, y editar 
sus estad�sticas y armamento pulsando la tecla de CTRL izquierda 
y haciendo click a la vez en el soldado elegido. (vea m�s abajo la secci�n Editor de Unidades)

Para ubicar las unidades, presione el bot�n izquierdo del rat�n en el nombre de la unidad
y confirme el punto de inicio en el mapa haciendo nuevamente click. Para des-seleccionar
el soldado, haga click con el bot�n derecho del rat�n en el nombre.


Informaci�n sobre las unidades del jugador:
   1) "total men points=..." La suma totales de par�metros (TU, Vida,.. )
      de las unidades elegidas.
   2) Numero de armas de cada tipo por las unidades seleccionadas.


Opciones de Partida (Match settings):

 1) Nombre del escenario elegido:
	Click para elegir el escenario y usar las opciones del escenario
 2) Nombre del mapa elegido:
	Click para elegir el terreno y el tama�o del mapa o para generar/cargar
	un nuevo mapa.
 3) Reglas ("Game Rules"):
	Click para especificar las reglas, como l�mite de turnos, tiempo, etc.

Para generar un mapa nuevo, haga click en "NEW", para cargar pulse en "LOAD". Si tiene 
adjustado el tama�o del mapa en el fichero de ufo2000.ini file, pero a�n tiene su antiguo mapa 
presiona "NEW" o cargue el mapa que dese�.

Tras terminar, haga click en su parte (cliente/servidor) "SEND" 
para emitir sus datos locales al otro jugador. "SEND" entonces aparecer� en verde. 
Para iniciar la partida, los jugadores deben hacer click en "START" tras tener todas
las opciones de "SEND" en verde. El juego solo empezar� cuando estas opciones est�n en
verde. Adjustar sus jugadores, o cambiar de mapa volver� a colorear todas las palabras en rojo

Para volver al men� principal, pulse ESC.


===============
Editor de Unidades
===============

Puede acceder a esta opcion desde la pantalla de Despliegue. Mantenga pulsado CTRL 
y haga click en el soldado que desee editar.

Ahora podr� editar los par�metros del soldado. Los par�metros que puede cambiar son:
Unidades de Tiempo, Salud, Disparo, y Lanzamiento, Precisi�n. 
Otros par�metros como Fuerza est�n bloquedados porque no sabemos c�mo funcionan 
en el juego. Si, tras ordenar su equipamiento, desea editar las estad�sticas de nuevo, 
haga click en la parte derecha.

Cada par�metro est� restringido a ser >= 50 y <=80. La suma 
de estos valores tiene un cierto l�mite en cada unidad, as� que no puedes maximizar
todos los par�metros. Puedes grabar y cargar varias configuraciones de unidades
con las siguientes teclas:

F2          Grabar
F3          Cargar

===============
Controles de Juego
===============

Todas las acciones, como en X-COM, se realizan mediante el rat�n. Es posible
enviar y recibir mensajes del otro jugador durante el juego,
tan solo escriba su mensaje con el teclado, y pulse intro.

Estas son las teclas utilizadas en el juego:

F10         Pantalla Completa/Modo Ventana

ESC         Salir al Menu principal

Cursores &   cambiar el tama�o del mapa de la pantalla
Teclado Num�rico +/-  

F1          Activar/Desactivar  Muestra paquetes Raw
F4          Redibuja la pantalla
F5          Reiniciar


ALT-X       Escape r�pido al SO


CTRL Derecho Cambio entre dos mapas de teclado elegidos como teclado primario (primay_keyboard)
F9	     y secundario en el archivo ufo2000.ini

CTRL Derecho + 'b', 'd', 'e', 'p' or 'r' Cambia el mapa de teclas: Bielorruso, Alem�n,
        Ingl�s, Polaco y Ruso (otros lenguajes pueden ser elegidos
        en el fichero ufo2000.ini)

CTRL Izquierdo   Muestra la ruta de la unidad elegida hacia donde se encuentra el curso mostrando
                 el coste de TU.En modo punto de mira, mostrar� la trayectoria de sus disparos
  y objetos arrojables. En la pantalla de inventario, mostrar� el valor de da�o.
  (ALT GR)

SHIFT Izquierdo  Permite punter�a precisa si se mantiene hasta pulsar el bot�n de disparo
  con el bot�n derecho del rat�n.

SHIFT Izquierdo  + teclas cursor Mueve la pantalla del mapa

INTRO       Enviar mensaje
BORRAR      elimina el ultimo caracter en el mensaje

F12         hace una captura de pantalla como "snapshot.pcx"


===============
Fichero INI
("ufo2000.ini")
===============

(Asteriscos indican notas mostradas al final de la secci�n. '*1')

[General]
port=2000            #IP Port (no para la versi�n Windows)
server=10.0.0.2      #Direcci�n IP por defecto del Servidor (no para la versi�n de Windows)
width=500            #Ancho de la pantalla de Batalla
height=280           #Altura de la pantalla de Batalla
map_width=4          #   "NEW" tama�o del mapa al pulsar en NEW
map_height=4         #   anchura y altura no deben exceder de 36 !
sound=yes            #si - soundos fx activados, no - desactivados
speed_unit = 30      #Velocidad de la unidad *1
speed_bullet = 30    #Como lo de arriba, pero para proyectiles.
speed_mapscroll = 30 #Como lo de arriba, pero para el scroll del mapa.
mapscroll = 10       #

[Editor]
platoon_size=8       #numero de soldados en el fichero "soldier.dat" *2
last_map_name = c:\ufo2000\geoscape.dat  #Nombre del �ltimo mapa
last_unit_name = team_ru.units           #nombre de la �ltima unidad

[Flags]
F_FULLSCREEN = 0  # Poner a 1 para iniciar el juego a pantalla completa
F_FILECHECK = 1   # Poner a 0 para desactivar el chequeo de la integridad de ficheros al iniciar
F_SELECTENEMY = 1 # Poner a 0 para desactivar marcas azules en soldados enemnigos

*1: Puede ser ajustado en juego, en el men� de opciones.
*2: El formato del fichero "soldier.dat" es el mismo que el de
UFO1, as� que puede usar cualquier "soldier.dat" de cualquier juego. No obstante, debe 
ajustar platoon_size (tama�o del pelot�n) en ufo2000.ini (e.g. numero de soldados 
en "soldier.dat").

--FIN DEL FICHERO--
