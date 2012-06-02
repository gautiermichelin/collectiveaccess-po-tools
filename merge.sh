#!/bin/bash
# this script folder must be installed inside your collectiveaccess,
# and called from the ca root directory (the one containing setup.php)
# script syntax : ./ca_po_tools/update.sh locale_LOCALE
if [ $# = 2 ]
then
if (test -e "./app/locale/$1/messages.po")
then
rm app/locale/$1/messages.bak.3
mv app/locale/$1/messages.bak.2 app/locale/$1/messages.bak.3
mv app/locale/$1/messages.bak.1 app/locale/$1/messages.bak.2
mv app/locale/$1/messages.bak app/locale/$1/messages.bak.1
cp app/locale/$1/messages.po app/locale/$1/messages.bak
mv app/locale/$1/messages.po app/locale/$1/0.po
msgmerge app/locale/$1/0.po $2 > app/locale/$1/messages.po
rm app/locale/$1/0.po
echo ""
echo "merge.sh"
echo "------------"
echo "CA locale messages merged with $2 : app/locale/$1"
echo ""
else
echo ""
echo "merge.sh"
echo "------------"
echo "This script must be called from the ca root directory (the one containing setup.php)"
echo "ERROR : no messages.po in ./app/locale/$1"
echo ""
fi
else
echo ""
echo "merge.sh"
echo "------------"
echo "script syntax : ./ca_po_tools/update.sh locale_LOCALE path_to/file.po"
echo "with locale_LOCALE as your locale code, eg fr_FR"
echo ""
fi