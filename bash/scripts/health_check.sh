#!/usr/bin/env bash
# Exercice 18 : vérifie l'espace disque disponible et alerte (exit code non-zéro)
# si moins de 10% libre sur le disque courant.
#
# Usage: ./health_check.sh

set -euo pipefail

SEUIL=10  # % minimum d'espace libre requis

# TODO: récupérer le pourcentage d'espace UTILISÉ du disque courant (df -h .)

# TODO: en déduire le pourcentage libre, comparer au SEUIL

# TODO: si en dessous du seuil, afficher une alerte et quitter avec exit 1
#       sinon, afficher un message OK et quitter avec exit 0
