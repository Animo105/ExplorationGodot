# Journal de bord
## Jérémy Drapeau
### Lundi, 3 novembre 2025
Nous avons mis en place le dépôt Github et avons choisi d'explorer les moteurs de jeu (*Game engine*).
Plus précisément, nous allons découvrir et expérimenter avec [Godot](https://godotengine.org/),
un moteur de jeu qui est libre de droit (License MIT) et gratuit d'utilisation.\n La communeauté n'est
clairement pas aussi grande que d'autres moteur de jeu plus connus (Ex Unity ou Unreal Engine).

L'IA m'a aidé à voir les différences entres les différents moteurs de jeu. Par exemple, Unreal
Engine focus beaucoup plus sur le côté graphique, avec plusieurs systèmes de lumière, LOD et autre.
Unity supporte un grand nombre de plateforme, mais est moins puissant au niveau graphique. Godot,
quant à lui, est open source, donc il est possible de modifier le moteur comme l'on le veut.

## Émeric Leclerc
### 10 novembre 2025
Avec l'IA j'ai découvert [Kenny](https://kenney.nl/), une librairie d'assets libre de droit pour faire des jeux.

### 17 novembre 2025
Je me suis mis a essayer les shaders, J'ai essayer d'en générer avec chatGPT mais il n'as jamais réussi a 
faire quelque chose qui fonctionne. J'ai réessayer avec Claude et il est bien meilleur a générer du code et a l'expliquer.
J'ai aussi découvert de nouvelle fonctionnalité avec l'aide de l'IA (ease mode des animations player)

### 20 movembre 2025
j'ai fait 3 essaie d'ennemi volant avec des ia.
**ChatGPT**
L'ennemi le plus simpliste, fesais juste aller au player selon un straight path ver lui. 
A quelque difficulter a avancer et a naviguer a travers des obstacles. Pas le meilleur mais
comparer au autre il bouge plus smoothly
**Claude**
A fait un ennemi avec un NavigationAgent et NaviguationRegion, require beaucoup plus de preparation
mais fonctionne mieux. malheureusement il n'as pas bien setup le NaviguationAgent donc ca ne fonctionne pas.
Il a essayer de faire quelque chose de complet avec des states mais ca n'as pas beaucoup marcher.
**Manus**
A aussi fait un ennemi avec un NavigationAgent et NaviguationRegion mais a bien setup le NavigationAgent.
Le script est très simple a comprendre et laisse des variables pour modifier plein de chose (plus que les 2 autres.)
