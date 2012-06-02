#!/bin/bash
# this script folder must be installed inside your collectiveaccess,
# and called from the ca root directory (the one containing setup.php)
# script syntax : ./ca_po_tools/update.sh locale_LOCALE
if [ $# = 1 ]
then
if (test -e "./app/locale/$1/messages.po")
then
rm app/locale/$1/messages.bak.3
mv app/locale/$1/messages.bak.2 app/locale/$1/messages.bak.3
mv app/locale/$1/messages.bak.1 app/locale/$1/messages.bak.2
mv app/locale/$1/messages.bak app/locale/$1/messages.bak.1
cp app/locale/$1/messages.po app/locale/$1/messages.bak
mv app/locale/$1/messages.po app/locale/$1/0.po
find . -iname "*.php" -or -iname "*.tpl"  | xargs xgettext --force-po -o app/locale/$1/1.po -k_ -k_p -k_t --from-code=utf-8  --language=PHP
find . -iname "*.conf"  | xargs xgettext --force-po -o app/locale/$1/1.po -j -k_ -k_p -k_t --from-code=utf-8 --language=C
clear
msgmerge app/locale/$1/0.po app/locale/$1/1.po > app/locale/$1/messages.po
rm app/locale/$1/0.po
rm app/locale/$1/1.po
echo ""
echo "po_update.sh"
echo "------------"
echo "CA locale messages updated : app/locale/$1"
echo ""
else
echo ""
echo "po_update.sh"
echo "------------"
echo "This script must be called from the ca root directory (the one containing setup.php)"
echo "ERROR : no messages.po in ./app/locale/$1"
echo ""
fi
else
echo ""
echo "po_update.sh"
echo "------------"
echo "script syntax : ./ca_po_tools/update.sh locale_LOCALE"
echo "with locale_LOCALE as your locale code, eg fr_FR"
echo ""
fi