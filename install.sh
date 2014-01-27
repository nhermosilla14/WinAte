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
echo "= Este script sólo ha sido probado en Debian 8 (Jessie), y sólo se recomienda  ="
echo "=  para su uso en Debian, Crunchbang (no probado) y Ubuntu. En otras distros   ="
echo "=    se considera experimental. Siempre requiere al menos la versión 0.4.9 de  ="
echo "=                            LXSession.                                        ="
echo "=------------------------------------------------------------------------------="
echo "= This script has been only tested in Debian 8 (Jessie), and it's only intented="
echo "= to be used in Debian,Crunchbang(not tested) and Ubuntu. In other distros it's="
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
    mensaje3="Configuration backed-up"
    mensaje4="Installation finished. Reboot to apply changes."
    mensaje5="Press enter to open logout dialog."
    mensaje6="Directory created"
    mensaje7="Directory found"
    mensaje8="Your distro seems to be"
    mensaje9=". Is that right? (Y/n)"
    mensaje10="System directories do not match, or distribution unsupported. To force installation, use script with \"--force\". Exiting..."
    mensaje11="Type your distro:"
    mensaje12="Installer must exit now."
else
    si="s"
    SI="S"
    mensaje1="Qué tema desea configurar?(opción por defecto: 8) 7/8"
    mensaje2="Desea cambiar el fondo de pantalla también? S/n"
    mensaje3="Configuración respaldada."
    mensaje4="Instalación finalizada. Reinicie para aplicar los cambios."
    mensaje5="Presione enter para abrir el diálogo de cierre."
    mensaje6="Directorio creado"
    mensaje7="Directorio encontrado"
    mensaje8="Su distro parece ser"
    mensaje9=". ¿Es correcto?(S/n)"
    mensaje10="Las carpetas de sistema no coinciden, o la distribución no está soportada. Para forzar la instalación, use \"--force\". Saliendo..."
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

# Definir ubicaciones para cada distro

if [ "$distro" == "Ubuntu" ]
    then
    if [ -d $HOME/.config/lxsession/Lubuntu ]
        then
        echo "$mensaje10"
        exit 1
    fi 
    ## COMPROBAR QUE NO SEA LUBUNTU Y LUEGO:
    lxpanel_config="$HOME/.config/lxpanel/LXDE/panels"
    #panel="conf/panel_ubuntu"
    openbox_config="$HOME/.config/openbox"
    openbox_tgt="lxde-rc.xml"
    pcmanfm_config="$HOME/.config/pcmanfm/LXDE"
    lxsession_config="$HOME/.config/lxsession/LXDE"
    lxsession7_set="conf/desktop7_ubuntu.conf"
    lxsession8_set="conf/desktop8_ubuntu.conf"
    lxsession_profile="LXDE"
    rc7="conf/lxde-rc7.xml"
    rc8="conf/lxde-rc8.xml"
elif [ "$distro" == "Debian" ]
    then
    lxpanel_config="$HOME/.config/lxpanel/LXDE/panels"
    #panel="conf/panel_debian"
    openbox_config="$HOME/.config/openbox"
    openbox_tgt="lxde-rc.xml"
    pcmanfm_config="$HOME/.config/pcmanfm/LXDE"
    lxsession_config="$HOME/.config/lxsession/LXDE"
    lxsession7_set="conf/desktop7_debian.conf"
    lxsession8_set="conf/desktop8_debian.conf"
    lxsession_profile="LXDE"
    rc7="conf/lxde-rc7.xml"
    rc8="conf/lxde-rc8.xml"
else
    echo "$mensaje10"
    exit 1
fi    
# Definir elección de tema

echo $mensaje1
read respuesta1
respuesta=$respuesta1"_"
if [ $respuesta == "7_" ]
    then
    ob_tema="WinAte7-ob"
    fondo_tema="$HOME/.backgrounds/Win2-7Pixmap.jpg"
    panel_tema="conf/panel7"
    lxsession_set="$lxsession7_set"
    rc="$rc7"
else
    ob_tema="WinAte8-ob"
    fondo_tema="$HOME/.backgrounds/img0.jpg"
    panel_tema="conf/panel8"
    rc="$rc8"
    lxsession_set="$lxsession8_set"
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

# Definir procesos individuales de respaldo

