# De l'architecture au code — rendre les concepts architecturaux explicites et vérifiables

> Notes de synthèse à partir de la transcription automatique d'une conférence (probablement Oliver
> Drotbohm, équipe Spring Data / Broadcom). La transcription étant générée automatiquement, le nom
> de l'intervenant et certains termes n'ont pas pu être vérifiés avec certitude.

## Le problème de fond

La plupart des logiciels ne sont pas écrits une fois puis jetés — ils évoluent sur des années
(v1 → v1.1 → v1.2). Ce qui permet de rester productif dans la durée, c'est la **compréhensibilité**
du code, obtenue via trois leviers (Carola Lilienthal) :

- **chunking** — regrouper en modules pour ne pas devoir tout tenir en tête d'un coup
- **hiérarchisation** — packages, classes, unités de build, de déploiement
- **langages de patterns** — des concepts et règles partagés (ex. les building blocks DDD), pour
  qu'un terme comme "Aggregate" désigne la même chose pour tout le monde

## Le fossé architecture ↔ code

En s'appuyant sur George Fairbanks (*Just Enough Software Architecture*) et un papier d'Eden &
Kazman, l'intervenant distingue :

- **Éléments extensionnels** — ce qu'on décrit en énumérant (le code : classes, méthodes concrètes)
- **Éléments intentionnels** — ce qu'on décrit par des concepts et des règles ("c'est une couche,
  une couche ne peut dépendre que des couches inférieures")

Les éléments extensionnels se mappent facilement sur le code. Les éléments intentionnels (les
*vraies* règles d'architecture) sont beaucoup plus durs à faire vivre dans le code — d'où
l'objectif de produire du **"architecturally-evident code"** (terme popularisé par Simon Brown) :
du code qui rend visible l'intention architecturale.

## Exemple concret : les règles DDD tactiques

Un modèle `Order` / `LineItem` / `Customer` où `Order` référence directement l'objet `Customer`
viole la règle de Vaughn Vernon : *"un Aggregate ne doit référencer un autre Aggregate que par son
identifiant"*. Cette règle est facile à énoncer, mais rien ne la vérifie automatiquement par défaut.

## Outils de vérification "après coup"

- **jQAssistant** — persiste le code dans une base de graphe (Neo4j) et exprime concepts + règles
  via des requêtes Cypher
- **ArchUnit** — même idée, en pur Java, plus accessible (s'écrit comme un test)

Problème commun : dans les deux cas, **la définition du concept vit côté outillage**, pas dans le
code lui-même — il faut réécrire "comment reconnaître un Aggregate" à chaque nouveau projet.

## La solution : exprimer les concepts directement dans le code — jMolecules

Projet porté avec Henning Schwentner : des interfaces marqueurs (`AggregateRoot`, `Identifier`...)
qu'on implémente directement dans le code métier.

Bénéfices en cascade :

1. **Vérification gratuite via le compilateur** — le système de types applique déjà une partie des
   règles (ex. l'ID doit implémenter `Identifier`)
2. **Règles prêtes à l'emploi** — jQAssistant/ArchUnit consomment des jars de règles jMolecules
   toutes faites (ex. "value object ne doit pas dépendre d'une entity"), sans les réécrire
3. **Vérification au niveau du compilateur lui-même** — via l'API d'annotation processing,
   jMolecules peut transformer une violation en véritable erreur de compilation (le plus strict,
   mais moins flexible qu'ArchUnit qui permet de "geler" les violations existantes sur un projet
   legacy)
4. **Suppression de boilerplate** — en remplaçant les annotations JPA à la main par des abstractions
   jMolecules (ex. `Association`), la génération de bytecode (ByteBuddy) ajoute automatiquement le
   mapping persistance (JPA/JDBC/MongoDB), gardant les classes du domaine propres de toute
   dépendance technique

## Zoom out : l'architecture en oignon ne résout pas tout

Onion/hexagonal architecture sépare bien le **technique** (domaine vs infrastructure), mais ne dit
rien sur comment **découper le domaine lui-même** (order vs inventory vs shipment). Deux extrêmes
peu satisfaisants : un seul gros oignon pour tout, ou un oignon complet par microservice.

**L'idée de "l'oignon coupé"** : chaque domaine logique a son propre oignon interne
(onion/hexagonal comme détail d'implémentation), mais ces oignons sont ensuite regroupés dans une
seule unité déployable — un **modulith**. Peu importe alors comment chaque module s'organise en
interne.

## Implémentation concrète : Spring Modulith

- Chaque sous-package direct de l'application = un **module logique**, encapsulé par défaut (rien
  n'est exposé sauf indication contraire)
- **Vérification** : `ApplicationModules.of(...).verify()` (basé sur ArchUnit) contrôle que les
  dépendances entre modules respectent les règles déclarées
- **Tests en tranche verticale** : `@ApplicationModuleTest` ne démarre qu'un seul module, sur le
  même principe que `@WebMvcTest`/`@DataJpaTest` de Spring Boot
- **Documentation vivante** : génération automatique de diagrammes de composants (UML) et de
  "module canvas" à partir du code — toujours à jour car dérivée directement des sources à chaque
  build, pas maintenue à la main

## Message central

Il existe désormais un continuum outillé — jMolecules pour exprimer et vérifier les concepts DDD
tactiques dans le code, Spring Modulith pour structurer, vérifier et documenter le découpage en
modules — qui transforme des règles d'architecture autrefois seulement informelles (ou coûteuses à
outiller projet par projet) en éléments **explicites, vérifiables par le compilateur/les tests, et
auto-documentés**.

## Application pratique (hors Java) — transposition Python

Ces outils sont spécifiques à Java/Spring, mais les idées se transposent :

- **`import-linter`** — équivalent Python d'ArchUnit pour les règles de dépendances entre modules
  (contrats `layers`, `independence`, `forbidden`)
- **Value Objects explicites** — `@dataclass(frozen=True)` plutôt que des tuples/dicts génériques
  pour les concepts métier récurrents
- **Structurer par domaine plutôt que par couche technique** — l'équivalent Python du "modulith" :
  un sous-package par domaine métier, avec `__init__.py` comme API publique du module
- **`pydeps`** — génère un graphe de dépendances depuis le vrai code, équivalent partiel de la
  documentation vivante de Spring Modulith

Mis en pratique sur `software_engineering/` : voir `software_engineering/src/app/domain.py`,
`software_engineering/src/app/api.py` et `software_engineering/src/.importlinter` — séparation du
domaine (logique pure) et de l'API (FastAPI), avec vérification automatique en CI que le domaine ne
dépend jamais de FastAPI/Pydantic.
