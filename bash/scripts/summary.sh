#!/usr/bin/env bash
# Exercice 11 : pour chaque .csv du dossier passé en argument,
# affiche son nom, son nombre de lignes et sa taille.
#
# Usage: ./summary.sh <dossier>
dossier="$1"
echo "$dossier"
for fichier in "$dossier"/*.csv; do
    nb_lignes=$(wc -l < "$fichier")
    taille=$(du -h "$fichier" | cut -f1)
    echo "$fichier : $nb_lignes lignes, $taille"
done

# set -euo pipefail



# TODO: vérifier qu'un argument a été fourni, sinon afficher un usage et quitter (exit 1)

# TODO: boucler sur les fichiers *.csv du dossier

# TODO: pour chaque fichier, afficher : nom, nombre de lignes (wc -l), taille (du -h)
