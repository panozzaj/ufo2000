
              **************************************************
              **                UFO2000 0.4.0                 **
              **        http://ufo2000.sourceforge.net/       **
              **               Manual Portugu�s               **
              **************************************************

                                  $Rev: 439 $

             Copyright (C) 2000-2001  Alexander Ivanov aka Sanami
             Copyright (C) 2002-2004  ufo2000 development team

O desenvolvimento do UFO2000 continua depois de cerca de um ano de
inactividade. Agora o UFO2000 est� de volta e � melhorado pelos esfor�os
cooperativos de v�rias pessoas que o desenvolveram; a "ufo2000 development
team" para ser breve. Para informa��es sobre quem contribuiu para o UFO2000,
leia o ficheiro AUTHORS no direct�rio do UFO2000. O autor original,
Alexander Ivanov, actualmente j� n�o est� envolvido no processo de
desenvolvimento, mas ele j� fez um grande trabalho, muitos agradecimentos
para ele! Sem o seu excelente trabalho este jogo nunca teria existido.

Este jogo � software gr�tis (GPL). Para mais informa��es sobre a licen�a,
leia o ficheiro COPYING, localizado no seu direct�rio do UFO2000.

Qualquer pessoa pode tomar parte no desenvolvimento do UFO2000; qualquer
ajuda � apreciada. Por favor visite o site http://ufo2000.sourceforge.net.
L� pode inscrever-se na lista de correio do ufo2000 e apresentar os seus
coment�rios, ideias, falhas e actualiza��es.

Veja o ficheiro ChangeLog para uma lista completa de mudan�as.

===============
Acerca de
===============

O UFO2000 � um "remake" multijogador da parte t�ctica do jogo da
Microprose, X-COM: UFO Defense (UFO: Enemy Unknown).

Para jogar o UFO2000, necessita de ficheiros do X-COM original. O jogo
tamb�m funciona com ficheiros da demo do X-COM, mas apenas poder� jogar
no mapa 'Cidade' e usar um conjunto limitado de unidades. Ter uma vers�o
completa do X-COM � altamente recomendado.

O jogo compila e trabalha nos sistemas operativos Windows, Linux e FreeBSD.
Provavelmente o jogo tamb�m funcionar� em outros sistemas UNIX. Se
conseguiu compilar e executar o UFO2000 com sucesso num deles, por favor
informe-nos.

Informa��o detalhada sobre instalar o UFO2000 pode ser encontrada no
ficheiro INSTALL no direct�rio do UFO2000.

===============
Menu Principal
===============

Depois de iniciar o jogo, ver� um n�mero de op��es do menu dispon�veis:

   Connect to internet server (Ligar a um servidor de internet)

      O jogo pode-se ligar a um servidor na internet on numa rede local
      (para iniciar o servidor no seu computador, apenas execute o ficheiro
      'ufo2000-srv' incluido na distribui��o do ufo2000). Depois de
      escolher esta op��o, ver� a janela "connect to server". Tem que
      introduzir o endere�o do servidor; lxnt.info � o pr�-definido, �
      actualmente o servidor oficial de ufo2000 na internet. Se quer jogar
      numa rede local, tem que iniciar o servidor do ufo2000 num computador,
      e introduzir o seu endere�o IP para se ligar a ele a partir de um
      ufo2000 noutro computador.
     Os outros dois campos necess�rios s�o login e palavra-passe. Eles s�o
      usados para identificar o utilizador para recolher algumas estat�sticas
      do jogo (http://ufo2000.lxnt.info/results.php, actualmente). Login
      deve ser qualquer nome n�o usado pelos outros jogadores e palavra-
      -passe deve ter no m�nimo 6 caracteres. Depois de login e registo
      com sucesso, ver� o ecr� de chat do servidor de internet.

   Start hotseat game (Iniciar jogo "hotseat")

      Inicia o jogo num s� computador (rede n�o � necess�ria). O jogador
      actual muda depois de cada turno. Depois de clicar neste item, ser�
      movido directamente para o ecr� do planeador de miss�es.

   Load saved game (Carregar jogo guardado)

      Carrega um jogo previamente guardado. Funciona apenas para jogos
      "hotseat".

   Quit (Sair)

      Sem coment�rios ;)

================================
Conversa do Servidor de Internet
================================

Depois de ligar a um servidor ufo2000, ver� uma consola de chat e uma
lista de jogares ligados ao servidor. O estao de cada jogador �
determinado pela cor do seu nome:

