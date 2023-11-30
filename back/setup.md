# Commandes pour installer un framework complet a partir de skeleton

`composer create-project symfony/skeleton <monrep>`

Si on est sous apache il faut mettre en place la réecriture d'url

`composer require symfony/apache-pack`

Pour pouvoir créer nos routes avec les annotations

`composer require annotations`

Pour les Request et les Response

`composer require symfony/http-foundation`

Pour avoir accès à Twig

`composer require twig`

Et aux assets (asset())

`composer require symfony/asset`

Pour avoir la ligne profiler en bas

`composer require profiler --dev`

Pour les fonctions de dump

`composer require symfony/var-dumper --dev`

`composer require symfony/debug-bundle --dev`

# Pour installer un projet

## Avec les dépendances de dev

`composer install`

## Sans les dépendances de dev

`composer install --no-dev`

## Pour avoir accès aux makers de php bin/console

`composer require symfony/maker-bundle --dev`

`composer require profiler --dev`