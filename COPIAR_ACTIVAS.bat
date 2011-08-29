@ECHO OFF

REM Coded by Sergi. 12/08/2011
set VERSION=0.7v
SET DEBUG=ON
 
REM MENU ETIQUETES
:MENU
cls
echo.
ECHO ver. '%VERSION%'
echo #### MENU ETIQUETES ####
echo.
echo 1.- Utilitzar l'etiqueta de Pinyana Hueso
echo 2.- Utilitzar l'etiqueta de Pinyana SIN Hueso
echo 3.- Etiqueta Lliure (Sergi)
ECHO 4.- SORTIR
echo.
echo ########################
echo.
echo.
echo.
echo #### MENU ETIQUETES PER DEFECTE ####
echo.
echo 5.- ETIQUETA RIBERA1
echo 6.- ETIQUETA RIBERA2
echo.
echo ####################################

set choice=
set /p choice="Elegeix una Opcio: "
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto :HUESO
if '%choice%'=='2' goto :NOHUESO
if '%choice%'=='3' goto :PREPACKING
if '%choice%'=='4' goto :END2
if '%choice%'=='5' (
		   SET ETIQUETA=RIBERA1
		   goto :MAQUINA
                   ) 
if '%choice%'=='6' (
	           SET ETIQUETA=RIBERA2
		   goto :MAQUINA
		   )

ECHO "%choice%" No es valida. Tria altre cop una opcio


REM COPIAR ETIQUETES PREPACKING

:PREPACKING
rem if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA.LAB" ( ECHO COPIANT ETIQUETES PREPACKING ! )
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA.LAB" ( copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA.LAB \\192.168.1.10\c\ETIQUETAS\ )
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA1.LAB" ( copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA1.LAB \\192.168.1.10\c\ETIQUETAS\)
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA2.LAB" ( copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA2.LAB \\192.168.1.10\c\ETIQUETAS\)
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA3.LAB" ( copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA3.LAB \\192.168.1.10\c\ETIQUETAS\)
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_PREPACKING.LAB" ( copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_PREPACKING.LAB \\192.168.1.10\c\ETIQUETAS\)
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA.LAB" ( ECHO ETIQUETES PREPACKING COPIADES !! )
rem PAUSE
REM if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_SAMO.LAB" ( GOTO :SAMO )
GOTO :SAMO

REM COPIAR ETIQUETES SAMO

:SAMO
rem if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_SAMO.LAB" ( ECHO COPIANT ETIQUETES SAMO ! )
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_SAMO.LAB" ( copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_SAMO.LAB \\192.168.1.10\c\ETIQUETAS\ )
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_SAMO.LAB" ( ECHO ETIQUETES SAMO COPIADES !! )
rem PAUSE
GOTO :MONOV

REM COPIAR ETIQUETES MONOCALIBRE VELLA

:MONOV
rem if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_MONOCALIBRE.LAB" ( ECHO COPIANT ETIQUETES MONOCALIBRE VELLA ! )
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_MONOCALIBRE.LAB" ( copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_MONOCALIBRE.LAB \\192.168.1.10\c\ETIQUETAS\ )
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_MONOCALIBRE.LAB" ( ECHO ETIQUETES MONOCALIBRE VELLA COPIADES !! )
rem PAUSE
GOTO :LINEAD

REM COPIAR ETIQUETES LINEAD

:LINEAD
rem if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_LINEAD.LAB" ( ECHO COPIANT ETIQUETES LINEAD ! )
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_LINEAD.LAB" ( copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_LINEAD.LAB \\192.168.1.10\c\ETIQUETAS\ )
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_LINEAD.LAB" ( ECHO ETIQUETES LINEAD COPIADES !! )
rem PAUSE
GOTO :END

REM SELECCIONAR MAQUINA
:MAQUINA
cls
ECHO ver. '%VERSION%'
echo #### MENU SELECCION MAQUINA ETIQUETA %ETIQUETA% ####
echo.
echo Quina maquina ha de tenir la Etiqueta de %ETIQUETA% ?
echo 1.- SAMO
echo 2.- MONOCALIBRE VIEJA
ECHO 3.- MONOCALIBRE NUEVA (LINEAD)
echo 4.- SORTIR
echo.
echo.

set choice=
set /p choice="Elegeix una Opcio: "
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' (
                   SET  MAQUINA=SAMO
		   goto :COPIAR
	           )
if '%choice%'=='2' (
                   SET  MAQUINA=MONOCALIBRE
		   goto :COPIAR
	           )
if '%choice%'=='3' (
                   SET  MAQUINA=LINEAD
		   goto :COPIAR
	           )
if '%choice%'=='4' goto :END2

ECHO "%choice%" No es valida. Tria altre cop una opcio

