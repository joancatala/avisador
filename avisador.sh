#!/bin/bash
# autor: joan <joan@riseup.net>

# URL que volem monitoritzar
url="http://URL_DE_LA_PAGINA_QUE_VOLS_MONITORITZAR"

# Ruta temporal d'on tenim enmagatzemada la web a comparar
temp=/kunden/homepages/37/d329291155/htdocs/joancatala.net/script_avisador/joancatala

# Obtenim la pàgina, esborrem contingut dinàmic del newrelic i comparem amb diff
modified=$(wget -q -O $temp $url ; diff ${temp} ${temp}.1 |grep -v newrelic |grep -v -- "--" |grep -v 8c8 )

# Especifiquem ací la teu aadreça de correu
email="EL_TEU_CORREU_ELECTRONIC"

# Comprovem si s'ha modificat el fitxer amb més de 0 caracters
if [[ ! -z "$modified" && ${#modified} -gt 0 ]]; then
# S'ha modificat, així que m'enviarà un correu
#echo $url has changed $modified - modified| mail -s "CANVIS A LA WEB" ${email}
mail -s "CANVIS A LA WEB" ${email} #
# Copia la versió actual en un segon arxiu per a comparar-ho la següent vegada
cp ${temp} ${temp}.1
fi