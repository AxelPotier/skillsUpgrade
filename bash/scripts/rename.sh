#!/usr/bin/env bash
# Exercice 12 : renomme tous les .csv d'un dossier en .csv.bak
#
# Usage: ./rename.sh <dossier>

dossier="$1"  # dossier passé en argument, guillemets pour éviter le découpage en mots

for fichier in "$dossier"/*.csv; do        # glob développé par bash AVANT la boucle : une itération par fichier .csv trouvé
    base="${fichier%.csv}"                 # retire le suffixe ".csv" -> ex: "data/companies.csv" devient "data/companies"
    mv "$fichier" "$base.bak"              # renomme : "data/companies.csv" -> "data/companies.bak"
done