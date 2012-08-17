@ECHO OFF

REM Coded by Sergi. 12/08/2011
set VERSION=2.1v
SET DEBUG=ON
set PRODUCTO=NULL
SET ESPERA=8
SET AUTOCLOSE=1
SET COMANDA=NULL
SET COMANDA2=NULL

REM.-- Set the window title
SET title=Programa Manicuplacio
TITLE %title%

REM COLOR
REM   0 = Negro       8 = Gris
REM   1 = Azul        9 = Azul claro
REM   2 = Verde       A = Verde claro
REM   3 = Aguamarina  B = Aguamarina claro
REM   4 = Rojo        C = Rojo claro
REM   5 = Púrpura     D = Púrpura claro
REM   6 = Amarillo    E = Amarillo claro
REM   7 = Blanco      F = Blanco brillante
 
REM MENU ETIQUETES
:MENU
SET SEMAFORO=1
cls
ECHO ver. '%VERSION%'
ECHO.
color F
echo ############ MENU ETIQUETES ###################
echo.
echo 1. Utilitzar l'etiqueta de Pinyana Hueso
echo 2. Utilitzar l'etiqueta de Pinyana SIN Hueso
echo 3. Etiqueta Lliure (Sergi)
echo CC. Copiar d'una maquina a una altra 
echo R. Repetir l'ultima imatge
ECHO S. SORTIR
echo.
echo ###############################################
echo.
echo.
echo ############################ MENU ETIQUETES PER DEFECTE ##############################################
echo.
echo 4. ETIQUETA RIBERA1 GGN				A. CESTAS. Nectarina IBERIANA NO QS  A8. CON QS
echo 5. ETIQUETA RIBERA2 GGN				B. CESTAS. Nectarina. Super Mercat2. NOVAPRACOSA
echo 6. ETIQUETA RIBERA2 NOVAPRACOSA (ALDI 7KG)	C. LVH 7 KILOS.
echo 7. NO Blanca (Variable)				D. CESTAS. NO_ ORALIA
echo 8. CESTAS ALDI (GGN + LOTE) (88 SIN EAN)	E. CESTAS ITALIA (MAAT x/no etiqueta cajas)
echo 9. CESTAS ALDI NOVAPRACOSA (GGN + LOTE)		F. CESTAS CODIGO 0013
echo 						G. CESTAS SPAANSE (Etiqueta caixa Pinyana)
echo.
echo ######################################################################################################
ECHO.
ECHO S. SORTIR
ECHO.

set choice=
set /p choice="Elegeix una Opcio: "
REM Digitos para la opcion
if not '%choice%'=='' set choice=%choice:~0,2%
REM OPCIONES
if '%choice%'=='1' goto :HUESO
if '%choice%'=='2' goto :NOHUESO
if '%choice%'=='3' goto :PREPACKING
if /I '%choice%'=='R' (
	IF NOT "%COMANDA%"=="NULL" (
	%COMANDA%
		IF %AUTOCLOSE%==1 (
			ping -n %ESPERA% localhost>nul
			TASKKILL /IM rundll32.exe
		)
	)
	IF NOT "%COMANDA2%"=="NULL" (
	%COMANDA2%
		IF %AUTOCLOSE%==1 (
			ping -n %ESPERA% localhost>nul
			TASKKILL /IM rundll32.exe
			pause
			goto :MENU
		)		
	)
	echo.
	echo No hi ha cap imatge anterior !
	echo.
	pause
	goto :MENU
)
if /I '%choice%'=='S' (
	set SEMAFORO=0
	goto :END3
)
if '%choice%'=='CC' goto :CC
if '%choice%'=='4' (
	SET ETIQUETA=RIBERA1
	SET COMANDA=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\Ribera1_CAIXA_VAR_nova.jpg
	SET COMANDA2=NULL
	goto :MAQUINA
) 
if '%choice%'=='5' (
	SET ETIQUETA=RIBERA2
	SET COMANDA=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\Ribera2_CAIXA_VAR.jpg
	SET COMANDA2=NULL
	goto :MAQUINA
)
if '%choice%'=='6' (
    SET ETIQUETA=RIBERA2N
	SET COMANDA=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA2_CAIXA_NOVAPRACOSA_VAR.jpg
	SET COMANDA2=NULL
    goto :MAQUINA
)
if '%choice%'=='7' (
    SET ETIQUETA=NOCODIGO
	SET COMANDA=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\NO_blanca_VAR_CAIXA.jpg   
    	SET COMANDA2=NULL
	goto :MAQUINA
)
if /I '%choice%'=='88' (
    SET ETIQUETA=CESTASALDI88
rem	SET COMANDA=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\Ribera2_CAIXA_VAR.jpg
	SET COMANDA2=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\NEKTARINEN_gelbfleischig_lote_ggn_CORB_VAR.jpg
	goto :EMALLAR
)
if '%choice%'=='8' (
    SET ETIQUETA=CESTASALDI
	SET COMANDA=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\Ribera2_CAIXA_VAR.jpg
	SET COMANDA2=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_lote_ggn_ean8_CORB_VAR.jpg
	goto :EMALLAR
)
if '%choice%'=='9' (
    SET ETIQUETA=CESTASALDIN
	SET COMANDA=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA2_CAIXA_NOVAPRACOSA_VAR.jpg
	SET COMANDA2=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_lote_ggn_ean8_CORB_VAR.jpg
    goto :EMALLAR
)
if /I '%choice%'=='A' (
    SET ETIQUETA=CESTASEPS
	SET COMANDA=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_CESTAS_pinyana_VAR_CAIXA.jpg
	SET COMANDA2=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_CESTAS_pinyana_EAN13_VAR_CORB.jpg
    goto :EMALLAR
)
if /I '%choice%'=='A8' (
    SET ETIQUETA=CESTASEPS8
	SET COMANDA=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_CESTAS_pinyana_VAR_CAIXA_QS.jpg
	SET COMANDA2=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleishig_CESTAS_pinyana_EAN13_VAR_CORB.jpg
    goto :EMALLAR
)
if /I '%choice%'=='B' (
    SET ETIQUETA=CESTASEPS2
	SET COMANDA=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_GGN_lote_NOVAPRACOSA_CAIXA_VAR.jpg
	SET COMANDA2=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_GGN_lote_EAN13_NOVAPRACOSA_VAR_CORB.jpg
    goto :EMALLAR
)
if /I '%choice%'=='C' (
    SET ETIQUETA=LVH7KG
    goto :NECTOMEL
)
if /I '%choice%'=='D' (
    SET ETIQUETA=CESTASNOORALIA
    goto :NECTOMEL
)
if /I '%choice%'=='E' (
    SET ETIQUETA=ITALIA
    goto :NECTOMEL
)
if /I '%choice%'=='F' (
    SET ETIQUETA=COD13
	SET COMANDA=NULL
	SET COMANDA2=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\nectarines_GGN_COD13_VAR.jpg
    goto :EMALLAR
)
if /I '%choice%'=='G' (
    SET ETIQUETA=SPAANSE
	SET COMANDA=NULL
	SET COMANDA2=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\nectarine_spaanse_EAN8_VAR.jpg
    goto :EMALLAR
)

