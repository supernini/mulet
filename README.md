# Welcome to Mulet

Cette apps, est juste pour démontrer ce qui peut ce faire rapidement en utilisant Rails + TwitterBoostrap et un modèle de DB

## Comment utiliser

Récupérer le code source sur github depuis la ligne de commande

	git clone git@github.com:supernini/mulet.git

Installer les gems depuis la ligne de commande

	bundle install

Créer la base de données

	rake db:create

Créer les tables

	rake db:migrate

Installer les données de test (seulement le minumum à été fait, la aussi l'échantillon aurait du être plus large)

	rake db:seed

Démarrer le serveur

	rails s

Regcarder les resultats en allant à l'adresse

	http://localhost:3000

## Quelques limites

Il faut que des données ai été saisies à une date précise pour avoir des résultats 

	En modifiant la requète nous pourrions chercher pour la journée la plus proche au lieu de faire une recherche exacte

Si un lac n'a aucune données, il ne resortira pas dans les résulats

	Il aurait été possible de forcer la création d'une donnée par defaut dans la table lac_fish_by_dates, lors de la création du lac. Un simple after_create aurait fait la job

Il est impossible d'entrer une donnée pour une date passé ou de modifier une donnée déjà saisie car cela aurait un impact sur les données plus recentes, la masse de calcul pourrait ralentir les users qui saissisent (et si plusieurs modification pour le même lac, le calcul serait refait à chaque fois)

	Un script de recalcul pourrait etre créé sous forme de cron, il ferai le calcul de tous les champs passés qui ont été modifié (comparaison des updated_at vs created_at).


## Les tests

Aucun test n'a été construit pour cet exercises, bien entendu dans des conditions réel il aurait du impérativement être fait. 

## Schema de la DB

/doc/db.pdf


## La découverte sur le mulet du Quebec est ici

La GRANDE DECOUVERTE
- Entre avril et juillet (pendant la reproduction),
- Dès que la temperature est supérieur a 20 degré, le volume de poisson augmente de 3*log10(longitude) % par jour

Entre juillet et octobre,
- Si la temperature est entre 25 et 35, le pecheur sort plus, donc cette fois c'est une baisse de 2*log10(longitude) %

Entre novembre et decembre
- Le poisson a froid et est pas encore pret pour les grands froid, donc si la température descent en dessous de -15, donc chute de log10(longitude) %
