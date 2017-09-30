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
;! Module      : Caractères graphiques (CG)                                   !
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

;%CGENSEM^INT^1^59547,73867^0
CGENSEMB ;
 
 
 S ENS=Y1 D INIT
AFF D CLEPAG^%VVIDEO,CAD
L0 D HELP
L1 D ECHOFF^%VVIDEO R *BID D TOUCHE^%INCCLAV(BID,.BID),ECHON^%VVIDEO F I=1,6,18,65,67,83 G:I=BID @I
 D ^%VSQUEAK G L1
1 D POCLEPA^%VVIDEO W "Au revoir ... et a bientot !" H 2 G FIN
6 G 1
18 G AFF
65 D POCLEPA^%VVIDEO W "Nom du caractere : " S DX=$X,DY=$Y D ^%VLEC G:(CTRLA=1)!(Y1="") L0 I $D(^CAGRAPH(ENS,"LETTRES",Y1)) D POCLEPA^%VVIDEO,^%VSQUEAK W "Il existe deja" H 2 D POCLEPA^%VVIDEO G 65
 S LETTRE=Y1 D CLEAR^%CGFENET,ADD^%CGFENET,AFCARD G L0
67 D CHLETR^%CGFENET G:%LETR="" L0 D MOD^%CGFENET G L0
83 D CHLETR^%CGFENET G:%LETR="" L0 D SUP^%CGFENET,AFCARD G L0
FIN K BID,BLD,DXD,DXG,DYB,DYH,ENS,GRAPH,IX,IY,%LETR,LETTRE,LH,LV,MSG Q
INIT S:'($D(^CAGRAPH(ENS))) ^CAGRAPH(ENS,"CARD")=0
 D INIT^%CGFENET Q
CAD S DXG=0,DXD=51,DYH=0,DYB=4,GRAPH=0,MSG=ENS D 4^%VZCD
 S DXG=0,DYH=6,LH=10,LV=3,BLD=1 D CARS^%VVIDEO
 D AFCARD
 S DXG=56,DYH=0,IX=2,IY=1,LH=22,LV=21,BLD=0 D DAMIER^%VVIDEO
 S DXG=11,DYH=6,LH=41,LV=11,IX=1,IY=1,BLD=0 D DAMIER^%VVIDEO
 S DXG=11,DYH=18,LH=41,LV=3,BLD=0 D CARS^%VVIDEO
 D CLEG^%CGFENET,AFFG^%CGFENET,CLEAR^%CGFENET,AFFD^%CGFENET
 Q
HELP D POCLEPA^%VVIDEO W "(A)jouter, (C)onsulter/modifier, (S)upprimer" Q
AFCARD D REV^%VVIDEO,BLD^%VVIDEO S DX=2,DY=7 X XY W ^CAGRAPH(ENS,"CARD") D NORM^%VVIDEO Q

