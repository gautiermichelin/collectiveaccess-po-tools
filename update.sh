#!/bin/bash
echo '' > app/locale/fr_FR/new_messages.po
rm app/locale/fr_FR/old_messages.po
mv app/locale/fr_FR/messages.po app/locale/fr_FR/old_messages.po
find . -iname "*.php" -or -iname "*.conf" -or -iname "*.tpl" | xargs xgettext --force-po -o app/locale/fr_FR/new_messages.po -k_ -k_p -k_t --language=php --from-code=utf-8
msgmerge app/locale/fr_FR/old_messages.po app/locale/fr_FR/new_messages.po > app/locale/fr_FR/messages.po
rm app/locale/fr_FR/new_messages.po
