# Documentation du projet
###### Par Émeric Leclerc et Jérémy Drapeau

## Le jeu
Notre jeu est un simple "Plateformer". Le but est de battre le boss se situant en haut de la carte de jeu. Il n'y a pas vraiment de récompense en gagnant la partie, à part de la fierté intérieur.

## Les éléments du jeu
- Le personnage :
Le personnage utilise les touches "A", "D" et "Space" pour, respectivement, le faire bouger de gauche à droite et le faire sauter. Il utilise la classe "CharacterBody2D" qui est disponible de base dans Godot. Cela s'occupe de gérer la physique et nous permet de modifier certaines contraintes, par exemple la hauteur maximum que le joueur peu monter une marche sans avoir à sauter ou la gestion de plateformes qui bougent.

- La carte :
La carte est composé de plusieurs éléments du type "TileMapLayer". Une TileMap est un assemblage de tuiles qui permet de facilement créer une carte en deux dimensions. Il est facile de diviser une image qui contient plusieurs éléments du jeu ("Spritesheet"), de déterminer leurs collisions et de les placés dans une grille ordonnée dans le jeu (Pour créer un niveau qui est jouable).
Notre jeu utilise plusieurs "TileMap" : Un pour l'arrière plan du niveau (Le ciel), Un pour les tuiles en arrière plan sans collision (Les murs arrières d'une caverne), Un pour les éléments du niveau avec lesquels le joueur peu intéragir et effectuer des collisions (Le sol du niveau ou des plateformes) et les tuiles en premier plan, en avant du joueur (sans collision).

- La chauve-souris :
La chauve-souris est tout simplement un ami qui nous suis au début du niveau. Elle ne fait pas grand chose à part voler à côté de notre personnage. Elle utilise un système de pathfinding de base disponible dans Godot, ce qui y permet d'aller en direction du joeur, tout en évitant de rester coincée dans les plateformes du niveau.

- L'interface :
L'interface graphique ne fait qu'afficher le nombre de vie qu'il nous reste avec des petites images de coeurs. Il utilise les éléments d'interface graphique de base de Godot, afin d'afficher par-dessus tous les autres éléments.

- Les "collectables" :
Il y a deux objets collectibles : Le bonhomme de neige et le coeur. Le coeur permet de collecter une vie de plus, afin de pouvoir survivre à plus de coups du boss ou d'autres éléments dangereux présent dans le niveau. Tandit que le bonhomme de neige ne fait rien. Il peut être collecter, mais ne rajoute aucun bonus au joueur. Il a été utilisé afin de comprendre le fonctionnement des shaders qu'utilise Godot. Un shader permet de modifier les pixels d'une texture, par exemple : leurs donners un aspect lumineux, les faires briller.

- Le boss
Le boss est composés de deux parties : La tête et le corps. Pour vaincre le boss, le joueur doit sauter sur chacunes des parties du corps du boss, avant de lui sauter sur la tête. Le corps du boss est composé de plusieurs fois la même partie, qui se suivent l'un après l'autre. Si l'on saute sur une partie qui n'est pas la dernière, toutes les autres parties en arrière de c'elle détruite se détacheront du boss. Il faudra quand même les détruires avant de tuer le boss. Lorsque le boss se fait tuer, une petite animation joue, et il disparaît ensuite.

- Les checkpoints :
Les checkpoints permettent de réapparaitre lorsque le joueur prend des dommages. Il y en a plusieurs situés dans la carte, afin de pouvoir réapparaître à certain emplacement spécifique du jeu. Lorsque le joueur n'a plus de vie, il réapparaît au début du niveau, et les checkpoints se réinitialisent pour ne pas pouvoir réapparaître où le joueur est mort.

- Le jump pad :
Le jump pad fait tout simplement appliquer une vélocité au joueur lorsqu'il entre en contact avec se dernier, afin de le faire sauter vraiment haut vers le haut.