REM FEM LES COPIES
:COPIAR
IF %ETIQUETA%==RIBERA1 (
	IF %MAQUINA%==SAMO (
	IF %DEBUG%==ON ( 
			ECHO HAS EEGIT LA ETIQUETA RIBERA1 I LA MAQUINA SAMO 
			PAUSE
			)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA1_CAIXA_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_SAMO.LAB
        )
	IF %MAQUINA%==MONOCALIBRE (
	IF %DEBUG%==ON ( 
			ECHO HAS EEGIT LA ETIQUETA RIBERA1 I LA MAQUINA MONOCALIBRE
			PAUSE
			)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA1_CAIXA_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_MONOCALIBRE.LAB
        )
	IF %MAQUINA%==LINEAD (
	IF %DEBUG%==ON ( 
			ECHO HAS EEGIT LA ETIQUETA RIBERA1 I LA MAQUINA LINEAD 
			PAUSE
			)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA1_CAIXA_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_LINEAD.LAB
        )
)
IF %ETIQUETA%==RIBERA2 (
	IF %MAQUINA%==SAMO (
	IF %DEBUG%==ON ( 
			ECHO HAS EEGIT LA ETIQUETA RIBERA2 I LA MAQUINA SAMO 
			PAUSE
			)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA2_CAIXA_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_SAMO.LAB
        )
	IF %MAQUINA%==MONOCALIBRE (
	IF %DEBUG%==ON ( 
			ECHO HAS EEGIT LA ETIQUETA RIBERA2 I LA MAQUINA MONOCALIBRE
			PAUSE
			)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA2_CAIXA_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_MONOCALIBRE.LAB
        )
	IF %MAQUINA%==LINEAD (
	IF %DEBUG%==ON ( 
			ECHO HAS EEGIT LA ETIQUETA RIBERA2 I LA MAQUINA LINEAD
			PAUSE
			)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA2_CAIXA_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_LINEAD.LAB
        )
)
GOTO :END2



REM COPIAR ETIQUETA PINYANA HUESO
:HUESO
cls
echo.
ECHO ver. '%VERSION%'
echo #### MENU SELECCION MAQUINA ETIQUETA HUESO ####
echo.
echo Quina maquina ha de tenir la Etiqueta de Pinyana HUESO ?
echo 1.- SAMO
echo 2.- MONOCALIBRE VIEJA
ECHO 3.- MONOCALIBRE NUEVA (LINEAD)
echo 4.- SORTIR
echo.
echo.

set choice=
set /p choice="Elegeix una Opcio: "
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto :HUESOSAMO
if '%choice%'=='2' goto :HUESOMONO
if '%choice%'=='3' goto :HUESOLINEAD
if '%choice%'=='4' goto :END2

ECHO "%choice%" No es valida. Tria altre cop una opcio

REM COPIAR ETIQUETA PINYANA NOHUESO
:NOHUESO
cls
echo.
ECHO ver. '%VERSION%'
echo #### MENU SELECCION MAQUINA ETIQUETA NOHUESO ####
echo.
echo Quina maquina ha de tenir la Etiqueta de Pinyana NOHUESO ?
echo 1.- SAMO
echo 2.- MONOCALIBRE VIEJA
ECHO 3.- MONOCALIBRE NUEVA (LINEAD)
echo 4.- SORTIR
echo.
echo.

set choice=
set /p choice="Elegeix una Opcio: "
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto :NOHUESOSAMO
if '%choice%'=='2' goto :NOHUESOMONO
if '%choice%'=='3' goto :NOHUESOLINEAD
if '%choice%'=='4' goto :END2

ECHO "%choice%" No es valida. Tria altre cop una opcio

:HUESOSAMO
REM COPIEM LA ETIQUETA HUESO PER LA SAMO
copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\HUESO.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_SAMO.LAB
GOTO :END2
:HUESOMONO
REM COPIEM LA ETIQUETA HUESO PER LA MONOCALIBRE VELLA
copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\HUESO.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_MONOCALIBRE.LAB
GOTO :END2
:HUESOLINEAD
REM COPIEM LA ETIQUETA HUESO PER LA LINEAD
copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\HUESO.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_LINEAD.LAB
GOTO :END2

:NOHUESOSAMO
REM COPIEM LA ETIQUETA NOHUESO PER LA SAMO
copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NOHUESO.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_SAMO.LAB
GOTO :END2
:NOHUESOMONO
REM COPIEM LA ETIQUETA NOHUESO PER LA MONO
copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NOHUESO.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_MONOCALIBRE.LAB
GOTO :END2
:NOHUESOLINEAD
REM COPIEM LA ETIQUETA NOHUESO PER LA LINEAD
copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NOHUESO.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_LINEAD.LAB
GOTO :END2


:END
REM Llimpiem els fitxers utilitzats

REM MAQUINA PREPACKING

if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA.LAB" ( del /s \\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA.LAB )
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA1.LAB" ( del /s \\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA1.LAB )
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA2.LAB" ( del /s \\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA2.LAB )
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA3.LAB" ( del /s \\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA3.LAB )
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_PREPACKING.LAB" ( del /s \\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_PREPACKING.LAB )
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_SAMO.LAB" ( del /s \\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_SAMO.LAB )
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_MONOCALIBRE.LAB" ( del /s \\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_MONOCALIBRE.LAB )
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_LINEAD.LAB" ( del /s \\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_LINEAD.LAB )

goto :END2


:END2
ECHO.
ECHO ***************** TOTES LES COPIES REALITZADES !!! ********************
ECHO.
ECHO.
pause