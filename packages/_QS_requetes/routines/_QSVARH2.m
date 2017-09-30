;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QSVARH2^INT^1^59547,73883^0
%QSVARH2 ;
 
 
 
 
 
 
 
 D ALORS
 F I=1:1 S CH=$T(FUN+I) Q:CH=""  D:(I#16)=0 ALORS Q:%STOP=1  S CH=$$^%QZCHW($P(CH,";;",2)) D ECR
 I %STOP=0 S %FIN=1 D ALORS
 Q
ECR 
 I CH'["#" W CH,! Q
 F TP=1:1:3 S DX=$X,DY=$Y D:TP=2 BLD^%VVIDEO X XY W $P(CH,"#",TP) S DX=$X,DY=$Y D:TP=2 NORM^%VVIDEO X XY
 W ! Q
ALORS 
 D POCLEPA^%VVIDEO I %FIN=1 D ^%VZEAVT($$^%QZCHW(" ")) Q
 W $$LL2^%SYSLIB1
 R *REP:^TOZE($I,"ATTENTE") D TOUCHE^%INCCLAV(REP,.REP) S:REP=1 %STOP=1 S DX=0,DY=6 D CLEBAS^%VVIDEO
 Q
FUN ;;
 ;;     #FONCTIONS#
 ;;
 ;;#$EXISTE#            $EXISTE(X) : l'attribut X est-il defini
 ;;                   $EXISTE(X;Y) : l'attribut X,de numero d'ordre Y est-il defini
 ;;#$APPARTIENT#        $APPARTIENT(X) : l'objet de base fait partie de la liste X
 ;;                      (X=liste d'individus / fonction ENUM)
 ;;                   $APPARTIENT(Y;X) : l'attribut Y fait partie de la liste X
 ;;                      (X=fonction ENUM)
 ;;#$DATE#              $DATE donne la date courante
 ;;                   $DATE(X) donne la date courante sous le format X
 ;;                        X=1 : forme JJ/MM/AA
 ;;                        X=2 : forme JJ MM en clair AA
 ;;                        X=3 : forme AAMMJJ
 ;;#$HEURE#             donne l'heure courante sous la forme hhHmm
 ;;#$NOM#               $NOM(X) donne le nom de l'individu representee par X
 ;;                      (X=variable temporaire)
 ;;#$ENUM#              $ENUM(X;Y;Z;...) constitue une liste de valeurs
 ;;                      (Fonction seulement utilisable avec $APPARTIENT)
 ;;#$TROUVER#           $TROUVER(X;Y) donne la position + 1 de la fin de la chaine
 ;;                      Y dans la chaine X
 ;;                   $TROUVER(X;Y;Z) donne la position + 1 de la fin de la chaine
 ;;                      Y dans la chaine X, a partir du Zeme caractere de X
 ;;#$SSCH#              $SSCH(X) extrait le 1er caractere de la chaine X
 ;;                   $SSCH(X;Y) extrait le Yeme caractere de la chaine X
 ;;                   $SSCH(X;Y;Z) extrait la chaine allant du Yeme au Zeme
 ;;                      caractere de X
 ;;#$PARTIE#            $PARTIE(X;Y) extrait la sous-chaine a la gauche de la
 ;;                      sous-chaine Y dans X
 ;;                   $PARTIE(X;Y;Z) extrait la sous-chaine entre la Z-1eme et la
 ;;                      Zeme occurence de Y dans X
 ;;                   $PARTIE(X;Y;Z;W) extrait la sous-chaine entre la Z-1eme et
 ;;                      la Weme occurence de Y dans X
 ;;#$LONGUEUR#          $LONGUEUR(X) donne la longueur de X
 ;;                   $LONGUEUR(X;Y) donne le nombre de fois + 1 ou apparait la
 ;;                      chaine Y dans la chaine X
 ;;#$JUSTIFIER#         $JUSTIFIER(X;Y) permet d'obtenir la chaine X formattee sur
 ;;                      une longueur de Y caracteres
 ;;                   $JUSTIFIER(X;Y;Z) permet d'obtenir le nombre X formatte sur
 ;;                      une longueur de Y caracteres dont Z chiffres apres la
 ;;                      virgule
 ;;#$NETTOYER#          $NETTOYER(X) permet d'obtenir la chaine ou le nombre X
 ;;                      debarasse des caracteres "blanc" au debut et a la fin
 ;;                      de sa valeur
 ;;
 ;;     #FONCTIONS SPECIALES#
 ;;
 ;;#$REPERTOIRE#       donne le repertoire courant
 ;;#$INDIVIDU#         donne l'individu courant
 ;;#$ATTRIBUT#         donne l'attribut courant
 ;;#$NOUVELLE.VALEUR#  donne la nouvelle valeur de l'attribut
 ;;#$ANCIENNE.VALEUR#  donne l' ancienne valeur de l'attribut
 ;;#$TYPE.MAJ#         donne le type de MAJ en cours
 ;;                    (AJOUT / MODIFICATION / SUPPRESSION)
 ;;#$MAJ.BASE#         indique si la MAJ de la base doit etre effectuee
 ;;                    (VRAI / FAUX)
 ;;#$UTILISATEUR#      donne le service de l'utilisateur

