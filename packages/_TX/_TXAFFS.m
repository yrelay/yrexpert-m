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

;%TXAFFS^INT^1^59547,74031^0
%TXAFFS ;;02:47 PM  4 Sep 1996
 
 
 
 
GRILLE 
 N XX,HE,JOUR
 S DX=0,DY=2 D CLEBAS^%VVIDEO
 S DY=3
 F JOUR="LUNDI    ","MARDI    ","MERCREDI ","JEUDI    ","VENDREDI ","SAMEDI   ","DIMANCHE " X XY W JOUR S DY=DY+2
 S DX=65,XX=DSEM
 F DY=3:2:15 X XY S %DN=XX D GETDAT^%TXINDH W DT S XX=XX+1
 S DX=10,DY=2 F HE=DP:1:DP+5 X XY W HE S DX=DX+8
 S DX=10
 F DY=3:2:15 X XY W "| . . . | . . . | . . . | . . . | . . . | . . ."
 Q
 
OCCUPE 
 N II,LI,COL,JJ,MSG
 S DX=2,DY=0 X XY
 S LI="" D REV^%VVIDEO
 F II=1:1 S LI=$O(^[QUI]OCCUPE(DP,DSEM,LI)) Q:LI=""  S COL="" F JJ=1:1 S COL=$O(^[QUI]OCCUPE(DP,DSEM,LI,COL)) Q:COL=""  S DY=LI,DX=COL,MSG=^[QUI]OCCUPE(DP,DSEM,LI,COL) X XY W MSG
 D NORM^%VVIDEO
 Q
 
LISRDV 
 N N,NM,NQ,NZ,CO,B,CX,CY,HP,NAM,NMIN,%NOMTAB
 S SCR="IFRDV"
 S DX=5 X XY W $$^%QZCHW("Activite")," ",DAY,?$X+2,TAD," ",$$^%QZCHW("a")," ",HRDV,!,!
 S HP=HRDV
 ;; l'heure de fin provisoirement arbitraire
 S HFRDV=10
NEXTH S NOMTAB=^%SCRE(SCR,"GLOSTOC"),NOMTAB=NOMTAB_"(%POSTE,TAD,HP)" Q:$P(HP,"H",2)>($P(HRDV,"H",2)+14)
 ;; cao debug ^%Q
 F NQ=1:1 S NOMTAB=$$^%Q($Q(@NOMTAB)) Q:NOMTAB=""  D ALORS
 S NMIN=$P(HP,"H",2)+1,HP=$E(HP,1,3)_$S($L(NMIN)>1:NMIN,1:"0"_NMIN) G NEXTH
 
ALORS D ^%QCAGLCN(NOMTAB,"CLE") S @TEMP@(CLE(1)_"|"_CLE(2)_"|"_CLE(3)_"|"_CLE(4)_"|"_CLE(5)_"|"_CLE(6)_"|"_CLE(7))="",NOMTAB="^[QUI]"_$P(NOMTAB,"^",2),%RS(CLE(1)_"|"_CLE(2)_"|"_CLE(3)_"|"_CLE(4)_"|"_CLE(5)_"|"_CLE(6)_"|"_CLE(7))=@NOMTAB
 Q