nome de jogador branco   - � o seu pr�prio nome
nome de jogador cinzento - dispon�vel para conversa
nome de jogador amarelo  - enviou um desafio a este jogador
nome de jogador verde    - pode aceitar um desafio deste jogador
nome de jogador vermelho - o jgador est� ocupado a jogar com algu�m

Para desafiar um jogador, basta clicar no nome dele (que fica amarelo).
Se o nome de algu�m � verde, significa que ele o desafiou. Depois de
clicar no nome dele, o jogo come�a e a consola de chat ser�
substituida pelo ecr� do planeador de miss�es.

====================
Planeador de Miss�es
====================

Aqui pode seleccionar soldados, determinar as suas posi��es inicias, e
editar as suas estat�sticas/armas iniciais fixando o CTRL esquerdo e
clicando no soldado desejado (veja a sec��o Editor de Unidades abaixo).

Para colocar as suas unidades, clique no nome dele(a) com o bot�o direito
do rato e aponte para a posi��o inicial desejada no mapa. Clique de novo
para confirmar. Para deseleccionar o soldado clique com o bot�o direito
do rato no nome dele(a).

Informa��o sobre unidades:
   1) "total men points=..." Custo total de pontos para as unidades
   seleccionadas.
   2) N�mero de armas de cada tipo para as unidades seleccionadas.

Caixa "Match settings" (Defini��es de jogo):
   1)Nome do cen�rio seleccionado:
       Clique para escolher o cen�rio a ser usado e op��es do cen�rio.
   2)Nome do mapa seleccionado:
       Clique para seleccionar o mapa e tamanho do mapa; e para gerar
       um mapa novo ou carregar um mapa existente.

Depois de completar os seus planos, clique no bot�o "SEND" (ENVIAR) do
seu lado para enviar os seus dados ao outro jogador.
Se os seus soldados selecionados cumprem os requ�sitos do jogo, "SEND" ficar�
verde. Caso contr�rio ver� uma mensagem sobre o erro na consola de chat.
Para iniciar o jogo, os jogadoes t�m que clicar em "START" (INICIAR) depois
de todas as op��es "SEND" estarem verdes. O jogo s� come�ar� quando todas
estas op��es estiverem verdes. Ajustar os jogadores, mudar o mapa, cen�rio
ou regras do jogo vai reverter todas as op��es para vermelho.

Para voltar ao menu principal, clique em ESC.

==================
Editor de Unidades
==================

Pode aceder a isto a partir do ecr� do Planeador de Miss�es. Fixe o
CTRL e clique no soldado que deseja editar.

Entrando nisto, pode editar os par�metros do soldado e equipamento.
Par�metros activados para soldados s�o: Stamina, Time Units, Health
(Sa�de), Firing, Throwing Accuracy (Pontaria de Disparo e de Atirar) e
Reactions (Reac��es). Outros par�metros est�o desactivados porque n�o
sabemos como funcionam no jogo. Se, depois de organizar o seu equipamento,
deseja editar os seus "stats" de novo, clique no gr�fico da direita.

Cada par�metro � limitado para ser >= 50 e <= 80. A soma de todos
estes par�metros tem um certo limite para cada unidade, por isso n�o
pode definir todos os par�metros no m�ximo. Pode guardar e carregar
v�rias configura��es de unidades/equipas com estas teclas:

F2          Guardar
F3          Carregar

===================
Controlos de Jogo
===================

Todas as ac��es de unidades, como no X-COM, s�o controladas com o rato.
Pode enviar e receber mensagens para/de o outro jogador durante o jogo.
Apenas escreva a mensagem no teclado, depois clique em enter.

Estas teclas s�o usadas para controlo do jogo:

F10		Modo Ecr� Completo/Modo em Janela

ESC		Sair para o menu principal

Setas e		Mudar o tamanho do ecr� do mapa
Keypad +/-

CTRL Direito	Mudar r�pido entre dois teclados seleccionados em primary_keyboard
F9          	e secondary_keyboard no ficheiro ufo2000.ini.

CTRL Direito + 'b', 'd', 'e', 'p' or 'r'
		Mudar entre teclado Bielorusso, Alem�o, Ingl�s, Polaco e Russo
		(outros idiomas podem ser seleccionados no ficheiro ufo2000.ini)

CTRL Esquerdo	Mostrar rota do soldado seleccionado at� o bloco seleccionado
		com custo de TU (Time Units).
		No modo de apontar, mostra a traject�ria dos seus tiros e items
		atirados. No ecr� da inventoria, mostra valor de dano dos items.
		(ALT alternativo)

SHIFT Esquerdo	Permite um apontar preciso se fixado at� depois de disparar
        	com o bot�o esquerdo do rato.

SHIFT Esquerdo + setas
		"Scroll" na janela do mapa