ECHO "%choice%" No es valida. Tria altre cop una opcio
PAUSE
GOTO :MENU

REM COPIAR ETIQUETA D'UNA MAQUINA A UNA ALTRA

:CC

cls
ECHO ver. '%VERSION%'
echo #### MENU SELECCION MAQUINA ORIGEN ####
echo.
echo Maquina origen a copiar ?
echo 1. SAMO
echo 2. MONOCALIBRE VIEJA
echo 3. MONOCALIBRE NUEVA (LINEAD)
echo S. SORTIR
echo.
echo.

set choice=
set /p choice="Elegeix una Opcio: "
if not '%choice%'=='' set choice=%choice:~0,1%

if '%choice%'=='1' (
    SET ORIGEN=SAMO
	goto :MENUCOPY
)
if '%choice%'=='2' (
	SET ORIGEN=MONO
    goto :MENUCOPY
)
if '%choice%'=='3' (
	SET ORIGEN=LINEAD
    goto :MENUCOPY
)
if /I '%choice%'=='S' goto :END2

ECHO "%choice%" No es valida. Tria altre cop una opcio
PAUSE

:MENUCOPY

cls
ECHO ver. '%VERSION%'
echo #### MENU SELECCION MAQUINA DESTINO ####
echo.
echo La Màquina ORIGEN es: %ORIGEN%
echo Maquina desti a copiar ?
echo 1. SAMO
echo 2. MONOCALIBRE VIEJA
echo 3. MONOCALIBRE NUEVA (LINEAD)
echo S. SORTIR
echo.
echo.

set choice=
set /p choice="Elegeix una Opcio: "
if not '%choice%'=='' set choice=%choice:~0,1%

if '%choice%'=='1' (
    SET DESTI=SAMO
	goto :COMMANDCOPY
)
if '%choice%'=='2' (
	SET DESTI=MONO
    goto :COMMANDCOPY
)
if '%choice%'=='3' (
	SET DESTI=LINEAD
    goto :COMMANDCOPY
)
if /I '%choice%'=='S' goto :END2

ECHO "%choice%" No es valida. Tria altre cop una opcio
PAUSE

:COMMANDCOPY

SET SSAMO=\\192.168.1.10\c\ETIQUETAS\CAIXA_SAMO.LAB
SET SMONO=\\192.168.1.10\c\ETIQUETAS\CAIXA_MONOCALIBRE.LAB
SET SLINEAD=\\192.168.1.10\c\ETIQUETAS\CAIXA_LINEAD.LAB
IF %ORIGEN%==SAMO (
SET ORIGEN1=%SSAMO%
)
IF %ORIGEN%==MONO (
SET ORIGEN1=%SMONO%
)
IF %ORIGEN%==LINEAD (
SET ORIGEN1=%SLINEAD%
)
IF %DESTI%==SAMO (
SET DESTI1=%SSAMO%
)
IF %DESTI%==MONO (
SET DESTI1=%SMONO%
)
IF %DESTI%==LINEAD (
SET DESTI1=%SLINEAD%
)

ECHO HAS ELEGIT COM A ORIGEN %ORIGEN% I DESTI %DESTI%
REM ECHO COPY %ORIGEN1% %DESTI1%
COPY %ORIGEN1% %DESTI1%
GOTO :END2


REM COPIAR ETIQUETES PREPACKING

:PREPACKING

