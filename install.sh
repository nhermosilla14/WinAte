#!/bin/bash
#
#  WinAte 0.4 - Pack de transformación de apariencia para GNU/Linux
#  
#  Copyright 2014 Nicolás Hermosilla P. <nhermosilla14@gmail.com>
#  
#  Contiene porciones del Win2-7 pack, disponible libremente a través de gnome-look.org
#  además de trozos de código de los temas Imagine 7 e Imagine 8 para Openbox, disponibles
#  en SourceForge
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
function comprobar(){
        if [ -e $1 ]
        then
        echo "Carpeta $1 encontrada | Directory $1 found"
        else
	echo "Creado el directorio $1 | Directory $1 created"
        mkdir $1
        fi
}
function respaldar(){
        if [ -e $1 ]
        then
	ubicacion=$1
	let c=${#HOME}+$2
	mv $1 ./backup/${ubicacion:$c}
        echo "Fichero $1 respaldado // File $1 backed-up"
        fi
}
echo "==================================================================="
echo "=                                                                 ="
echo "=  WinAte 0.3 - Windows 7 (r) Transformation Pack for Debian/LXDE ="
echo "=                                                                 ="
echo "=  Copyright 2014 Nicolás Hermosilla P. - nhermosilla14@gmail.com ="
echo "=                                                                 ="
echo "=                                                                 ="
echo "=      Inicializando procesos... / Starting process...            ="
echo "=                                                                 ="
echo "==================================================================="
sleep 2
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
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
comprobar backup
comprobar ~/.fonts
comprobar ~/.themes
comprobar ~/.icons
comprobar ~/.backgrounds
comprobar ~/.config/lxsession
comprobar ~/.config/lxsession/LXDE
cp -r ./Win2-7 ~/.icons/Win2-7
cp -r ./Win2-7-fixed ~/.themes/Win2-7-fixed
cp -r ./aero-drop ~/.icons/aero-drop
cp -r ./WinAte-ob ~/.themes/WinAte-ob
cp fonts/* ~/.fonts/
cp backgrounds/* ~/.backgrounds/
#Respaldo y configuración panel
respaldar ~/.config/lxpanel/LXDE/panels/panel 29
comprobar ~/.config/lxpanel/
comprobar ~/.config/lxpanel/LXDE
comprobar ~/.config/lxpanel/LXDE/panels
cp conf/panel ~/.config/lxpanel/LXDE/panels/panel
#Respaldo y configuración PCManFM
respaldar ~/.config/pcmanfm/LXDE/pcmanfm.conf 22
comprobar ~/.config/pcmanfm/
comprobar ~/.config/pcmanfm/LXDE
pcmanfm -w $HOME/.backgrounds/Win2-7Pixmap.jpg --wallpaper-mode=stretch
#Configuración QT4
rm ~/.config/Trolltech.conf
cp conf/Trolltech.conf ~/.config/Trolltech.conf
#Respaldo y configuración LXSession
respaldar ~/.config/lxsession/LXDE/desktop.conf 37
comprobar ~/.config/lxsession
comprobar ~/.config/lxsession/LXDE
cp conf/desktop.conf ~/.config/lxsession/LXDE/desktop.conf
respaldar ~/.config/lxsession/LXDE/autostart 24
rm ~/.config/lxsession/LXDE/autostart
echo "@pcmanfm --desktop --profile LXDE" >> ~/.config/lxsession/LXDE/autostart
#Respaldo y configuración Openbox
respaldar ~/.config/openbox/lxde-rc.xml 17
comprobar ~/.config/openbox/
cp conf/lxde-rc.xml ~/.config/openbox/lxde-rc.xml
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo "Instalación finalizada. Cierre y abra sesión para aplicar los cambios."
echo "Installation finished. Logout and login again to let changes be applied."
echo "Presione enter para abrir el diálogo de cierre. | Press enter to open logout dialog."
read
lxsession-logout
