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

;%MZLISGB^INT^1^59547,73872^0
%MZLISGB ;
 
 
 
 
 
 
 
 D CURRENT^%IS S V80=0,GAMCOUR=""
 
 K ^AFFGAM($J),^AFFPAG($J),^AFFREP($J)
 D CLEPAG^%VVIDEO,CARSP^%VVIDEO(15,0,3,25,1) S DX=17,DY=1 D REV^%VVIDEO X XY W $$^%QZCHW("REPERTOIRE DES GAMMES") D NORM^%VVIDEO
ENTREE S DX=2,DY=23 X XY W $$^%QZCHW("Liste a partir de : ") S DX=$X D ^%VLEC G FIN:CTRLA,FIN:CTRLF
 S NUINT=$S(Y1="":"",1:$$PRVRI^%QSTRUC8($$GI^%MZQS,Y1))
ATTR D CLFEN^%VVIDEO(0,23,0,79) S DX=2,DY=23 X XY W $$^%QZCHW("Attribut a afficher : ") S DX=$X D ^%VLEC G FIN:CTRLA,FIN:CTRLF
 I Y1'="",'($$AR^%QSGEST5($$GI^%MZQS,Y1)) D ^%VZEAVT($$^%QZCHW("Attribut inconnu pour le repertoire")_" "_$$NOMLOG^%QSF($$GI^%MZQS)) G ATTR
 S ATT=Y1,LILIM=21,IMPR=0
 S DX=10,DY=6 X XY W $$^%QZCHW("No de gamme") S DX=35 X XY W ATT
 S GLZ=0,ZLG=100,EGAP=0
 F IZ=1:1 S NUINT=$$NXTRI^%QSTRUC8($$GI^%MZQS,NUINT) Q:NUINT=""  D:NUINT'="z" TRAIT Q:ARRET=1
 W *-1 D E
FIN I V80 S ^MOZETAT($J,"NBCOL")=80 D 80^%VVIDEO
 S RM=80 K ^AFFGAM($J),^AFFPAG($J),^AFFREP($J),ARRET,ATT,EGAP,GAMCOUR,GLZ,IMPR,IZ,LILIM,NUGA,NUINT,TIT,V80,VALATT,Y1,ZLG,%CH Q
TRAIT S NUGA=NUINT D TR Q
TR S VALATT=$$^%QSCALVA($$GI^%MZQS,NUGA,ATT),%CH=NUGA,%CH=NUGA_$J("",25-$L(%CH))_VALATT
 S GLZ=GLZ+1,ZLG=ZLG+1 I ZLG>LILIM S GLZ=1,ZLG=8,EGAP=EGAP+1,^AFFREP($J,EGAP)=%CH D CLFEN^%VVIDEO(0,7,17,79),L7^%QSLIB W ?50,"Page : ",EGAP
 S ^AFFPAG($J,EGAP,ZLG)=%CH,^AFFGAM($J,EGAP,ZLG,2)=NUGA
 I (GLZ#15)=0 S GLZ=1 D CLFEN^%VVIDEO(0,7,17,79),L7^%QSLIB W ?50,"Page : ",EGAP
 S DX=2,DY=ZLG X XY W %CH R *ARRET:0 D TOUCHE^%INCCLAV(ARRET,.ARRET) G FTR
FTR Q
E S TIT="No de gammes"_$J("",10)_ATT
 D ^%MZAFLGB S GC=GAMCOUR
 Q

