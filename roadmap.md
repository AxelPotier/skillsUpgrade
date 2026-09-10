# Roadmap de montée en compétences — Data / ML / GenAI

> Objectif : construire un profil **Applied Scientist / ML Engineer / AI Engineer** en capitalisant sur un doctorat en proba-stat, une expérience en logistique et un postdoctorat actuel en RH + NLP / GenAI / encodeurs.

---

## 1. Positionnement cible

### Profil de départ

- Doctorat en probabilités / statistiques
- Travaux appliqués à des problématiques de logistique
- Postdoctorat sur des problématiques RH
- NLP, GenAI, encodeurs
- Solide culture scientifique et modélisation

### Positionnement recommandé

**Proba / Stats → ML → NLP / GenAI → MLOps → Cloud / Data Engineering**

L'objectif n'est pas de devenir un Data Scientist généraliste, mais de compléter l'expertise scientifique par les compétences permettant de **construire, déployer et maintenir des systèmes ML / GenAI en production**.

### Métiers à cibler

- Applied Scientist
- ML Engineer
- AI Engineer
- Research Engineer
- Applied ML Scientist
- GenAI Engineer
- NLP Scientist / Engineer

À envisager également :
- Decision Scientist
- Data Scientist spécialisé en optimisation
- AI Research Engineer

---

# 2. Priorités de montée en compétences

| Priorité | Domaine | Objectif |
|---|---|---|
| 🔴 1 | MLOps / production ML | Passer du modèle au système en production |
| 🔴 2 | LLM / GenAI engineering | Approfondir le postdoc et maîtriser la mise en production |
| 🔴 3 | Data Engineering | Maîtriser les pipelines et architectures data |
| 🟠 4 | Cloud | Déployer et exploiter les systèmes ML |
| 🟠 5 | Software engineering / APIs | Transformer les modèles en services utilisables |
| 🟡 6 | Airflow / orchestration | Industrialiser les pipelines |
| 🟡 7 | Data quality / monitoring | Fiabiliser les données et les modèles |
| 🟡 8 | Azure | À apprendre selon les postes visés |

---

# 3. Mois 1–2 — Software Engineering + Python production

## Compétences

- Python avancé
  - typing
  - packaging
  - async
- Git / GitHub
- pytest
- Docker
- FastAPI
- Pydantic
- logging
- architecture de projets
- tests unitaires et d'intégration

## Projet

Transformer un modèle NLP existant en **API Dockerisée** :

```text
Modèle NLP
   ↓
FastAPI
   ↓
Docker
   ↓
Tests
   ↓
Documentation
```

### Critères de réussite

- projet structuré proprement
- tests automatisés
- Dockerfile
- API documentée
- README clair
- CI basique

---

# 4. Mois 2–4 — Data Engineering

## Compétences

### SQL

- requêtes complexes
- window functions
- optimisation
- modélisation de données

### Spark / PySpark

- DataFrames
- transformations
- joins
- partitionnement
- Parquet
- optimisation

### Architecture data

- data lake
- lakehouse
- batch vs streaming
- data ingestion
- data quality

### Orchestration

- Airflow
- DAGs
- dépendances
- scheduling
- retries

## Projet

Construire un pipeline RH :

```text
Raw data
   ↓
Ingestion
   ↓
Spark / PySpark
   ↓
Transformations
   ↓
Data quality
   ↓
Features
   ↓
Modèle ML
```

### À savoir expliquer

- pourquoi Spark plutôt que pandas
- comment partitionner les données
- comment gérer les données corrompues
- comment rejouer un pipeline
- comment monitorer sa qualité

---

# 5. Mois 4–6 — MLOps + Cloud

## MLOps

- MLflow
- experiment tracking
- model registry
- versioning
- CI/CD
- model deployment
- monitoring
- data drift
- model drift
- tests ML
- batch inference
- online inference

## Cloud — priorité GCP

Apprendre en priorité :

- BigQuery
- Cloud Storage
- Compute
- IAM
- Vertex AI
- services serverless
- notions de Kubernetes

> Il vaut mieux maîtriser un cloud correctement que connaître superficiellement plusieurs clouds.

## Projet

Prendre le projet ML précédent et ajouter :

```text
Data
 ↓
Training
 ↓
MLflow
 ↓
Model Registry
 ↓
API
 ↓
Docker
 ↓
Cloud
 ↓
Monitoring
```

---

# 6. Mois 5–8 — GenAI avancée

Le postdoctorat fournit déjà une base pertinente en NLP / GenAI / encodeurs. L'objectif est donc de compléter cette expertise par l'architecture et l'industrialisation.

## LLM Engineering

- embeddings
- vector databases
- RAG
- chunking
- retrieval
- reranking
- prompt engineering
- structured output
- function / tool calling
- agents
- fine-tuning
- LoRA
- inference

## Évaluation des LLM

C'est un axe particulièrement intéressant compte tenu du background proba/stat.

À travailler :

- métriques d'évaluation
- comparaison de modèles
- tests statistiques
- calibration
- uncertainty
- robustesse
- analyse d'erreurs
- biais
- évaluation humaine vs automatique

### Positionnement différenciant

> **Construire des systèmes GenAI et être capable de démontrer statistiquement qu'ils fonctionnent.**

Cette combinaison peut être plus différenciante qu'un profil uniquement orienté LLM engineering.

---

# 7. Mois 7–10 — Projet phare

## HR Intelligence / Talent Analytics

Construire un projet complet qui combine :

```text
Documents RH
      ↓
Ingestion
      ↓
Nettoyage / anonymisation
      ↓
Embeddings
      ↓
Retrieval
      ↓
Reranking
      ↓
LLM
      ↓
Scoring
      ↓
API
      ↓
Monitoring
```

