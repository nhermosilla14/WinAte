#!/bin/bash
#
#  WinAte 0.6 - Pack de transformación de apariencia para GNU/Linux
#  
#  Copyright 2014 Nicolás Hermosilla P. <nhermosilla14@gmail.com>
#  
#  Contiene porciones del Win2-7 pack, disponible libremente a través de gnome-look.org
#  Contiene el botón de inicio de Windows 8 by dassebi (dassebi.deviantart.com)
#  Contiene los fondos de pantalla de Windows 8 by misaki2009 (misaki2009.deviantart.com)
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
# 

echo "==================================================================="
echo "=                                                                 ="
echo "= WinAte 0.6 - Windows 7/8 (r) Transformation Pack for Debian/LXDE="
echo "=                                                                 ="
echo "=  Copyright 2014 Nicolás Hermosilla P. - nhermosilla14@gmail.com ="
echo "=                                                                 ="
echo "=                                                                 ="
echo "=      Inicializando procesos... / Starting process...            ="
echo "=                                                                 ="
echo "==================================================================="
sleep 2
clear
echo "================================================================================"
echo "=                                                                              ="
echo "=     Este script sólo ha sido probado en Debian 8 (Jessie), y sólo se         ="
echo "=   recomienda para su uso en Debian, Crunchbang y Ubuntu. En otras distros    ="
echo "=    se considera experimental. Siempre requiere al menos la versión 0.4.9 de  ="
echo "=                            LXSession.                                        ="
echo "=------------------------------------------------------------------------------="
echo "= This script has been only tested in Debian 8 (Jessie), and it's only intented="
echo "=      to be used in Debian, Crunchbang and Ubuntu. In other distros it's      ="
echo "= considered experimental. It always need at least version 0.4.9 of LXSession. ="
echo "=                                                                              ="
echo "================================================================================"
echo ""
echo "Presione enter para continuar... //Press enter to continue..."
read
clear
echo "Elija idioma para instalar: | Choose language to install: "
echo ""
echo "1)Español"
echo "2)English"
echo ""
echo "1/2?"
read respuesta
respuesta=$respuesta"_"
# Idiomas y localizaciones
if [ "$respuesta" == "2_" ]
    then
    si="y"
    SI="Y"
    mensaje1="What theme do you want to setup?(default 8) 7/8"
    mensaje2="Do you want to setup the wallpaper too? Y/n"
    mensaje3="File backed-up"
    mensaje4="Installation finished. Logout and login again to let changes be applied."
    mensaje5="Press enter to open logout dialog."
    mensaje6="Directory created"
    mensaje7="Directory found"
    mensaje8="Your distro seems to be"
    mensaje9=". Is that right? (Y/n)"
    mensaje10="Distribution unsupported. To force installation, use script with \"--force\". Exiting..."
    mensaje11="Type your distro:"
    mensaje12="Installaer must exit now."
else
    si="s"
    SI="S"
    mensaje1="Qué tema desea configurar?(opción por defecto: 8) 7/8"
    mensaje2="Desea cambiar el fondo de pantalla también? S/n"
    mensaje3="Archivo respaldado"
    mensaje4="Instalación finalizada. Cierre y abra sesión para aplicar los cambios."
    mensaje5="Presione enter para abrir el diálogo de cierre."
    mensaje6="Directorio creado"
    mensaje7="Directorio encontrado"
    mensaje8="Su distro parece ser"
    mensaje9=". ¿Es correcto?(S/n)"
    mensaje10="Distribución no soportada. Para forzar la instalación, use \"--force\". Saliendo..."
    mensaje11="Ingrese su distro:"
    mensaje12="El instalador debe salir ahora."
fi

# Comprobar distro

distro=$(cat /etc/*-release | grep '^NAME=')
distro=${distro:6}
distro="$(cut -d ' ' -f 1 <<< "$distro")"
distro="$(echo $distro | sed -e 's/\"$//')"
argumentos=$1"_"
if [ "$argumentos" == "--force_" ]
    then
    respuesta=$si
    echo "$mensaje11 ( Debian | Ubuntu )"
    read distro
else
    echo "$mensaje8 $distro$mensaje9"
    read respuesta
fi
if [ "$respuesta" == "$si" ] || [ "$respuesta" == "SI" ]
then
estado="ok"
else
estado="ko"
fi

# Comprobación de datos de distro

if [ "$estado" == "ko" ]
    then
    echo "$mensaje10"
    exit 1
fi

# Definir ubicaciones

if [ "$distro" == "Ubuntu" ]
    then
    rc7="conf/lubuntu-rc7.xml"
    rc8="conf/lubuntu-rc8.xml"
elif [ "$distro" == "Debian" ]
    then
    rc7="conf/lxde-rc7.xml"
    rc8="conf/lxde-rc8.xml"
else
    echo "$mensaje10"
    exit 1
    
# Definir elección de tema

echo $mensaje1
read respuesta1
respuesta=$respuesta1"_"
if [ $respuesta == "7_" ]
    then
    ob_tema="WinAte7-ob"
    fondo_tema="$HOME/.backgrounds/Win2-7Pixmap.jpg"
    panel_tema="conf/panel7"
    rc="$rc7"
else
    ob_tema="WinAte8-ob"
    fondo_tema="$HOME/.backgrounds/img0.jpg"
    panel_tema="conf/panel8"
    rc="$rc8"
fi

# Definir comprobación de carpetas

function comprobar(){
        if [ -e $1 ]
            then
            echo "$1 : $mensaje7"
        else
            echo "$1 : $mensaje6"
            mkdir $1
        fi
        }

# Comprobación de carpetas de destino

comprobar backup
comprobar ~/.fonts
comprobar ~/.themes
comprobar ~/.icons
comprobar ~/.backgrounds

# Definir copia de archivos

cp -r ./Win2-7 ~/.icons/
cp -r ./Win2-7-fixed ~/.themes/
cp -r ./aero-drop ~/.icons/
cp -r $ob_tema ~/.themes/
cp fonts/* ~/.fonts/
cp backgrounds/* ~/.backgrounds/

# Definir procesos individuales de respaldo

function respanel(){
    
    }

function respcmanfm(){
    
    }
    
function resopenbox(){
    
    }
    
function reslxsession(){
    
    }
    
# Definir procesos individuales de configuración

function conf_panel(){
    
    }
    
function conf_pcmanfm(){
    
    }
    
function conf_openbox(){
    
    }
    
function conf_lxsession(){
    
    }

# Proceso general

