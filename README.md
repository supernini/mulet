# Welcome to Mulet

Cette apps, a été réalisé pour démontrer ce qui peut se faire rapidement en utilisant Rails + TwitterBoostrap et un modèle de DB

## Comment utiliser

Récupérer le code source sur github depuis la ligne de commande

	git clone git@github.com:supernini/mulet.git

Installer les gems depuis la ligne de commande

	bundle install

Créer la base de données

	rake db:create

Créer les tables

	rake db:migrate

Installer les données de test (seulement le minumum a été fait, là aussi l'échantillon aurait dû être plus large)

	rake db:seed

Démarrer le serveur

	rails s

Regarder les résultats en allant à l'adresse

	http://localhost:3000

## Quelques limites

##### Il faut que des données soient saisies à une date précise pour avoir des résultats 

En modifiant la requête nous pourrions chercher pour la journée la plus proche dans le passé au lieu de faire une recherche exacte

***

##### Si un lac n'a aucunes données, il ne resosrtira pas dans les résultats

Il aurait été possible de forcer la création d'une donnée par defaut dans la table lac_fish_by_dates, lors de la création du lac. Un simple after_create aurait fait la job

***

##### Il est impossible d'entrer une donnée pour une date passée ou de modifier une donnée déjà saisie, car cela aurait un impact sur les données plus récentes, la masse de calcul pourrait ralentir les users qui saisissent (et si plusieurs modifications pour le même lac, le calcul serait refait à chaque fois)

Un script de recalcul pourrait être créé sous forme de cron, il ferait le calcul de tous les champs passés qui ont été modifiés (comparaison des updated_at vs created_at).

***

##### Les utilisateurs peuvent saisir n'importe quoi sur certains champs (ex : longitude)

Presque aucune validation des modèles n'a été mise en place. Il suffirait de prendre le temps d'ajouter les validations dans les modèles. Nous pourrions ainsi validé la cohérence des longitudes, interdire les dates dans le futur ...

***

##### Comme les infos de température ne sont pas modifiable pour l'instant, le user n'est pas aidé pour valider ces choix

En utilisant un peu d'Ajax dans les formulaires, certaines validations avancé pourrait être faite. Par exemple au niveau des températures, nous pourrions faire apparaitre une alerte de confirmation si l'écart de température entre deux jours de suite était supérieur à 30 degré

***

##### Les tables innoDB

L'utilisation de la gems foreigner, impose d'utiliser une base de données relationnelles de type innoDB. Si nous souhaiterions le mettre sur un autre type (MyIsam par exemple), il suffirait de retirer la gem et modifier les migrations en conséquence


## Les tests

Aucun test automatisé n'a été effectué. Il faudrait, bien entendu réaliser une série de test unitaire, fonctionnel, intégration et performance

## Schema de la DB

/doc/db.pdf


## La découverte sur le mulet du Quebec est ici

La GRANDE DECOUVERTE (modèle choisi pour effectuer l'exercice)
- Entre avril et juillet (pendant la reproduction),
- Dès que la température est supérieure à 20 degré, le volume de poisson augmente de 3*log10(longitude) % par jour

Entre juillet et octobre,
- Si la température est entre 25 et 35, le pécheur sort plus, donc cette fois c'est une baisse de 2*log10(longitude) %

Entre novembre et décembre
- Le poisson a froid et est pas encore prêt pour les grands froids, donc si la température chute en dessous de -15, donc chute de log10(longitude) %