if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA.LAB" ( 
:: En principi no necessitarem Corbata.lab, pero ho mantenim per si de cas.
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA.LAB \\192.168.1.10\c\ETIQUETAS\CORBATA.LAB
	if not exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA1.LAB" ( copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA.LAB \\192.168.1.10\c\ETIQUETAS\CORBATA1.LAB )
	if not exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA2.LAB" ( copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA.LAB \\192.168.1.10\c\ETIQUETAS\CORBATA2.LAB )
	if not exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA3.LAB" ( copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA.LAB \\192.168.1.10\c\ETIQUETAS\CORBATA3.LAB )	
	)
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA1.LAB" ( copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA1.LAB \\192.168.1.10\c\ETIQUETAS\)
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA2.LAB" ( copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA2.LAB \\192.168.1.10\c\ETIQUETAS\)
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA3.LAB" ( copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA3.LAB \\192.168.1.10\c\ETIQUETAS\)
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_PREPACKING.LAB" ( copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_PREPACKING.LAB \\192.168.1.10\c\ETIQUETAS\)
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CORBATA.LAB" ( ECHO ETIQUETES PREPACKING COPIADES !! )

GOTO :SAMO

REM COPIAR ETIQUETES SAMO

:SAMO

if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_SAMO.LAB" ( copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_SAMO.LAB \\192.168.1.10\c\ETIQUETAS\ )
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_SAMO.LAB" ( ECHO ETIQUETES SAMO COPIADES !! )

GOTO :MONOV

REM COPIAR ETIQUETES MONOCALIBRE VELLA

:MONOV

if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_MONOCALIBRE.LAB" ( copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_MONOCALIBRE.LAB \\192.168.1.10\c\ETIQUETAS\ )
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_MONOCALIBRE.LAB" ( ECHO ETIQUETES MONOCALIBRE VELLA COPIADES !! )

GOTO :LINEAD

REM COPIAR ETIQUETES LINEAD

:LINEAD

if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_LINEAD.LAB" ( copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_LINEAD.LAB \\192.168.1.10\c\ETIQUETAS\ )
if exist "\\192.168.1.10\c\ETIQUETAS\Utilitzades\CAIXA_LINEAD.LAB" ( ECHO ETIQUETES LINEAD COPIADES !! )

GOTO :END

REM ELECCION DE NECTARINA O MELOCOTON
:NECTOMEL
cls
ECHO ver. '%VERSION%'
echo #### MENU SELECCION NECTARINA O MELOCOTON ####
echo.
echo La corbata/etiqueta ha de ser per a Nectarina o per a Pressec ?
echo 1. NECTARINA (Nectarines)
echo 2. PRESSEC (Perziken)
echo S. SORTIR
echo.
echo.

set choice=
set /p choice="Elegeix una Opcio: "
if not '%choice%'=='' set choice=%choice:~0,1%

if '%choice%'=='1' (
    SET  PRODUCTO=NECTARINES
    IF %ETIQUETA%==LVH7KG (
	    SET COMANDA=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\nectarines_LVH_NO_7kilos_CAIXA_VAR.jpg
		GOTO :MAQUINA
	)
	IF %ETIQUETA%==CESTASNOORALIA (
		SET COMANDA=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\NO_blanca_VAR_CAIXA.jpg
		SET COMANDA2=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\NO_CORB_VAR.jpg
		GOTO :EMALLAR
	)
	IF %ETIQUETA%==ITALIA (
		SET COMANDA2=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\nectarines_italia_CESTAS_EAN8_VAR.jpg
		GOTO :EMALLAR
	)
	goto :EMALLAR
)
if '%choice%'=='2' (
    SET  PRODUCTO=PERZIKEN
	IF %ETIQUETA%==LVH7KG (
	    SET COMANDA=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\PERZIKEN_LVH_NO_7kilos_CAIXA_VAR.jpg
		GOTO :MAQUINA
	)
	IF %ETIQUETA%==CESTASNOORALIA (
		SET COMANDA=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\NO_blanca_VAR_CAIXA.jpg
		SET COMANDA2=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\NO_PERZIKEN_CORB_VAR.jpg
		GOTO :EMALLAR
	)
	IF %ETIQUETA%==ITALIA (
		SET COMANDA2=start rundll32.exe C:\WINDOWS\system32\shimgvw.dll,ImageView_Fullscreen \\192.168.1.10\c\ETIQUETAS\Utilitzades\perziken_italia_CESTAS_EAN8_VAR.jpg
		GOTO :EMALLAR
	)
    goto :EMALLAR
)
if /I '%choice%'=='S' goto :END2

ECHO "%choice%" No es valida. Tria altre cop una opcio
PAUSE



REM ETIQUETAS Y CORBATAS (CAMBIAR LAS CORBATAS Y TAMBIEN LA ETIQUETA DE LA MAQUINA PREPACKING)
:EMALLAR

IF %ETIQUETA%==CESTASALDI (
 	IF %DEBUG%==ON ( 
 			ECHO HAS ELEGIT LA ETIQUETA ALDI
 			PAUSE
		)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_lote_ggn_ean8_CORB_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CORBATA.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_lote_ggn_ean8_CORB_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CORBATA1.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_lote_ggn_ean8_CORB_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CORBATA2.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_lote_ggn_ean8_CORB_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CORBATA3.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\Ribera2_CAIXA_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_PREPACKING.LAB
	
	%COMANDA%
	IF %AUTOCLOSE%==1 (
		ping -n %ESPERA% localhost>nul
		TASKKILL /IM rundll32.exe
	)
	%COMANDA2%
	IF %AUTOCLOSE%==1 (
		ping -n %ESPERA% localhost>nul
		TASKKILL /IM rundll32.exe
	)	
)

