
              **************************************************
              **                UFO2000 0.3.XX                **
              **             aka X-COM: Gladiators            **
              **        http://ufo2000.sourceforge.net/       **
              **              Manual en Castellano            **
              **************************************************

             Copyright (C) 2000-2001  Alexander Ivanov aka Sanami
             Copyright (C) 2002-2003  ufo2000 development team

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

Este fichero fue revisado por Jeremy Walker, aka Kuroshi X.

===============
Acerca de
===============

UFO2000 es un remake multijugador de la parte t�ctica del juego de Microprose,
 X-COM: UFO Defense (UFO: Enemy Unknown).

Requiere los ficheros del juego X-COMIt de los directorioss:
   GEODATA GEOGRAPH MAPS SOUND TERRAIN UFOGRAPH UFOINTRO UNITS

La versi�n de Windows puede ser compilada tanto con Microsoft Visual C++ 6.0 como con 
el compilador gratuito Mingw GCCr.

El juego tambi�n compila y funciona en Linux el sistema operativo FreeBSD.
Probablemente el juego funcionar� en otros sistemas como UNIX. Si es capaz 
de compilar y ejecutar UFO2000 en uno de ellos, por favor, haganoslo saber.

M�s detalles referentes a la compilaci�n de UFO2000 puede encontrarse en el fichero
INSTALL en el directorio de UFO2000.

===============
Editor de Mapa
===============

Use el bot�n derecho del rat�n para seleccionar el suelo que desee cambiar, y 
aparecer� un men� de selecci�n. Entonces elija el suelo de 10x10 que desee.

F2          Graba
F3          Carga
ESC         Termina


===============
Chat
===============

Tras iniciar el servidor, pero antes de mover al planificador de misiones, 
existe esta ventana. Un jugador debe iniciar como Servidor, 
y el otro como Cliente, antes de poder empezar.

F4          volver a pintar la pantalla
F10         Iniciar partida
ESC         Cancelar


===============
Planificador de Misiones
===============

La siguiente pantalla tras la del Chat, es la del Planificador de Misiones.
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
de estos cuatro valores debe ser <= 240 para cada unidad. No hay restricciones 
por el tipo y numero de armas para sus unidades, por tanto, durante el 
Planificador de Misiones es recomendable que observe la selecci�n de las
armas del enemigo.

F2          Grabar
F3          Cargar

CTRL Izquierdo   Muestra el da�o de las armas (en el editor -- valor m�ximo), esto
ALT Izquierdo    tambi�n funciona en la pantalla de inventario durante el juego.


===============
Controles de Juego
===============

Todas las acciones, como en UFO1, se realizan mediante el rat�n. Es posible
enviar y recibir mensajes del otro jugador durante el juego,
tan solo escriba su mensaje con el teclado, y pulse intro.

Estas son las teclas utilizadas en el juego:

F1          Activar/Desactivar  Muestra paquetes Raw
F4          Redibuja la pantalla
F5          Reiniciar
F10         Pantalla Completa/Modo Ventana
ESC         Salir al Menu principal
ALT-X       Escape r�pido al SO

Cursores &   cambiar el tama�o del mapa de la pantalla
Teclado Num�rico +/-  

CTRL Derecho + 'b', 'd', 'e', 'p' or 'r' Cambia el mapa de teclas: Bielorruso, Alem�n,
        Ingl�s, Polaco y Ruso (otros lenguajes pueden ser elegidos
        en el fichero ufo2000.ini)

CTRL Izquierdo   Muestra la ruta de la unidad elegida hacia donde se encuentra el curso mostrando
                 el coste de TU.En modo punto de mira, mostrar� la trayectoria de sus disparos
  y objetos arrojables. En la pantalla de inventario, mostrar� el valor de da�o.
  (ALT alternativo)

SHIFT Izquierdo  Permite punter�a precisa si se mantiene hasta pulsar el bot�n de disparo
  con el bot�n derecho del rat�n.

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
