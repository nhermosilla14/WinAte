#!/bin/bash
#
#  WinAte 0.5.2 - Pack de transformación de apariencia para GNU/Linux
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
echo "= WinAte 0.5 - Windows 7/8 (r) Transformation Pack for Debian/LXDE ="
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
clear
echo "Elija idioma para instalar: | Choose language to install: "
echo ""
echo "1)Español"
echo "2)English"
echo ""
echo "1/2?"
read respuesta
if [ $respuesta == "2" ]
then
    mensaje1="What theme do you want to setup?(default 8) 7/8"
    mensaje2="Do you want to setup the wallpaper too? Y/n"
    mensaje3="File backed-up"
    mensaje4="Installation finished. Logout and login again to let changes be applied."
    mensaje5="Press enter to open logout dialog."
    mensaje6="Directory created"
    mensaje7="Directory found"
else
    mensaje1="Qué tema desea configurar?(opción por defecto: 8) 7/8"
    mensaje2="Desea cambiar el fondo de pantalla también? S/n"
    mensaje3="Archivo respaldado"
    mensaje4="Instalación finalizada. Cierre y abra sesión para aplicar los cambios."
    mensaje5="Presione enter para abrir el diálogo de cierre."
    mensaje6="Directorio creado"
    mensaje7="Directorio encontrado"
fi

function comprobar(){
        if [ -e $1 ]
        then
        echo "$1 : $mensaje7"
        else
	echo "$1 : $mensaje6"
        mkdir $1
        fi
}
function respaldar(){
        if [ -e $1 ]
        then
	ubicacion=$1
	let c=${#HOME}+$2
	mv $1 ./backup/${ubicacion:$c}
        echo "$1 : $mensaje3"
        fi
}

clear
echo $mensaje1
read respuesta1
respuesta=$respuesta1"_"
if [ $respuesta == "7_" ]
then
ob_tema="WinAte7-ob"
fondo_tema="$HOME/.backgrounds/Win2-7Pixmap.jpg"
panel_tema="conf/panel7"
else
ob_tema="WinAte8-ob"
fondo_tema="$HOME/.backgrounds/img0.jpg"
panel_tema="conf/panel8"
fi
comprobar backup
comprobar ~/.fonts
comprobar ~/.themes
comprobar ~/.icons
comprobar ~/.backgrounds
comprobar ~/.config/lxsession
comprobar ~/.config/lxsession/LXDE
cp -r ./Win2-7 ~/.icons/
cp -r ./Win2-7-fixed ~/.themes/
cp -r ./aero-drop ~/.icons/
cp -r $ob_tema ~/.themes/
cp fonts/* ~/.fonts/
cp backgrounds/* ~/.backgrounds/
#Respaldo y configuración panel
respaldar ~/.config/lxpanel/LXDE/panels/panel 29
comprobar ~/.config/lxpanel/
comprobar ~/.config/lxpanel/LXDE
comprobar ~/.config/lxpanel/LXDE/panels
cp $panel_tema ~/.config/lxpanel/LXDE/panels/panel
echo "#!/bin/bash" > uninstall.sh
echo "#Recuperación panel" >> uninstall.sh
echo "killall lxpanel" >> uninstall.sh
echo "rm ~/.config/lxpanel/LXDE/panels/panel" >> uninstall.sh
echo "cp backup/panel ~/.config/lxpanel/LXDE/panels/panel" >> uninstall.sh
#Respaldo y configuración PCManFM
echo $mensaje2
read respuesta1
respuesta=$respuesta1"_"
if [ $respuesta != "n_" ] && [ $respuesta != "N_" ]
then
respaldar ~/.config/pcmanfm/LXDE/pcmanfm.conf 22
comprobar ~/.config/pcmanfm/
comprobar ~/.config/pcmanfm/LXDE
pcmanfm -w $fondo_tema --wallpaper-mode=stretch
echo "#Recuperación PCManFM" >> uninstall.sh
echo "fondo=\$(cat backup/pcmanfm.conf | grep wallpaper=)" >> uninstall.sh
echo "ubicacion=\"\${fondo:10}\"" >> uninstall.sh
echo "pcmanfm -w \"\$ubicacion\" --wallpaper-mode=stretch" >> uninstall.sh
fi
#Configuración QT4
rm ~/.config/Trolltech.conf
cp conf/Trolltech.conf ~/.config/Trolltech.conf
#Respaldo y configuración LXSession
respaldar ~/.config/lxsession/LXDE/desktop.conf 37
comprobar ~/.config/lxsession
comprobar ~/.config/lxsession/LXDE
cp conf/desktop.conf ~/.config/lxsession/LXDE/desktop.conf
echo "rm ~/.config/lxsession/LXDE/desktop.conf" >> uninstall.sh
echo "cp backup/desktop.conf ~/.config/lxsession/LXDE/desktop.conf" >> uninstall.sh
respaldar ~/.config/lxsession/LXDE/autostart 24
rm ~/.config/lxsession/LXDE/autostart
echo "@pcmanfm --desktop --profile LXDE" >> ~/.config/lxsession/LXDE/autostart
#Respaldo y configuración Openbox
respaldar ~/.config/openbox/lxde-rc.xml 17
comprobar ~/.config/openbox/
cp conf/lxde-rc.xml ~/.config/openbox/lxde-rc.xml
echo "killall openbox" >> uninstall.sh
echo "rm ~/.config/openbox/lxde-rc.xml" >> uninstall.sh
echo "cp backup/lxde-rc.xml ~/.config/openbox/lxde-rc.xml" >> uninstall.sh
echo "rm ~/.config/lxsession/autostart" >> uninstall.sh
echo "cp backup/autostart ~/.config/lxsession/autostart" >> uninstall.sh
echo "rm -r backup" >> uninstall.sh
echo "rm -r ~/.icons/aero-drop" >> uninstall.sh
echo "rm -r ~/.icons/Win2-7" >> uninstall.sh
echo "rm -r ~/.themes/$ob-tema" >> uninstall.sh
echo "rm -r ~/.themes/Win2-7-fixed" >> uninstall.sh
echo "rm ~/.backgrounds/img*" >> uninstall.sh
echo "echo \"Cierre sesión y reábrala. | Logout and login.\""
echo "lxsession-logout"
chmod +x uninstall.sh
clear
echo $mensaje4
echo $mensaje5
read
lxsession-logout
