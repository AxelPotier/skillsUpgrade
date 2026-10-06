#!/usr/bin/env bash
# Exercice 20 : mini-pipeline
#   1. vérifie que postings.csv existe
#   2. lance un script Python (ou spark-submit)
#   3. vérifie le code de sortie ($?)
#   4. n'écrit "SUCCESS" que si tout s'est bien passé
#
# Usage: ./run_pipeline.sh

set -euo pipefail

DATA_FILE="../data_engineering/data/postings.csv"

# TODO: vérifier que $DATA_FILE existe, sinon message d'erreur + exit 1

# TODO: lancer un traitement (ex: python un_script.py, ou un simple echo pour tester
#       la structure du pipeline avant d'avoir le vrai script)

# TODO: vérifier le code de sortie de la commande précédente ($?)
#       si non-zéro, afficher une erreur et quitter avec ce même code

# TODO: si tout est OK, afficher "SUCCESS"
