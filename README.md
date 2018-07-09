![yrexpert_logo.png](./images/yrexpert_logo.png)

# yrexpert-m

[![npm downloads][downloads-image]][downloads-url]

yrexpert-m est le dépôt des fichiers M (GTM) pour le système expert *yrexpert* de [Yrelay](http://www.yrelay.fr). Vous pourrez mettre en oeuvre ces fichiers en mettant à jour **YXP** dans le paquet [**yrexpert-terminal**](https://github.com/yrelay/yrexpert-terminal).

* **Page d'accueil :** [github.com/yrelay/yrexpert-m](https://github.com/yrelay/yrexpert-m)
* **Documentation :** [yrelay.github.io/yrexpert-m](https://yrelay.github.io/yrexpert-m)

## 1. Contenu des dernières versions

[**yrexpert-m**](https://github.com/yrelay/yrexpert-m) est désolidarisé de [**yrexpert-terminal**](https://github.com/yrelay/yrexpert-terminal) pour en faciliter le maintien. Les dernières versions apportent les améliorations suivantes :

* **4.0.6** Première version disponible.


## 2. Menus de yrexpert

Présentation des concepts et des termes qui sont utilises dans les applications et l'approche méthodologique **yrexpert**. On distingue cinq grands thèmes: les DONNÉES, les CONNAISSANCES, l’ACTIVATION, l‘INTERACTION et les ECHANGES.

	MENU GENERAL : ^%VACTIME
	1 base de donnees et de connaissances dkbms : ^%QSMINI
	  1.1 consultation associative
	  1.2 vocabulaire
	  1.3 donnees : ^%QSMDONN -> ^%QSGBASE : GESTION MANUELLE DES INDIVIDUS
	  1.4 liens & nomenclatures
	  1.5 listes & representations
	  1.6 requetes
	  1.7 connaissances : ^%QSMCONN
	    1.7.1 traitements : LEC1^%VQUIKM2??? -> ^%TLMENUG : TRAITEMENTS sur LISTES
	    1.7.2 mise au point :  -> ^%TLBAGES
	    1.7.3 cas d'emploi :  -> ^%TLKEMEN
	    1.7.4 savoir-comparer :  -> ^%SCOMN
	    1.7.5 abaques :  -> ^%AB1MENF
	    1.7.6 saisies interactives :  -> ^%QMEA
	    1.7.7 etudes totem :  -> ^%QSMTOT
	    1.7.8 gps :  -> ^%PSDKBDR
	  1.8 administration et exploitation de dkbms
	2 gestion documentaire gdx
	3 evaluateur interactif hevea
	4 totem
	  T O T E M : ^TOMENU
	  4.1 apprentissage du savoir-faire
	    APPRENTISSAGE du SAVOIR-FAIRE : ^TODRIMPG
	    4.1.1 parametres du savoir-faire
	      PARAMETRES du SAVOIR-FAIRE : ^TO1MENU1
	      4.1.1.1 parametres explicites
		PARAMETRES EXPLICITES : ^TO1MENUW
		4.1.1.1.1 ajout de parametres explicites
		4.1.1.1.2 cons/mod/sup de parametres explicites
		4.1.1.1.3 ajout de listes d'attributs a importer depuis dkbms
		4.1.1.1.4 cons/mod/sup de listes d'attributs a importer depuis dkbms
		4.1.1.1.5 edition de parametres explicites
	      4.1.1.2 parametres implicites
		PARAMETRES IMPLICITES : ^TO1MENUA
		4.1.1.2.1 ajout de parametres implicites
		4.1.1.2.2 cons/mod/sup de parametres implicites
		4.1.1.2.3 parametres deja crees par article(1)
	      4.1.1.3 parametres deja crees(1)
	      4.1.1.4 abaques(2)
	    4.1.2 abaques(2)
	      ABAQUES : ^%AB1MENF
		4.1.2.1 creation/modification de la structure d'abaques
		4.1.2.2 saisie/consultation des regles dans les abaques
		4.1.2.3 suppression contenu seulement
		4.1.2.4 suppression contenu et structure
		4.1.2.5 comprehension
		4.1.2.6 consultation rapide
		4.1.2.7 impression
		4.1.2.8 resultats comprehension
		4.1.2.9 consultation uniquement
	    4.1.3 composants
	      COMPOSANTS : ^TO1MENU2
	      4.1.3.1 ajout  d'un composant
	      4.1.3.2 cons/mod/sup d'un composant
	      4.1.3.3 edition de l'arborescence des composants
	    4.1.4 phases et derivees
	      PHASES et derivees : ^TO1MENU3
	      4.1.4.1 acces aux phases
		PHASES : ^TO1MENUN
		4.1.4.1.1 ajout de phases
		4.1.4.1.2 cons/mod/sup de phases
		4.1.4.1.3 renumerotation des phases
		4.1.4.1.4 vue globale des phases
	      4.1.4.2 acces aux temps et couts
		TEMPS ET COUTS : ^TO1MENUO
		4.1.4.2.1 ajout d'evaluations de temps-couts
		4.1.4.2.2 cons/mod/sup d'evaluations de temps-couts
		4.1.4.2.3 generation de temps-couts
	      4.1.4.3 acces aux consignes
		CONSIGNES : ^TO1MENUP
		4.1.4.3.1 ajout de consignes-outillages
		4.1.4.3.2 cons/modif/suppres de consignes-outillages
		4.1.4.3.3 generation des fiches consignes-outillages
	      4.1.4.4 acces aux dimensions a l'outil
		DIMENSIONS A L'OUTIL : ^TO1MENUR
		4.1.4.4.1 ajout de dimensions
		4.1.4.4.2 cons/modif/suppres de dimension
	    4.1.5 machines
	      SAVOIR USINER : ^TO1MENUB
	      4.1.5.1 usinages possibles sur un article
	    4.1.6 matieres
	      SAVOIR-FAIRE sur les MATIERES : ^TO1MENU4
	      4.1.6.1 familles de matieres
		FAMILLES de MATIERES : ^TO1MNMA1
		4.1.6.1.1 ajout de matieres
		4.1.6.1.2 cons/mod/sup de matieres
	      4.1.6.2 description des matieres en stock
		Description des MATIERES en STOCK : ^TO1MENU8
		4.1.6.2.1 ajout de matieres en stock
		4.1.6.2.2 cons/mod/sup de matieres en stock
		4.1.6.2.3 edition des matieres
	      4.1.6.3 parametres implicites sur les matieres
		IMPLICITES MATIERES : ^TO1MENU9
		4.1.6.3.1 ajout d'un parametre implicite matiere
		4.1.6.3.2 cons/modi/sup de parametres implicite matieres
		4.1.6.3.3 comprehension des implicites matieres
	      4.1.6.4 regles de selection des matieres
		SELECTION des MATIERES : ^TO1MENU7
		4.1.6.4.1 ajout d'une selection de matiere
		4.1.6.4.2 cons/mod/sup de selections de matiere
	      4.1.6.5 nombre maximum d'etudes matieres
		NOMBRE MAX D'ETUDES MATIERES : ^TO1MNMA2
		4.1.6.5.1 ajout nombre maximum d'etudes matieres
		4.1.6.5.2 cons/mod/sup nombre maximum d'etudes matieres
	    4.1.7 edition sur savoir-faire
	      EDITION du SAVOIR-FAIRE : ^TO1MENUH
		4.1.7.1 edition selective
		4.1.7.2 edition totale
		4.1.7.3 edition resumee
	    4.1.8 lexique
	      LEXIQUE : ^%LXMN
		4.1.8.1 ajout
		4.1.8.2 consultation, modification, suppression
		4.1.8.3 acces aux mots reserves systeme
		  MOTS RESERVES SYSTEME : ^%LXMORM
		  4.1.8.3.1 consultation par mot
		  4.1.8.3.2 consultation par application
		  4.1.8.3.3 edition
		4.1.8.4 acces aux mots reserves utilisateur
		  MOTS RESERVES UTILISATEUR : ^%LXMORU
		  4.1.8.4.1 consultation par mot
		  4.1.8.4.2 consultation par application
		  4.1.8.4.3 edition
		4.1.8.5 consultation breve
		4.1.8.6 vue globale
		4.1.8.7 edition du lexique
		4.1.8.8 validation et qualite du lexique
	    4.1.9 manipulations generales sur le savoir-faire
	      MANIPULATIONS GENERALES SUR LE S-F : ^TO1MENU5
	      4.1.9.1 duplication d'un savoir-faire
	      4.1.9.2 liste d'objets et suppression du savoir-faire
	      4.1.9.3 table des constantes du savoir-faire
		Table des CONSTANTES du SAVOIR-FAIRE : ^TO1MENU6
		4.1.9.3.1 ajout de constantes
		4.1.9.3.2 cons/modif/suppres de constantes
	      4.1.9.4 cas d'emploi de parametres
	      4.1.9.5 rapprochement vis a vis du lexique
		RAPPROCH. VIS A VIS DU LEXIQUE : ^TO1MNSF2
		4.1.9.3.1 constitution du rapprochement
		4.1.9.3.2 edition du rapprochement
	      4.1.9.6 fonctions numeriques & alpanumeriques connues par totem
	      4.1.9.7 transfert du sf vers un autre utilisateur
	  4.2 comprehension du savoir-faire
	      COMPREHENSION DU SAVOIR-FAIRE : ^%LNKMN2 -> mot de passe = "METOT"
	      4.2.1 comprehension partielle
	      4.2.2 resultats brefs
	      4.2.3 interpretation fiche par fiche
	      4.2.4 interpretation globale
	      4.2.5 appel des blocs implicites
	      4.2.6 representation graphique du sf
	      4.2.7 legende des arbres de sf
	  4.3 mise en application du savoir-faire
	  4.4 raisonnement suivi
	      Explications des resultats de l'etude
	      4.4.1 edition des resultats d'etude
	      4.4.2 edition du raisonnement
	  4.5 suppression d'etudes
	      SUPPRESSION DE MISES EN APPLICATION
	      4.5.1 suppression par article
	      4.5.2 suppression par no d'etude
	      4.5.3 suppression par date
	  4.6 validation du savoir-faire -> mot de passe = "DMO"
	  4.7 divers
	      DIVERS : ^TO1MENUM
	      4.7.1 archivage de savoir-faire
	      4.7.2 restauration de savoir-faire
	      4.7.3 savoir usiner
	      4.7.4 ajout de meta-regles
	      4.7.5 cons/mod/sup de meta-regles
	      4.7.6 ajout de valeurs legales et parametres associes
	      4.7.7 cons/modif/supp de valeurs legales et para. associes
	      4.7.8 parametres a ignorer
		    PARAMETRES A IGNORER
		    4.7.8.1 ajout de parametres a ignorer
		    4.7.8.2 cons/modif/suppres de parametres a ignorer
	5 configurateur link
	6 mozart
	7 eqx
	8 divers
	9 exploitation generale

## 3. Fonctionnement

**yrexpert-m** ne fonctionne pas seul, vous devez utiliser **yrexpert-terminal** et mettre à jour la partition *YXP*. La documentation se trouve sur les dépôts suivants :
* [**L'arborescence source yrexpert-terminal**](https://github.com/yrelay/yrexpert-terminal.git) de *Yrelay* contient *yrexpert* en mode terminal.
* [**L'arborescence source yrexpert-man**](https://github.com/yrelay/yrexpert-man.git) de *Yrelay* contient les manuels de *yrexpert*.

## 4. Installation

### 4.1. Installer yrexpert-m

Installer [yrexpert-m](https://github.com/yrelay/yrexpert-m.git), vérifier qu'il fonctionne.

### 4.2. Cloner le code source yrexpert-m depuis le dépôt

Si vous souhaiter garder votre ancienne partition **YXP**, vous devez la renommer.

	sudo mv /opt/yrelay/yrexpert-terminal/globals /opt/yrelay/yrexpert-terminal/globals$(date +%Y%m%d%H%m%s)
	sudo mv /opt/yrelay/yrexpert-terminal/routines /opt/yrelay/yrexpert-terminal/routines$(date +%Y%m%d%H%m%s)

Nous créons une entrée unique pour toutes les références Yrelay. Il s'agit de votre emplacement d'installation pour **yrexpert-m**.

	$ sudo mkdir ~/Yrelay
	$ cd ~/Yrelay
	$ git clone https://github.com/yrelay/yrexpert-m.git
	$ sudo rm -rf /opt/yrelay/yrexpert-terminal/globals # ATTENTION votre ancienne base de données de YXP sera supprimée.
	$ sudo rm -rf /opt/yrelay/yrexpert-terminal/routines # ATTENTION vos anciens fichier M de YXP seront supprimés.
	$ sudo cp -r /yrelay/yrexpert-m/packages/divers/globals /opt/yrelay/yrexpert-terminal/globals
	$ sudo cp -r /yrelay/yrexpert-m/packages/divers/routines /opt/yrelay/yrexpert-terminal/routines

### 4.3. Créer la base de données de YXP

Créer la base de données de YXP à partir du fichier plat *yxp.zwr*.

	$ /opt/yrelay/yrexpert-terminal/scripts/CreerGlobalsYXP.sh

Réponse :

	{--- Début du script **CreerGlobalsYXP.sh**
	yxp_dist=/opt/yrelay/yrexpert-terminal
	{--- Début du script **env.conf**
	gtm_dist=/opt/fisglobal/gtm
	---} Fin du script **env.conf**

	Créer la base de données. Ceci peut prendre un moment...

	/opt/yrelay/yrexpert-terminal
	/opt/fisglobal/gtm
	/opt/yrelay/yrexpert-terminal/globals/YXP.gld


	%GDE-I-GDUSEDEFS, Using defaults for Global Directory 
		/opt/yrelay/yrexpert-terminal/globals/YXP.gld

	GDE> 
	GDE> 
	GDE> 
	GDE> 
	%GDE-I-VERIFY, Verification OK

	%GDE-I-GDCREATE, Creating Global Directory file 
		/opt/yrelay/yrexpert-terminal/globals/YXP.gld
	Created file /opt/yrelay/yrexpert-terminal/globals/YXP.dat
	GT.M MUPIP EXTRACT
	21-JAN-2013  20:38:49 ZWR
	Beginning LOAD at record number: 3

	LOAD TOTAL		Key Cnt: 701034  Max Subsc Len: 185  Max Data Len: 510
	Last LOAD record number: 701036

	---} Fin du script **CreerGlobalsYXP.sh**

### 6. Lancer yrexpert-terminal

Lancer le fichier *yrexpert* :

	/opt/yrelay/yrexpert-terminal/scripts/yrexpert

Suivre les instructions à l'écran.

### 6. Tester yrexpert-terminal

Pour tester cette démonstration suivre la [documentation](https://github.com/yrelay/yrexpert-dmo/blob/master/documents/TesterParttitionDMO.md).

## 7. Comment contribuer ?

1. Duppliqer le dépôt (utiliser *Fork*)
2. Créer un nouvelle branche (`git checkout -b ma-branche`)
3. Commit(er) votre proposition d'évolution (`git commit -am 'Ajouter mon évolution'`)
4. Push(er) la branche (`git push origin ma-branche`)
5. Créer une demande d'évolution (utiliser *Pull Requests*)

## 9. Liens

* Yrelay Page d'accueil : https://www.yrelay.fr
* Yrelay Référentiels : https://code.yrelay.fr
* Yrelay Github : https://github.com/Yrelay


[downloads-image]: https://img.shields.io/npm/dm/yrexpert-m.svg
[downloads-url]: https://npmjs.org/package/yrexpert-m