## Partie scientifique

Ajouter une vraie dimension expérimentale :

- comparaison de plusieurs encodeurs
- comparaison de plusieurs stratégies de retrieval
- calibration
- intervalles de confiance
- analyse statistique des erreurs
- robustesse
- biais
- évaluation humaine
- tests statistiques

### Pourquoi ce projet est important

Il permet de relier les différentes parties du profil :

**Proba / Stats + ML + NLP + GenAI + Software + MLOps**

plutôt que de présenter ces compétences comme des expériences indépendantes.

---

# 8. Les 3 projets GitHub à privilégier

## Projet 1 — Production ML

### Objectif

Construire une application ML complète.

### Stack possible

```text
Python
FastAPI
Docker
MLflow
pytest
GitHub Actions
```

### Message CV

> Designed and deployed an end-to-end production ML service with experiment tracking, automated testing and containerized inference.

---

## Projet 2 — Data Engineering

### Objectif

Construire un pipeline data réaliste.

### Stack possible

```text
SQL
PySpark
Airflow
Parquet
Data Quality
Docker
```

### Message CV

> Built an end-to-end data pipeline with distributed processing, orchestration and automated data-quality monitoring.

---

## Projet 3 — GenAI + statistiques ⭐

### Objectif

Construire un système RAG / recherche sémantique RH avec évaluation statistique.

### Stack possible

```text
Encoder
 ↓
Embeddings
 ↓
Vector DB
 ↓
Retriever
 ↓
Reranker
 ↓
LLM
 ↓
Evaluation
```

### Partie différenciante

Comparer rigoureusement :

- différents encodeurs
- différentes stratégies de retrieval
- différents modèles
- différentes métriques

avec une analyse statistique des résultats.

### Message CV

> Developed and statistically evaluated an end-to-end RAG system for HR applications, combining transformer encoders, retrieval, reranking and LLM-based generation.

---

# 9. Ce qu'il ne faut PAS prioriser

Avec un doctorat en proba/stat et une expérience actuelle en NLP/GenAI, éviter de consacrer beaucoup de temps à reprendre des fondamentaux déjà maîtrisés :

- régression linéaire
- statistiques descriptives
- bases du ML
- pandas débutant
- scikit-learn débutant
- Python débutant
- théorie générale des probabilités

Le meilleur retour sur investissement est plutôt :

**industrialisation + GenAI + data engineering + cloud + évaluation statistique.**

---

# 10. Fil rouge à utiliser sur le CV

Éviter de présenter le parcours comme :

> Probabilités → logistique → RH → NLP → GenAI → Data Engineering

Cela peut donner une impression de dispersion.

Préférer :

> **Quantitative modelling → Machine Learning → NLP / GenAI → Production AI**

avec les compétences de proba/stat comme fondation scientifique.

### Proposition de pitch

> **Applied Scientist / ML Engineer with a PhD in Probability & Statistics and research experience in logistics and HR, specializing in machine learning, NLP and Generative AI, with a focus on statistical evaluation and production-grade AI systems.**

---

# 11. Checklist de progression

## Fondations software

- [ ] Python production
- [ ] Git avancé
- [ ] pytest
- [ ] Docker
- [ ] FastAPI

## Data Engineering

- [ ] SQL avancé
- [ ] PySpark
- [ ] Parquet
- [ ] Data lake / lakehouse
- [ ] Airflow
- [ ] Data quality

## MLOps

- [ ] MLflow
- [ ] Model registry
- [ ] CI/CD
- [ ] Monitoring
- [ ] Drift
- [ ] Deployment

## Cloud

- [ ] GCP
- [ ] BigQuery
- [ ] Cloud Storage
- [ ] Vertex AI
- [ ] Kubernetes basics

## GenAI

- [ ] Embeddings
- [ ] Vector DB
- [ ] RAG
- [ ] Reranking
- [ ] Fine-tuning / LoRA
- [ ] Agents
- [ ] LLM evaluation

## Différenciation scientifique

- [ ] Statistical evaluation
- [ ] Uncertainty
- [ ] Calibration
- [ ] Robustness
- [ ] Bias evaluation
- [ ] Experimental design

---

# 12. Résultat attendu après 6–12 mois

L'objectif est de pouvoir présenter un profil capable de couvrir toute la chaîne :

```text
                    ┌─────────────────┐
                    │  Proba / Stats  │
                    └────────┬────────┘
                             ↓
                    ┌─────────────────┐
                    │       ML        │
                    └────────┬────────┘
                             ↓
                    ┌─────────────────┐
                    │   NLP / GenAI   │
                    └────────┬────────┘
                             ↓
                    ┌─────────────────┐
                    │ Data Engineering│
                    └────────┬────────┘
                             ↓
                    ┌─────────────────┐
                    │     MLOps       │
                    └────────┬────────┘
                             ↓
                    ┌─────────────────┐
                    │ Cloud / Serving │
                    └─────────────────┘
```

### Positionnement final

**Scientifique quantitativiste → Applied Scientist / ML Engineer / AI Engineer**

avec une spécialisation particulièrement intéressante à l'intersection :

**Statistiques × NLP × GenAI × Évaluation × Industrialisation**

---

## Ressources / suivi

Ce document est volontairement en **Markdown pur**, sans dépendance à une application particulière. Il peut être versionné avec Git et ouvert directement dans **Obsidian, VS Code, Typora, MarkText**, ou importé dans d'autres outils compatibles Markdown.

## Prochaine étape

Créer un second fichier `roadmap-ressources.md` avec, pour **chaque compétence**, les ressources d'apprentissage, exercices et projets, ainsi qu'une estimation du temps nécessaire.
