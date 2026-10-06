#!/usr/bin/env bash
# Exercice 19 : lit une clé/chemin depuis une variable d'environnement plutôt
# qu'en dur dans le script, avec message d'erreur si elle n'est pas définie.
#
# Usage: MY_API_KEY=xxxx ./read_env_var.sh

set -euo pipefail

# TODO: vérifier si la variable d'environnement MY_API_KEY est définie et non vide
#       (indice: ${VAR:-} avec un test sur chaîne vide, ou [ -z "${VAR:-}" ])

# TODO: si absente, afficher un message d'erreur explicite et quitter (exit 1)

# TODO: si présente, l'utiliser (par exemple l'afficher partiellement, ou l'utiliser
#       dans un curl -H "Authorization: Bearer $MY_API_KEY" ...)
