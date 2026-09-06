 
# 📡 Conception de la Base de Données Canalbox (Méthode Merise)

Ce projet présente la modélisation complète du système d'information de l'entreprise **Canalbox** (fournisseur d'accès Internet) en utilisant la **méthode Merise** sous **PowerAMC**.

L'objectif est d'illustrer la démarche d'ingénierie des données, depuis l'analyse des règles de gestion jusqu'à la génération du script SQL opérationnel.

---

## 🛠️ Outils & Technologies Utilisés

* **Méthodologie :** Merise (MCD, MLD, MPD)
* **Modélisation :** PowerAMC 16.5
* **Langage SGBD :** SQL (MySQL / PostgreSQL)

---

## 📐 Architecture du Projet

La modélisation respecte le cycle d'abstraction Merise :

### 1. Modèle Conceptuel de Données (MCD)
* Identification des entités principales (Clients, Abonnements, Équipements, Offres, etc.).
* Définition des associations et application stricte des cardinalités d'après le cahier des charges.

### 2. Modèle Logique de Données (MLD)
* Passage au modèle relationnel.
* Prise en compte de la gestion des clés primaires (`PK`) et clés étrangères (`FK`).

### 3. Modèle Physique de Données (MPD)
* Implémentation sous PowerAMC avec spécification des types de données et contraintes d'intégrité.
* Génération automatique du script SQL de création de la base de données.

---

## 📂 Structure du Dépôt:

.
*README.md               
*sql/                    
    BD_Canalbox.sql     (script SQL)
*poweramc/               
    canalbox.cdm
    canalbox.mld
    canalbox.pdm
  *docs/                   
    mcd.png
    mld.png
    mpd.png