ENTER		Enviar mensagem
BKSP		Remover �ltimo caract�r na mensagem

F12		Guardar uma imagem do ecr� no ficheiro "snapshot.pcx" 

===============
Ficheiro INI
("ufo2000.ini")
===============
[System]
keyboard = us		Idioma do teclado 
			(veja o ficheiro INI para as op��es poss�veis)

# dois teclados alternativos para alternar entre eles usando a tecla CTRL direito
primary_keyboard = us
secondary_keyboard = ru

[General]
width = 640				#Comprimento do ecr� do mapa
height = 360				#Largura do ecr� do mapa
map_width = 4				#Comprimento do mapa gerado
map_height = 4				#Largura do mapa gerado
speed_unit = 30				#Velocidade de anima��o do movimento de unidades
speed_bullet = 30			#Velocidade de anima��o do movimento de balas
speed_mapscroll = 30			#Velocidade de "scrolling"
mapscroll = 10				

# tipo de letra da consola, tem que ter um destes valores : default, xcom_small, xcom_large
consolefont = default

# tempo limite de cada turno, em segundos (valor negativo - sem limite)
time_limit = -1

# resolu��o de ecr� preferida, se n�o for poss�vel, 640x480 � utilizado
screen_x_res = 640			#Comprimento da resolu��o
screen_y_res = 400			#Largura da resolu��o

# defini��o de cores m�nima preferida para o modo de v�deo, se n�o pode
# ser seleccionada, modos de v�deo com valores mais altos s�o utilizados
color_depth = 16

# volume da m�sica (de 0 a 255)
music_volume = 255

# ficheiros para m�sica de fundo (.MIDI .XM .S3M .OGG .IT .MOD)
menu_music = $(ufo2000)/newmusic/gmstory.ogg	#menu principal
setup_music = $(ufo2000)/newmusic/gmenbase.ogg	#planeador de miss�es
editor_music = $(ufo2000)/newmusic/gmdefend.ogg	#editor de unidades
combat1_music = $(ufo2000)/newmusic/gmstory.ogg	#m�sica de combate
combat2_music = $(ufo2000)/newmusic/gmstory.ogg	#m�sica de combate alternativa
win_music = $(ufo2000)/newmusic/gmlose.ogg	#m�sica de vit�ria
lose_music = $(ufo2000)/newmusic/gmlose.ogg	#m�sica de derrota
net_music1 = $(ufo2000)/newmusic/gmgeo.ogg	#m�sica do ecr� de chat do servidor de internet
net_music2 = $(ufo2000)/newmusic/gmgeo.ogg	#m�sica alternativa do ecr� de chat do servidor de internet

# imagens de fundo
loading_image = $(ufo2000)/arts/text_back.jpg	#imagem de carregamento do jogo
menu_image = $(ufo2000)/arts/menu.jpg		#imagem do menu principal
endturn_image = $(xcom)/ufograph/tac00.scr	#imagem de fim do turno
win_image = $(xcom)/geograph/back01.scr		#imagem de vit�ria
lose_image = $(xcom)/geograph/back02.scr	#imagem de derrota

[Server]
host = lxnt.info		#endere�o do servidor
login = anonymous		#login do jogador
autologin = 0			#login autom�tico (1 = sim, 0 = n�o)
# defini��es de proxy http (tem que suportar m�todo CONNECT para funcionar)
# um destes 3 valores tem que ser definido:
#   host:port (nome do host e port da proxy http)
#   auto (retirar valor da vari�vel de ambiente http_proxy)
#   disabled (n�o usar proxy http)
http_proxy = disabled
password = 			#palavra-passe do jogador

[Editor]
platoon_size = 10		#tamanho de cada equipa (m�ximo � 10)
last_map_name = geodata.dat	#o �ltimo mapa (ficheiro) utilizado
last_unit_name = team_ru.units	#a �ltima equipa (ficheiro) utilizada

[Flags]
F_FULLSCREEN = 1		#Usar 1 para iniciar o jogo em modo ecr� completo
F_LARGEFONT = 0			#Usar 1 para usar o tipo de letra 'large' do ufo para janelas, consola e planeador
F_SMALLFONT = 0			#Usar 1 para usar o tipo de letra 'small'. Isto substitui a defini��o F_LARGEFONT
F_SOUNDCHECK = 0		#Executar verifi��o de sons no arranque se 1.
F_LOGTOSTDOUT = 0		#Copiar sa�da de init para stdout
F_PLANNERDBG = 0		#Permite colocar unidades (no planeador) em qualquer parte no mapa 

--FIM DO FICHEIRO--