IF %ETIQUETA%==CESTASALDI88 (
 	IF %DEBUG%==ON ( 
 			ECHO HAS ELEGIT LA ETIQUETA ALDI SENSE CODI DE BARRES
 			PAUSE
		)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NEKTARINEN_gelbfleischig_lote_ggn_CORB_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NEKTARINEN_gelbfleischig_lote_ggn_CORB_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA1.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NEKTARINEN_gelbfleischig_lote_ggn_CORB_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA2.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NEKTARINEN_gelbfleischig_lote_ggn_CORB_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA3.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\PIÑANA3Hueso_GGN.lab \\192.168.1.10\c\ETIQUETAS\CAIXA_PREPACKING.LAB
	
	%COMANDA%
	IF %AUTOCLOSE%==1 (
		ping -n %ESPERA% localhost>nul
		TASKKILL /IM rundll32.exe
	)
	%COMANDA2%
	IF %AUTOCLOSE%==1 (
		ping -n %ESPERA% localhost>nul
		TASKKILL /IM rundll32.exe
	)	
)

IF %ETIQUETA%==CESTASALDIN (
 	IF %DEBUG%==ON ( 
 			ECHO HAS ELEGIT LA ETIQUETA ALDI NOVAPRACOSA
 			PAUSE
		)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_lote_ggn_ean8_CORB_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CORBATA.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_lote_ggn_ean8_CORB_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CORBATA1.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_lote_ggn_ean8_CORB_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CORBATA2.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_lote_ggn_ean8_CORB_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CORBATA3.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\Ribera2_CAIXA_NOVAPRACOSA_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_PREPACKING.LAB
	
	%COMANDA%
	IF %AUTOCLOSE%==1 (
		ping -n %ESPERA% localhost>nul
		TASKKILL /IM rundll32.exe
	)
	%COMANDA2%
	IF %AUTOCLOSE%==1 (
		ping -n %ESPERA% localhost>nul
		TASKKILL /IM rundll32.exe
	)	
)

IF %ETIQUETA%==CESTASEPS (
 	IF %DEBUG%==ON ( 
 			ECHO HAS ELEGIT LA ETIQUETA EUROPOOL SYSTEM 
 			PAUSE
		)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_CESTAS_pinyana_EAN13_VAR_CORB.LAB \\192.168.1.10\c\ETIQUETAS\CORBATA.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_CESTAS_pinyana_EAN13_VAR_CORB.LAB \\192.168.1.10\c\ETIQUETAS\CORBATA1.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_CESTAS_pinyana_EAN13_VAR_CORB.LAB \\192.168.1.10\c\ETIQUETAS\CORBATA2.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_CESTAS_pinyana_EAN13_VAR_CORB.LAB \\192.168.1.10\c\ETIQUETAS\CORBATA3.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_CESTAS_pinyana_VAR_CAIXA.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_PREPACKING.LAB
	
	%COMANDA%
	IF %AUTOCLOSE%==1 (
		ping -n %ESPERA% localhost>nul
		TASKKILL /IM rundll32.exe
	)
	%COMANDA2%
	IF %AUTOCLOSE%==1 (
		ping -n %ESPERA% localhost>nul
		TASKKILL /IM rundll32.exe
	)
)

IF %ETIQUETA%==CESTASEPS8 (
 	IF %DEBUG%==ON ( 
 			ECHO HAS ELEGIT LA ETIQUETA LIBERIANA AMB QS 
 			PAUSE
		)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_CESTAS_pinyana_EAN13_VAR_CORB.LAB \\192.168.1.10\c\ETIQUETAS\CORBATA.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_CESTAS_pinyana_EAN13_VAR_CORB.LAB \\192.168.1.10\c\ETIQUETAS\CORBATA1.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_CESTAS_pinyana_EAN13_VAR_CORB.LAB \\192.168.1.10\c\ETIQUETAS\CORBATA2.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_CESTAS_pinyana_EAN13_VAR_CORB.LAB \\192.168.1.10\c\ETIQUETAS\CORBATA3.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_CESTAS_pinyana_VAR_CAIXA_QS.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_PREPACKING.LAB
	
	%COMANDA%
	IF %AUTOCLOSE%==1 (
		ping -n %ESPERA% localhost>nul
		TASKKILL /IM rundll32.exe
	)
	%COMANDA2%
	IF %AUTOCLOSE%==1 (
		ping -n %ESPERA% localhost>nul
		TASKKILL /IM rundll32.exe
	)
)

