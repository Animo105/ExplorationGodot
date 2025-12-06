# Syhtèse finale du projet d'exploration de nouvelle technologie
###### Par Émeric Leclerc et Jérémy Drapaeu

## C'est quoi Godot?
Godot est un moteur de jeu. Un moteur de jeu permet de gérer les éléments d'un jeu plus simplement qu'en codant tout de zéro. Godot a quelques particularitées par rapport à d'autres moteurs de jeux connus (ex : Unity, Unreal Engine) qui seront exploré dans cette section du rapport.

Tout d'abord, l'un des plus grand avantages de Godot est que le moteur de jeu est "Open source", ce qui permet à pratiquement n'importe qui d'ajouter une fonctionnalités qui pourrait être conssidérée utile. Cela permet également de modifier le code du moteur de jeu directement, sans avoir besoin de décompiler plein de choses qu ine serait normalement pas accessible. De plus, la license d'utilisation de ce moteur de jeu est la license MIT, ce qui veut dire qu'il est possible de faire pratiquement n'importe quoi avec le moteur. Il est également possible de créer un jeu sans avoir à payer pour l'exporter et pouvoir le publier sur les plateformes supportées par le moteur de jeu (Des frais peuvent être appliqués lors de la publication sur des sites comme Steam ou l'Epic Games Store).

Également, Godot permet de compiler un jeu ou une application pour plusieurs plateformes : IOS, MacOS, Android, Windows, Linux, Xbox, Playstation, XR et VR (Meta Quest (Android) / SteamVR). Cela est utile afin de simplifier le développement de jeu pour plusieurs plateformes, n'ayant pas à changer pleins d'éléments pour adapter un jeu pour d'autre plateforme que c'elle qui était visée pendant le développement.

## Le nouveau par rapport au autres technologies utilisées
Ce qui est nouveau par rapport aux autres façons dont nous avons créé des jeux, est l'interface graphique du moteur. Il est plus simple de créer des jeux rapidement avec Godot versus d'en faire un avec SFML. Oui, il faut un petit temps d'adaptation, mais lorsque nous maîtrison un peu plus les bases du moteur, il est grandement plus simple de créer un jeu plus rapidement. La façon d'on Godot nous permet de construire notre jeu est avec des noeuds qui représente des objets. Chaque noeud peu représenter un élément différent. C'est un moyen d'être 100% orienté objet, ce qui facilite l'interaction avec tout les éléments du jeu.

Il est possible d'ajouter des charactéristique à un noeud en lui attachant un script. Les scripts peuvent être en code C# ou GDScript. GDScript est un langage créer spécifiquement par la communeautée Godot, afin de faciliter l'apprentissage du moteur de jeu en donnant un langage facile et puissant. Le GDScript ressemble un peu à Python, dans le sense qu'il est faiblement typé, qu'il y a moyen d'accéder à a peu près n'importe quel éléments à partir de n'importe où et en ayant une structure qui est assez aisé (ex : Pas besoin de mettre de parenthèse lorsqu'on fait un IF mais foncitonne parreil si on en met).

De plus, Godot permet de faire de la 3D. Même si nous n'y avons pas vraiment touché lors de la création de notre projet, nous avons constaté qu'il est possible de créer des jeux en trois dimensions. Il est possible d'importer facilement des modèles 3D, ce qui n'était pas faisable avec SFML.

L'affichage des HUD est aussi simplifier, avec une structure qui rappel un peu le CSS en web (Des structure en grid ou en flex), mais sans vraiment avoir besoin de coder. Il est possible de les placer manuellement à la position désiré dans l'écran et de lui donner les charactéristiques du genre qu'il est aligné au milieu, à droite ou à gauche. Cela est grandement plus simple, car il est moins convivial d'adapter les éléments du HUD avec SFML, qui risque d'arrêter de fonctionner si l'écran n'est pas de la même grandeur.

## L'apport de l'intelligence artificielle
L'intelligence artificielle était quand même d'une bonne utilité pour se projet. Il est possible de l'utiliser pour nous conseiller sur la structure d'un élément en particulié. Par exemple, nous n'avions pas vraiment d'idée sur comment construire le personnage que le joueur contrôle dans notre jeu. L'intelligence artificielle nous a indiqué qu'il existe un noeud "CharacterBody2D", qui est utile pour gérer les collisions normales d'un joueur.

Bien que l'IA sois utile pour facilité certaine tâche, coder n'est pas une de ses forces. Il y a eu plusieurs moment ou ChatGPT et les IA en général on aider pour les petites chose. Comme example lors des petits Shaders comme le shader de shine ou de outline, ou pour générer des petits script ou méthode comme le script pour le jump pad. Il est aussi bon pour expliquer des conceptes et trouver des fonction mathématique. Par contre, dès qu'on veux quelque chose d'un peux plus complexe, la majorité des IA ne fait pas une bonne job. La première fois, au tout début lors qu'on a voulu généré les assets (sprites) mais les images n'étais pas consistent, pas seamless, donc on a opter pour autre chose. Pareil pour des plus gros scripts, ChatGPT n'as pas réussi a me généré quelque chose qui fonctionne (et plus je demandais de réglé le code plus il hallucinais des methodes). Les Autres IA (Claude et Manus) ont fait mieux mais ca m'as pris un moment à avoir quelque chose de bien fonctionnel (et j'ai du changer certain truc à la main). Et pour généré des sons tout les IA que j'ai essayer étais extrêment limité, bien que je m'y attendais un peu lorsque j'ai essayer.
En résumé, je ne pense pas qu'utiliser totalement l'IA pour coder est une bonne chose. Ça vas généralement moins bien fonctionner ou être totalement bugger qu'autre chose. Parcontre comme outils de recherche ou comme outils pour généré des petits bout de code peux être une bonne chose quand on sais comment bien demander quoi générer.

## Nos opinions sur Godot
### Émeric Leclerc :



### Jérémy Drapeau :
D'après moi, Je pense que le moteur de jeu Godot à une très bonne place dans le développement de jeu indépendant. Il est beaucoup plus simple d'utilisation que les autres moyens de développement utilisé jusqu'à se jour à l'école pour créer des jeux.

N'ayant pas vraiment utilisé d'autres moteurs de jeu, je ne peu pas vraiment décrire si je pense que Godot est meilleur que les autres. Je crois tout de même que l'aspect "Open source", gratuit d'utilisation et de publication est un des points forts, étant données que d'autres moteurs de jeux (Unity, UE, etc...) veulent une part du profit que le jeu fait. Cela pourrait être intéressant pour les petites équipes de développement, qui n'ont peut-être pas les moyens ou le désir de partager leurs profits avec de grande compagnie.

Le moteur de jeu possède asser de documentation pour être capable de faire quand même pas mal de chose. Il est complet, supporte plusieurs types de jeux : 2D, 3D, réalité virtuelle et réalité augmentée, en plus d'être capable de compiler les jeux pour qu'ils puissent être joués sur console, ordinateur, téléphone et plein d'autres!

Bref, c'est un très bon outil de développement. La communeautée y est dédié et il est possible de faire tellement de choses que c'est un moteur de jeu à considérer lors du développement d'un jeu.