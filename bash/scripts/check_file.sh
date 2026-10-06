#!/usr/bin/env bash
# Usage: ./check_file.sh <fichier>

if [ -z "$1" ]; then
    echo "Usage: $0 <fichier>" >&2
    exit 1
fi

fichier="$1"

if [ ! -f "$fichier" ]; then
    echo "Erreur : $fichier n'existe pas ou n'est pas un fichier régulier" >&2
    exit 1
fi

# TODO: pareil pour -r (lisible)

# TODO: pareil pour -s (non vide)

echo "OK : $fichier existe, est lisible et n'est pas vide"
