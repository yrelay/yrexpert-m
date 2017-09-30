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

;%QSVARHP^INT^1^59547,73883^0
QSVARHP ;
 
 
 
 
 N %FIN,%STOP,CH,I,REP,TP
 D CLEPAG^%VVIDEO S DX=0 F DY=0:1:4 X XY D CAG^%VVIDEO
 S DXG=0,DXD=39,DYH=0,DYB=4 D 3^%VZCD
 S DX=5,DY=2 X XY W $$^%QZCHW("DIVERSES FONCTIONS ET ACTIONS")
 S DY=5,DX=$X-1 X XY W !
 S (%FIN,%STOP)=0
 F I=1:1 S CH=$T(FUN+I) Q:CH=""  D:(I#16)=0 ALORS^%QSVARH2 Q:%STOP=1  S CH=$$^%QZCHW($P(CH,";;",2)) D ECR^%QSVARH2
 I %STOP'=1 D ^%QSVARH2
 Q
FUN ;;
 ;;     #ACTIONS#
 ;;
 ;;#=#                  X = expression : X prend la valeur de l'expression
 ;;                      (X=attribut / variable temporaire)
 ;;#$ELIMINER#          $ELIMINER(X) : supprime l'attribut X de l'objet
 ;;#$ELIMINER.INDIVIDU# Supprime definitivement l'individu , et tous ses attributs
 ;;#$TOTALISER#         $TOTALISER(X;Y) : totalisation des valeurs de l'attribut X
 ;;                      de chacun des individus dans l'attribut Y de la liste etudiee
 ;;#$SOMME#             $SOMME(X;Y) affecte a l'attribut Y la somme des valeurs de 
 ;;                      l'attribut multivalue X
 ;;#$MOYENNE#           $MOYENNE(X;Y) : calcul de la moyenne des valeurs de
 ;;                      l'attribut X de chacun des individus dans l'attribut Y
 ;;                      de la liste etudiee
 ;;#$DMD#               $DMD(X;Y;...) demande successivement les valeurs des
 ;;                      attributs X,Y a l'utilisateur et affecte les attributs
 ;;#$DATET#             $DATET(X;Y;Z) transforme la date X de format Y en format Z
 ;;                   $DATET(X;Y;Z;XX) cree l'attribut XX qui prend comme valeur
 ;;                      la transformation de la date X de format Y en une date
 ;;                      de format Z
 ;;#$SUBSTITUER#        $SUBSTITUER(X;Y;Z) remplace dans la valeur de l'attribut X
 ;;                      l'expression Y par l'expression Z
 ;;#$CREERL#            $CREERL(X;Y;Z) cree une liste externe
 ;;                      Le nom commence par le prefixe X (3 caracteres)
 ;;                      La base de la liste est Y. Z contiendra le nom
 ;;                      de la liste (variable temporaire)
 ;;#$AJOUTERL#          $AJOUTERL(X) ajoute l'objet de base dans la liste X
 ;;                      (X=nom de la liste / variable temporaire)
 ;;                   $AJOUTERL(X;Y) ajoute l'individu fils Y dans la liste X
 ;;                      (X=nom de la liste / variable temporaire)
 ;;                      (Y = nom individu / variable temporaire)
 ;;#$RETIRERL#          $RETIREL(X) supprime l'objet de base de la liste X
 ;;                      (X=nom de la liste / variable temporaire)
 ;;                   $RETIRERL(X;Y) supprime l'individu fils Y de la liste X
 ;;                      (X=nom de la liste / variable temporaire)
 ;;                      (Y = nom individu / variable temporaire)
 ;;#$ELIMINERL#         $ELIMINERL(X) supprime la liste externe X
 ;;                      (X = nom de la liste / variable temporaire)
 ;;#$REAFFICHER#        reaffiche l'ecran
 ;;#$FEXTER#            $FEXTER(X;Y1;Y2;...) : appelle la fonction externe X avec
 ;;                      les parametres Y1,Y2,...
 ;;#$TRAITER#           $TRAITER(X) execute le traitement X pour l'objet de base
 ;;                   $TRAITER(X;Y) execute le traitement X pour l'individu fils
 ;;                      (Y=attribut)
 ;;#$MODELE#            $MODELE(X) imprime le modele X pour l'objet de base
 ;;                   $MODELE(X;Y) imprime le modele X pour l'individu fils Y
 ;;                      (Y=variable temporaire)
 ;;#$ITERER#            $ITERER(X;Y;Z;T) effectue le sous-traitement d'adresse T pour
 ;;                      chacun des individus fils (de nom X et d'indice Y dans le
 ;;                      sous-traitement). Z represente la base des individus fils
 ;;#$FIN#               indique la fin d'un traitement ou d'un sous-traitement pour
 ;;                      l'individu de base
 ;;#$ETIQUETTE#         $ETIQUETTE(X) definit l'adresse du sous-traitement X
 ;;#$ABANDON#           abandonne totalement le traitement
 ;;#$ARRET#             arrete le traitement pour l'individu de base /
 ;;                      arrete le sous-traitement pour les individus fils