function respanel(){
    mv "$lxpanel_config/"* ./backup/lxpanel
    echo "$lxpanel_config : $mensaje3"
    echo "rm $lxpanel_config/panel" >> uninstall.sh
    echo "mv ./backup/lxpanel/* $lxpanel_config/" >> uninstall.sh
    }

function respcmanfm(){
    cp $pcmanfm_config/pcmanfm.conf ./backup/pcmanfm
    echo "fondo=\$(cat backup/pcmanfm/pcmanfm.conf | grep wallpaper=)" >> uninstall.sh
    echo "ubicacion=\"\${fondo:10}\"" >> uninstall.sh
    echo "pcmanfm -w \"\$ubicacion\" --wallpaper-mode=stretch" >> uninstall.sh 
    }
    
function resopenbox(){
    mv $openbox_config/lxde-rc.xml ./backup/openbox/
    echo "$openbox_config : $mensaje3"
    echo "rm $openbox_config/lxde-rc.xml" >> uninstall.sh
    echo "cp backup/openbox/lxde-rc.xml $openbox_config/lxde-rc.xml" >> uninstall.sh
    }
    
function reslxsession(){
    mv "$lxsession_config/desktop.conf" "backup/lxsession/"
    mv "$lxsession_config/autostart" "backup/lxsession/"
    echo "rm $lxsession_config/*" >> uninstall.sh
    echo "cp backup/lxsession/desktop.conf $lxsession_config" >> uninstall.sh
    echo "cp backup/lxsession/autostart $lxsession_config" >> uninstall.sh
    }
    
# Definir procesos individuales de configuración

function conf_panel(){
    cp "$panel_tema" "$lxpanel_config/panel"
    }
    
function conf_pcmanfm(){
    echo "$mensaje2"
    read respuesta1
    respuesta=$respuesta1"_"
    if [ "$respuesta" != "n_" ] && [ "$respuesta" != "N_" ]
        then
        respcmanfm
        pcmanfm -w "$fondo_tema" --wallpaper-mode=stretch
        
    fi
    }
    
function conf_openbox(){
    cp "$rc" "$openbox_config/$openbox_tgt"
    }
    
function conf_lxsession(){
    #linea_ori_0="$(cat ~/.config/lxsession/LXDE/desktop.conf | grep composite_manager/command=)"
    #linea_fin_0="composite_manager/command="
    #sed -e s/"$linea_ori_0"/"$linea_fin_0"/g "$lxsession_config/" > temp
    cp "$lxsession_set" "$lxsession_config/desktop.conf"
    echo "@pcmanfm --desktop --profile $lxsession_profile" >> "$lxsession_config/autostart"
    }

# Comprobación de carpetas de destino

comprobar backup
comprobar backup/lxpanel
combrobar backup/pcmanfm
comprobar backup/openbox
comprobar backup/lxsession
comprobar ~/.fonts
comprobar ~/.themes
comprobar ~/.icons
comprobar ~/.backgrounds
comprobar ~/.config/openbox/
comprobar ~/.config/lxpanel
comprobar ~/.config/pcmanfm
comprobar ~/.config/lxsession       

# Definir copia de archivos

cp -r ./Win2-7 ~/.icons/
cp -r ./Win2-7-fixed ~/.themes/
cp -r ./Win2-8-fixed ~/.themes/
cp -r ./aero-drop ~/.icons/
cp -r ./win8 ~/.icons/
cp -r $ob_tema ~/.themes/
cp fonts/* ~/.fonts/
cp backgrounds/* ~/.backgrounds/
echo '#!/bin/bash' > uninstall.sh

reslxsession
resopenbox
respanel
conf_lxsession
conf_openbox
conf_panel
conf_pcmanfm
echo "rm -r backup" >> uninstall.sh
echo "rm -r ~/.icons/aero-drop" >> uninstall.sh
echo "rm -r ~/.icons/win8" >> uninstall.sh
echo "rm -r ~/.icons/Win2-7" >> uninstall.sh
echo "rm -r ~/.themes/$ob_tema" >> uninstall.sh
echo "rm -r ~/.themes/Win2-7-fixed" >> uninstall.sh
echo "rm ~/.backgrounds/img*" >> uninstall.sh
echo "echo \"Reinicie su equipo. | Reboot your pc.\"" >> uninstall.sh
echo "lxsession-logout" >> uninstall.sh
chmod +x uninstall.sh >> uninstall.sh
clear
echo "$mensaje4"
echo "$mensaje5"
read
lxsession-logout
