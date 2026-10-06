# Bash / Unix — exercices

Exercices pratiques sur les fichiers de `../data_engineering/data/` (postings.csv, companies.csv, ...),
orientés data scientist / data engineer : manipulation de texte, scripts, pipelines.

Pas de solutions fournies volontairement — tester en ligne de commande, itérer.

## Niveau 1 — Fichiers et texte de base

1. Nombre de lignes de `postings.csv` sans l'ouvrir dans un éditeur (`wc -l`)
2. Affiche uniquement la ligne d'en-tête, puis les 5 premières lignes de données (`head`)
3. Compte les colonnes de `postings.csv` (`head -1 | tr ',' '\n' | wc -l`)
4. Liste tous les `.csv` de `data_engineering/data/` triés par taille décroissante (`du`, `sort`)
5. Combien de lignes de `postings.csv` contiennent le mot `"Manager"` ? (`grep -c`)

## Niveau 2 — Pipes, `cut`, `sort`, `uniq`, `awk`

6. Extrais uniquement la colonne `company_name` de `companies.csv` (`cut -d, -f2`)
7. Liste les pays (`country`) de `companies.csv` avec leur nombre d'occurrences, triés du plus fréquent au moins fréquent (`cut` + `sort` + `uniq -c` + `sort -nr`)
8. Filtre les entreprises de `companies.csv` dont `company_size` > 7 (`awk`)
9. Top 10 des villes (`city`) qui reviennent le plus dans `companies.csv`
10. Combien d'entreprises ont un champ `country` vide ?

Ces fichiers ont des champs texte multi-lignes avec guillemets (même problème qu'avec PySpark et
`multiLine`) — `cut`/`awk` sur `,` simple donnera des résultats faux sur certaines lignes. C'est
volontaire : ça illustre pourquoi un vrai parseur CSV (`csvkit`, `xsv`, Spark...) est nécessaire dès
que les données ne sont pas triviales.

## Niveau 3 — Scripts bash (variables, boucles, conditions)

11. `scripts/summary.sh` : pour chaque `.csv` d'un dossier donné en argument, affiche son nom, son
    nombre de lignes et sa taille
12. Dans un dossier de test, renomme tous les `.csv` en `.csv.bak` avec une boucle `for`
13. `scripts/check_file.sh` : vérifie qu'un fichier passé en argument existe, est lisible, et n'est
    pas vide, avec des messages d'erreur clairs
14. `scripts/check_env.sh` : prend `--env dev|staging|prod` en argument et affiche un message
    différent selon la valeur

## Niveau 4 — `find`, `xargs`, permissions

15. Trouve tous les `*.log` de plus de 30 jours dans un dossier (`find -mtime +30`) — utiliser
    `-print` avant d'envisager `-delete`
16. Trouve tous les `.csv` d'un dossier et compte leurs lignes en une seule commande
    (`find ... | xargs wc -l`)
17. Rends un script exécutable seulement par toi (`chmod 700`), et vérifie la différence avec `755`

## Niveau 5 — Pertinent pour un pipeline data

18. `scripts/health_check.sh` : vérifie l'espace disque disponible (`df -h`) et alerte (exit code
    non-zéro) si moins de 10 % libre
19. `scripts/read_env_var.sh` : lit une clé/chemin depuis une variable d'environnement plutôt qu'en
    dur dans le script, avec message d'erreur si elle n'est pas définie
20. `scripts/run_pipeline.sh` : vérifie que `postings.csv` existe → lance un script Python/Spark →
    vérifie le code de sortie (`$?`) → n'écrit "SUCCESS" que si tout s'est bien passé
21. Interroge une API publique avec `curl` (ex. `https://api.github.com/users/<user>`) et extrais un
    champ du JSON avec `jq`

## Niveau 2bis — `sed` et expressions régulières

22. Dans une **copie** de `companies.csv`, remplace toutes les occurrences de `"Inc"` par
    `"Incorporated"` (`sed 's/Inc/Incorporated/g'`) — jamais sur le fichier original directement
23. Affiche uniquement les lignes 10 à 20 de `postings.csv`, sans utiliser `head`/`tail` combinés
    (`sed -n '10,20p'`)
24. Supprime les lignes vides d'un fichier de test que tu crées toi-même (`sed '/^$/d'`)
25. Extrais toutes les URLs (`https://...`) présentes dans `companies.csv` avec une regex
    (`grep -oE 'https?://[^,"]+'`)
26. Remplace tous les espaces multiples par un seul espace dans une chaîne donnée en argument à un
    script (`sed -E 's/ +/ /g'`)

## Niveau 6 — scripts plus avancés

27. Un script qui fait une sauvegarde **horodatée** d'un fichier donné en argument (ex.
    `companies.csv` → `companies_20260406_143000.csv.bak`, avec `date +%Y%m%d_%H%M%S`)
28. Un script de **retry** : il essaie de lancer une commande (donnée en argument) jusqu'à 3 fois,
    avec une pause entre chaque tentative, et échoue proprement si les 3 tentatives ratent — pattern
    très courant pour un appel réseau fragile dans un pipeline
29. Un script qui logge chaque exécution dans un fichier `run.log`, avec un timestamp en préfixe de
    chaque ligne (`date` + redirection `>>`)
30. Compte les occurrences de `country` dans `companies.csv` **sans** `awk`/`uniq`, avec un tableau
    associatif bash (`declare -A compteur`, boucle `while IFS=',' read -r ...`)
31. Un script avec `trap` : affiche un message et nettoie un fichier temporaire si le script est
    interrompu (`Ctrl+C`) ou échoue en cours de route (`trap '...' ERR EXIT`)
32. Utilise `xargs -P` pour traiter plusieurs fichiers `.csv` **en parallèle** (ex. compter leurs
    lignes) plutôt que séquentiellement, et observe la différence de temps avec `time`

## Squelettes

Des squelettes à compléter (TODO) sont dans `scripts/` pour les exercices 11, 13, 14, 18, 19, 20.
Ils sont encore vides — ça vaut le coup de les terminer avant d'attaquer le niveau 6, qui réutilise
les mêmes réflexes (arguments, conditions, exit codes) en les combinant avec des outils en plus.