IF %ETIQUETA%==CESTASEPS2 (
 	IF %DEBUG%==ON ( 
 			ECHO HAS ELEGIT LA ETIQUETA EUROPOOL SYSTEM 2 
 			PAUSE
		)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_GGN_lote_EAN13_NOVAPRACOSA_VAR_CORB.LAB \\192.168.1.10\c\ETIQUETAS\CORBATA.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_GGN_lote_EAN13_NOVAPRACOSA_VAR_CORB.LAB \\192.168.1.10\c\ETIQUETAS\CORBATA1.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_GGN_lote_EAN13_NOVAPRACOSA_VAR_CORB.LAB \\192.168.1.10\c\ETIQUETAS\CORBATA2.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_GGN_lote_EAN13_NOVAPRACOSA_VAR_CORB.LAB \\192.168.1.10\c\ETIQUETAS\CORBATA3.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nektarinen_gelbfleischig_GGN_lote_NOVAPRACOSA_CAIXA_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_PREPACKING.LAB

	%COMANDA%
	IF %AUTOCLOSE%==1 (
		ping -n %ESPERA% localhost>nul
		TASKKILL /IM rundll32.exe
	)
	%COMANDA2%
	IF %AUTOCLOSE%==1 (
		ping -n %ESPERA% localhost>nul
		TASKKILL /IM rundll32.exe
	)
)

IF %ETIQUETA%==CESTASNOORALIA (
 	IF %DEBUG%==ON ( 
 			ECHO HAS ELEGIT LA ETIQUETA NO CODIGO ORALIA 
 			PAUSE
		)
	IF %PRODUCTO%==NECTARINES (
		IF %DEBUG%==ON ( 
 			ECHO HAS ELEGIT LA ETIQUETA CESTAS NO ORALIA I PRODUCTE NECTARINES
 			PAUSE
		)
		copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NO_CORB_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA.LAB
		copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NO_CORB_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA1.LAB
		copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NO_CORB_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA2.LAB
		copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NO_CORB_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA3.LAB
		copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NO_blanca_VAR_CAIXA.lab \\192.168.1.10\c\ETIQUETAS\CAIXA_PREPACKING.LAB
		
		%COMANDA%
		IF %AUTOCLOSE%==1 (
			ping -n %ESPERA% localhost>nul
			TASKKILL /IM rundll32.exe
		)
		%COMANDA2%
		IF %AUTOCLOSE%==1 (
			ping -n %ESPERA% localhost>nul
			TASKKILL /IM rundll32.exe
		)
	)
	IF %PRODUCTO%==PERZIKEN (
		IF %DEBUG%==ON ( 
 			ECHO HAS ELEGIT LA ETIQUETA CESTAS NO ORALIA I PRODUCTE MELOCOTON
 			PAUSE
		)
		copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NO_PERZIKEN_CORB_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA.LAB
		copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NO_PERZIKEN_CORB_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA1.LAB
		copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NO_PERZIKEN_CORB_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA2.LAB
		copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NO_PERZIKEN_CORB_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA3.LAB
		copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NO_blanca_VAR_CAIXA.lab \\192.168.1.10\c\ETIQUETAS\CAIXA_PREPACKING.LAB
		
		%COMANDA%
		IF %AUTOCLOSE%==1 (
			ping -n %ESPERA% localhost>nul
			TASKKILL /IM rundll32.exe
		)
		%COMANDA2%
		IF %AUTOCLOSE%==1 (
			ping -n %ESPERA% localhost>nul
			TASKKILL /IM rundll32.exe
		)
	)
 )
 
IF %ETIQUETA%==ITALIA (
 	IF %DEBUG%==ON ( 
 			ECHO HAS ELEGIT LA ETIQUETA ITALIA
 			PAUSE
		)
    IF %PRODUCTO%==NECTARINES (
		IF %DEBUG%==ON ( 
 			ECHO HAS ELEGIT LA ETIQUETA ITALIA I PRODUCTE NECTARINES
 			PAUSE
		)
		copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nectarines_italia_CESTAS_EAN8_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA.LAB
		copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nectarines_italia_CESTAS_EAN8_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA1.LAB
		copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nectarines_italia_CESTAS_EAN8_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA2.LAB
		copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nectarines_italia_CESTAS_EAN8_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA3.LAB
		
		%COMANDA2%
		IF %AUTOCLOSE%==1 (
			ping -n %ESPERA% localhost>nul
			TASKKILL /IM rundll32.exe
		)
	)
	IF %PRODUCTO%==PERZIKEN (
		IF %DEBUG%==ON ( 
 			ECHO HAS ELEGIT LA ETIQUETA ITALIA I PRODUCTE MELOCOTON
 			PAUSE
		)
		copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\perziken_italia_CESTAS_EAN8_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA.LAB
		copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\perziken_italia_CESTAS_EAN8_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA1.LAB
		copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\perziken_italia_CESTAS_EAN8_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA2.LAB
		copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\perziken_italia_CESTAS_EAN8_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA3.LAB
		
		%COMANDA2%
		IF %AUTOCLOSE%==1 (
			ping -n %ESPERA% localhost>nul
			TASKKILL /IM rundll32.exe
		)
	)	
 )
 
IF %ETIQUETA%==COD13 (
 	IF %DEBUG%==ON ( 
 		ECHO HAS ELEGIT LA ETIQUETA CODIGO 13 
 		PAUSE
	)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nectarines_GGN_COD13_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nectarines_GGN_COD13_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA1.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nectarines_GGN_COD13_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA2.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nectarines_GGN_COD13_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA3.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\HUESO.lab \\192.168.1.10\c\ETIQUETAS\CAIXA_PREPACKING.LAB
	
	%COMANDA2%
	IF %AUTOCLOSE%==1 (
		ping -n %ESPERA% localhost>nul
		TASKKILL /IM rundll32.exe
	)
 )
 
