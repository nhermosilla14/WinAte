#/bin/bash
#Recuperación panel
killall lxpanel
rm ~/.config/lxpanel/LXDE/panels/panel
cp backup/panel ~/.config/lxpanel/LXDE/panels/panel
#Recuperación PCManFM
killall pcmanfm
rm ~/.config/pcmanfm/LXDE/pcmanfm.conf
cp backup/pcmanfm.conf ~/.config/pcmanfm/LXDE/pcmanfm.conf
#Recuperación LXSession
rm ~/.config/lxsession/LXDE/desktop.conf
cp backup/desktop.conf ~/.config/lxsession/LXDE/desktop.conf
#Recuperación openbox
killall openbox
rm ~/.config/openbox/lxde-rc.xml
cp backup/lxde-rc.xml ~/.config/openbox/lxde-rc.xml
rm ~/.config/lxsession/autostart
cp backup/autostart ~/.config/lxsession/autostart
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
echo "Desinstalación finalizada. Cierre sesión y abra nuevamente para que las configuraciones tengan efecto."
echo "Installation finished. Logout and login again to let changes be applied."
echo "Presione enter... | Press enter..."
read
lxsession-logout
