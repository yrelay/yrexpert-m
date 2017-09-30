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

;%QSUTIL^INT^1^59547,73883^0
ZUTIL ;
 
 G YY
LISTE ;;
 ;;***LECTURE DE VALEURS AUX REPERTOIRES
 ;;QSCALVA calcule la valeur d'un attribut (adresse MV pour multivalue)
 ;;QSCALIN valeur d'un multivalue (# d'ordre connu)
 ;;QSCALV lecture a 1 lien de distance (relat) ou n liens(pere) ou heritage
 ;;***ACTIONS SUR LES REPERTOIRES
 ;;QSGESTI primitives les + classiques
 ;;QSGE* primitives diverses de manipulation des donnees
 ;;***TESTS VIS A VIS DES DONNEES DES REPERTOIRES
 ;;QSGEST5 existence repertoire[,individu[,attribut[,valeur]]] (suite: QSGE5)
 ;;QSREPAR retablit l'integrite des 4 querys a partir de l'un d'eux
 ;;***MODELES DE DONNEES
 ;;QSMODEL installe et teste modele installe
 ;;QSMODRI driver de la gestion des modeles
 ;;UTMODINS modele installe pour chaque utilisateur defini dans tabident
 ;;***MACROS
 ;;QSINTER activation par soft des requetes
 ;;TLINTER     "           "       traitements sur les listes
 ;;QSCOPY copie inter repertoire d'un "macro-individu"
 ;;
 
AFF S A=0 I $E(CO,1,3)="***" W ! D ^%VZCDB($E(CO,4,999),$Y) Q
 I $E(CO)="." S CO=$E(CO,2,999),A=1
 D BLD^%VVIDEO D:A BLK^%VVIDEO,REV^%VVIDEO W !,$P(CO," ",1) D NORM^%VVIDEO W ?15,$P(CO," ",2,99)
 Q
YY N LISTE,NO,L1,L2,C,A,BLD,CO,DX,DY,I,REP,X1,Y1,%TABTRA
 D CLEPAG^%VVIDEO S BLD=1 D ^%VZCDB("U T I L I T A I R E S",0),SMTHSCRL^%VVIDEO S BLD=0
 N LISTE,NO,L1,L2,C S NO=1 F I=1:1 S CO=$P($T(LISTE+I),";;",2) Q:CO=""  I $E(CO,1,3)="***" S LISTE(NO)=$E(CO,4,999)_"|"_I,NO=NO+1
LEC S DX=0,DY=1 X XY D CLEBAS^%VVIDEO F NO=1:1 Q:'($D(LISTE(NO)))  W !,NO,?4,$P(LISTE(NO),"|",1)
 W !,! S NO=$$^%VZAME1("Votre choix : ") G FIN:NO="" I '($D(LISTE(NO))) D ^%VSQUEAK G LEC
 W ! S L1=$P(LISTE(NO),"|",2),CO=$P($T(LISTE+L1),";;",2) D AFF F I=L1+1:1 S CO=$P($T(LISTE+I),";;",2) Q:CO=""  Q:$E(CO,1,3)="***"  D AFF
 W !,!,"[RETURN]" R *REP
 G YY
FIN D JMPSCRL^%VVIDEO Q