IF %ETIQUETA%==SPAANSE (
 	IF %DEBUG%==ON ( 
 		ECHO HAS ELEGIT LA ETIQUETA SPAANSE 
 		PAUSE
	)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nectarine_spaanse_EAN8_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nectarine_spaanse_EAN8_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA1.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nectarine_spaanse_EAN8_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA2.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nectarine_spaanse_EAN8_VAR.lab \\192.168.1.10\c\ETIQUETAS\CORBATA3.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\HUESO.lab \\192.168.1.10\c\ETIQUETAS\CAIXA_PREPACKING.LAB
	
	%COMANDA2%
	IF %AUTOCLOSE%==1 (
		ping -n %ESPERA% localhost>nul
		TASKKILL /IM rundll32.exe
	)
 )

GOTO :END2

REM SELECCIONAR MAQUINA
:MAQUINA
cls
ECHO ver. '%VERSION%'
echo #### MENU SELECCION MAQUINA ETIQUETA %ETIQUETA% ####
echo.
echo Quina maquina ha de tenir la Etiqueta de %ETIQUETA% ?
echo 1. SAMO
echo 2. MONOCALIBRE VIEJA
echo 3. MONOCALIBRE NUEVA (LINEAD)
echo 4. TODAS las Maquinas.
echo S. SORTIR
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
if '%choice%'=='4' (
                   SET  MAQUINA=TODAS
		   goto :COPIAR
	           )
if /I '%choice%'=='S' goto :END2

ECHO "%choice%" No es valida. Tria altre cop una opcio
PAUSE
GOTO :MAQUINA


REM FEM LES COPIES
:COPIAR

IF %ETIQUETA%==RIBERA1 (
	IF %MAQUINA%==SAMO (
	IF %DEBUG%==ON ( 
			ECHO HAS ELEGIT LA ETIQUETA RIBERA1 I LA MAQUINA SAMO 
			PAUSE
		)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA1_CAIXA_VAR_nova.lab \\192.168.1.10\c\ETIQUETAS\CAIXA_SAMO.LAB
    )
	IF %MAQUINA%==MONOCALIBRE (
	IF %DEBUG%==ON ( 
			ECHO HAS ELEGIT LA ETIQUETA RIBERA1 I LA MAQUINA MONOCALIBRE
			PAUSE
			)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA1_CAIXA_VAR_nova.lab \\192.168.1.10\c\ETIQUETAS\CAIXA_MONOCALIBRE.LAB
    )
	IF %MAQUINA%==LINEAD (
	IF %DEBUG%==ON ( 
			ECHO HAS ELEGIT LA ETIQUETA RIBERA1 I LA MAQUINA LINEAD 
			PAUSE
			)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA1_CAIXA_VAR_nova.lab \\192.168.1.10\c\ETIQUETAS\CAIXA_LINEAD.LAB
    )
	IF %MAQUINA%==TODAS (
	IF %DEBUG%==ON ( 
			ECHO HAS ELEGIT LA ETIQUETA RIBERA1 i TOTES les Maquines 
			PAUSE
	)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA1_CAIXA_VAR_nova.lab \\192.168.1.10\c\ETIQUETAS\CAIXA_SAMO.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA1_CAIXA_VAR_nova.lab \\192.168.1.10\c\ETIQUETAS\CAIXA_MONOCALIBRE.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA1_CAIXA_VAR_nova.lab \\192.168.1.10\c\ETIQUETAS\CAIXA_LINEAD.LAB
    )
	%COMANDA%
	IF %AUTOCLOSE%==1 (
		ping -n %ESPERA% localhost>nul
		TASKKILL /IM rundll32.exe
	)
)

IF %ETIQUETA%==RIBERA2 (
	IF %MAQUINA%==SAMO (
	IF %DEBUG%==ON ( 
			ECHO HAS ELEGIT LA ETIQUETA RIBERA2 I LA MAQUINA SAMO 
			PAUSE
		)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA2_CAIXA_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_SAMO.LAB
    )
	IF %MAQUINA%==MONOCALIBRE (
	IF %DEBUG%==ON ( 
			ECHO HAS ELEGIT LA ETIQUETA RIBERA2 I LA MAQUINA MONOCALIBRE
			PAUSE
		)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA2_CAIXA_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_MONOCALIBRE.LAB
    )
	IF %MAQUINA%==LINEAD (
	IF %DEBUG%==ON ( 
			ECHO HAS ELEGIT LA ETIQUETA RIBERA2 I LA MAQUINA LINEAD
			PAUSE
		)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA2_CAIXA_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_LINEAD.LAB
    )
	IF %MAQUINA%==TODAS (
	IF %DEBUG%==ON ( 
			ECHO HAS ELEGIT LA ETIQUETA RIBERA2 I TOTES les Maquines
			PAUSE
		)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA2_CAIXA_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_SAMO.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA2_CAIXA_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_MONOCALIBRE.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA2_CAIXA_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_LINEAD.LAB
    )
	%COMANDA%
	IF %AUTOCLOSE%==1 (
		ping -n %ESPERA% localhost>nul
		TASKKILL /IM rundll32.exe
	)
)

