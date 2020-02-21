# Modèle HBase

## Sujet

Etape 1 : Proposer un schéma de base HBase pour des tables destinées à consulter les films, les clients et les locations de la base Sakila dont
la structure relationnelle MySQL est décrite ici.

> Remarque : A chaque table MySQL ne correspond pas une table HBase

Etape 2 : Ecrire le script HBase Shell de création de la base

Etape 3 (optionnel) : Proposer un MapReduce Java qui extrait les données du CSV pour remplir 1 table de votre choix dans votre base HBase.

## Compétences

- Structurer une base de données orientée colonne
- Interroger une base orientée colonne

## Livrable

Un document PDF contenant la structure de chaque table :
- Nom de table
- Composition de la clé (à partir de quel(s) champ(s))
- Familles de colonnes : Nom, Versions, description, Liste de colonnes (+description)

Un copier/coller du script de création de la base HBase ou un lien vers un dépôt public avec ce script et le code du MapReduce Java d'alimentation.


## Utilisation
Pour réaliser correctement le TP il faut utiliser les commandes suivantes:

### Le dossier input

- Créer le dossier d'input : `hdfs dfs -mkdir /input`
- Placer les données dans le dossier input `hdfs dfs -put <File.csv> /input`
- Vérifier le contenue du dossier input `hdfs dfs -ls /input`

### Le dossier output
- Vérifier le contenue du dossier output `hdfs dfs -ls /output`
- Supprimer le dossier output `hdfs dfs -rm -r /output`
- Afficher le résultat du reducer `hdfs dfs -cat /output/<ResultFilename>`

### La création du jar
Dans eclipse, Assurez-vous d'abord que le jar n'est pas déjà créé (si existant, supprimer le depuis eclipse via la fenêtre de hiérarchie.
- Cliquez sur File > Export...
- Sélectionnez java/JAR file et cliquez sur "Next"
- Dans "Select the ressources to export", cochez le dossier de votre projet. Puis, dans "Select the export destination", nommez votre jar et donner lui une destination.
Cliquez sur "Next"
- Cliquez sur "Next"
- Dans "Select the class of the application entry point", cliquez sur "Browse..." puis sélectionner le bon fichier java ou se trouve votre main.
Cliquez sur "OK" puis "Finish"

### Lancement de hadoop
Afin de lancer le programe, exécutez la commande suivante :
`hadoop jar <VotreJar.jar> -D mapred.reduce.task=10 /input /output`

## Rendu

Adresse du dépôt : https://github.com/lucassoumaille/hbase_tp_management_solution_big_data

### Etape 1
![image](sakila_full_database_schema_diagram.png)

### Membres du groupe

- Maxime COHEN
- Lucas SOUMAILLE
- Mélissa LEAL
- Maxime MISSER
- Marine LHUILLIER