IF %ETIQUETA%==RIBERA2N (
	IF %MAQUINA%==SAMO (
	IF %DEBUG%==ON ( 
			ECHO HAS ELEGIT LA ETIQUETA RIBERA2 NOVAPRACOSA I LA MAQUINA SAMO 
			PAUSE
		)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA2_CAIXA_NOVAPRACOSA_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_SAMO.LAB
    )
	IF %MAQUINA%==MONOCALIBRE (
	IF %DEBUG%==ON ( 
			ECHO HAS ELEGIT LA ETIQUETA RIBERA2 NOVAPRACOSA I LA MAQUINA MONOCALIBRE
			PAUSE
		)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA2_CAIXA_NOVAPRACOSA_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_MONOCALIBRE.LAB
    )
	IF %MAQUINA%==LINEAD (
	IF %DEBUG%==ON ( 
			ECHO HAS ELEGIT LA ETIQUETA RIBERA2 NOVAPRACOSA I LA MAQUINA LINEAD
			PAUSE
		)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA2_CAIXA_NOVAPRACOSA_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_LINEAD.LAB
    )
	IF %MAQUINA%==TODAS (
	IF %DEBUG%==ON ( 
			ECHO HAS ELEGIT LA ETIQUETA RIBERA2 NOVAPRACOSA I TOTES les Maquines
			PAUSE
		)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA2_CAIXA_NOVAPRACOSA_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_SAMO.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA2_CAIXA_NOVAPRACOSA_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_MONOCALIBRE.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\RIBERA2_CAIXA_NOVAPRACOSA_VAR.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_LINEAD.LAB
    )
	%COMANDA%
	IF %AUTOCLOSE%==1 (
		ping -n %ESPERA% localhost>nul
		TASKKILL /IM rundll32.exe
	)
)

IF %ETIQUETA%==LVH7KG (
	IF %MAQUINA%==SAMO (
		IF %DEBUG%==ON ( 
			ECHO HAS ELEGIT LA ETIQUETA LVH 7 KILOS I LA MAQUINA SAMO 
			PAUSE
			)
		IF %PRODUCTO%==NECTARINES (
			copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nectarines_LVH_NO_7kilos_VAR_CAIXA.lab \\192.168.1.10\c\ETIQUETAS\CAIXA_SAMO.LAB
        	)
		IF %PRODUCTO%==PERZIKEN (
			copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\PERZIKEN_LVH_NO_7kilos_VAR_CAIXA.lab \\192.168.1.10\c\ETIQUETAS\CAIXA_SAMO.LAB
		)
	)
	IF %MAQUINA%==MONOCALIBRE (
		IF %DEBUG%==ON ( 
			ECHO HAS EEGIT LA ETIQUETA LVH 7 KILOS I LA MAQUINA MONOCALIBRE
			PAUSE
			)
		IF %PRODUCTO%==NECTARINES (
			copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nectarines_LVH_NO_7kilos_VAR_CAIXA.lab \\192.168.1.10\c\ETIQUETAS\CAIXA_MONOCALIBRE.LAB
		)
		IF %PRODUCTO%==PERZIKEN (
			copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\PERZIKEN_LVH_NO_7kilos_VAR_CAIXA.lab \\192.168.1.10\c\ETIQUETAS\CAIXA_MONOCALIBRE.LAB
		)
    )
	IF %MAQUINA%==LINEAD (
		IF %DEBUG%==ON ( 
			ECHO HAS ELEGIT LA ETIQUETA LVH 7 KILOS I LA MAQUINA LINEAD
			PAUSE
			)
		IF %PRODUCTO%==NECTARINES (
			copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nectarines_LVH_NO_7kilos_VAR_CAIXA.lab \\192.168.1.10\c\ETIQUETAS\CAIXA_LINEAD.LAB
		)
		IF %PRODUCTO%==PERZIKEN (
			copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\PERZIKEN_LVH_NO_7kilos_VAR_CAIXA.lab \\192.168.1.10\c\ETIQUETAS\CAIXA_LINEAD.LAB
		)	
    )
	IF %MAQUINA%==TODAS (
		IF %DEBUG%==ON ( 
			ECHO HAS ELEGIT LA ETIQUETA LVH 7 KILOS I TOTES les Maquines
			PAUSE
			)
		IF %PRODUCTO%==NECTARINES (
			copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nectarines_LVH_NO_7kilos_VAR_CAIXA.lab \\192.168.1.10\c\ETIQUETAS\CAIXA_SAMO.LAB
			copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nectarines_LVH_NO_7kilos_VAR_CAIXA.lab \\192.168.1.10\c\ETIQUETAS\CAIXA_MONOCALIBRE.LAB
			copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\nectarines_LVH_NO_7kilos_VAR_CAIXA.lab \\192.168.1.10\c\ETIQUETAS\CAIXA_LINEAD.LAB
		)
		IF %PRODUCTO%==PERZIKEN (
			copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\PERZIKEN_LVH_NO_7kilos_VAR_CAIXA.lab \\192.168.1.10\c\ETIQUETAS\CAIXA_SAMO.LAB
			copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\PERZIKEN_LVH_NO_7kilos_VAR_CAIXA.lab \\192.168.1.10\c\ETIQUETAS\CAIXA_MONOCALIBRE.LAB
			copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\PERZIKEN_LVH_NO_7kilos_VAR_CAIXA.lab \\192.168.1.10\c\ETIQUETAS\CAIXA_LINEAD.LAB
		)
    )
	IF %PRODUCTO%==NECTARINES (
	%COMANDA%
		IF %AUTOCLOSE%==1 (
			ping -n %ESPERA% localhost>nul
			TASKKILL /IM rundll32.exe
		)
	)
	IF %PRODUCTO%==PERZIKEN (
		%COMANDA%
		IF %AUTOCLOSE%==1 (
			ping -n %ESPERA% localhost>nul
			TASKKILL /IM rundll32.exe
		)
	)
)

IF %ETIQUETA%==NOCODIGO (
	IF %MAQUINA%==SAMO (
	IF %DEBUG%==ON ( 
			ECHO HAS ELEGIT LA ETIQUETA NO_CODIGO I LA MAQUINA SAMO 
			PAUSE
		)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NO_blanca_VAR_CAIXA.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_SAMO.LAB
    )
	IF %MAQUINA%==MONOCALIBRE (
	IF %DEBUG%==ON ( 
			ECHO HAS ELEGIT LA ETIQUETA NO_CODIGO I LA MAQUINA MONOCALIBRE
			PAUSE
		)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NO_blanca_VAR_CAIXA.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_MONOCALIBRE.LAB
    )
	IF %MAQUINA%==LINEAD (
	IF %DEBUG%==ON ( 
			ECHO HAS ELEGIT LA ETIQUETA NO_CODIGO I LA MAQUINA LINEAD
			PAUSE
		)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NO_blanca_VAR_CAIXA.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_LINEAD.LAB
    )
	IF %MAQUINA%==TODAS (
	IF %DEBUG%==ON ( 
			ECHO HAS ELEGIT LA ETIQUETA NO_CODIGO I TOTES les Maquines
			PAUSE
		)
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NO_blanca_VAR_CAIXA.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_SAMO.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NO_blanca_VAR_CAIXA.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_MONOCALIBRE.LAB
	copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NO_blanca_VAR_CAIXA.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_LINEAD.LAB
    )
	%COMANDA%
	IF %AUTOCLOSE%==1 (
		ping -n %ESPERA% localhost>nul
		TASKKILL /IM rundll32.exe
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
echo 1. SAMO
echo 2. MONOCALIBRE VIEJA
ECHO 3. MONOCALIBRE NUEVA (LINEAD)
echo 4. TODAS las Maquinas.
echo S. SORTIR
echo.
echo.

set choice=
set /p choice="Elegeix una Opcio: "
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto :HUESOSAMO
if '%choice%'=='2' goto :HUESOMONO
if '%choice%'=='3' goto :HUESOLINEAD
if '%choice%'=='4' goto :HUESOTODAS
if /I '%choice%'=='S' goto :END2

ECHO "%choice%" No es valida. Tria altre cop una opcio
PAUSE
GOTO :HUESO

REM COPIAR ETIQUETA PINYANA NOHUESO
:NOHUESO
cls
echo.
ECHO ver. '%VERSION%'
echo #### MENU SELECCION MAQUINA ETIQUETA NOHUESO ####
echo.
echo Quina maquina ha de tenir la Etiqueta de Pinyana NOHUESO ?
echo 1. SAMO
echo 2. MONOCALIBRE VIEJA
ECHO 3. MONOCALIBRE NUEVA (LINEAD)
echo 4. TODAS las Maquinas.
echo S. SORTIR
echo.
echo.

set choice=
set /p choice="Elegeix una Opcio: "
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto :NOHUESOSAMO
if '%choice%'=='2' goto :NOHUESOMONO
if '%choice%'=='3' goto :NOHUESOLINEAD
if '%choice%'=='4' goto :NOHUESOTODAS
if /I '%choice%'=='S' goto :END2

ECHO "%choice%" No es valida. Tria altre cop una opcio
PAUSE
GOTO :NOHUESO

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
:HUESOTODAS
REM COPIEM LA ETIQUETA A TODAS LAS MAQUINAS
copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\HUESO.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_SAMO.LAB
copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\HUESO.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_MONOCALIBRE.LAB
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
:NOHUESOTODAS
REM COPIEM LA ETIQUETA A TODAS LAS MAQUINAS
copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NOHUESO.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_SAMO.LAB
copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NOHUESO.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_MONOCALIBRE.LAB
copy \\192.168.1.10\c\ETIQUETAS\Utilitzades\NOHUESO.LAB \\192.168.1.10\c\ETIQUETAS\CAIXA_LINEAD.LAB
GOTO :END2


:END
REM Llimpiem els fitxers utilitzats (NOMES EN CAS ETIQUETA LLIURE)

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

:: SET VARIABLES TO NULL
set ETIQUETA=NULL
set PRODUCTO=NULL
set MAQUINA=NULL

PAUSE
goto :MENU


:END3
ECHO.
IF %SEMAFORO%==1 ( ECHO ***************** TOTES LES COPIES REALITZADES !!! ******************** )  ELSE ( ECHO ***************** NO S'HA REALITZAT CAP COPIA !!! ******************** )
ECHO.
ECHO.
echo Apreta una tecla per a Sortir ...
pause>nul