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

;%MZTRANS^INT^1^59547,73872^0
MOZTRANS ;
 
 S %PGTR="^%MZTRANG"
 K ^AFFGAM($J),^AFFPAG($J),^AFFREP($J) D CLEPAG^%VVIDEO,^%VZCD0("Repertoire des gammes")
LECSUP S DX=0,DY=12 D CLEBAS^%VVIDEO W $$^%QZCHW("Recuperation de gammes de")," : " S DX=$X D ^%VLEC G FIN:Y1="",LECSUP:Y1=WHOIS,LECSUP:'($D(^TABIDENT(Y1,"MACHINE"))) S ORIG=^TABIDENT(Y1,"MACHINE")
 D ENT(ORIG) Q:'($D(^GAMAREC($J)))  D TRANS(ORIG,QUI) Q
TRANS(QUI,VIS) 
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("Recuperation en cours...")) S PG="" F %U=1:1 S PG=$O(^GAMAREC($J,PG)) Q:PG=""  S PY="" F %U=1:1 S PY=$O(^GAMAREC($J,PG,PY)) Q:PY=""  S GC=^GAMAREC($J,PG,PY) D GO
 Q
GO N MOZG K ^TAMPON($J)
 D POCLEPA^%VVIDEO W GC G:'($D(^[QUI]MOZGARDE(GC))) REF
 S MOZG=^[QUI]MOZGARDE(GC)
 D ADR^%QCAGLC("^[QUI]MOZART("""_GC_"""","^TAMPON($J")
 D ALL^%QSGEST4($$GI^%MZQS,GC,GC,VIS)
 S ^[VIS]MOZGARDE(GC)=MOZG
 D ADR^%QCAGLC("^TAMPON("_$J,"^[VIS]MOZART(GC")
 W "  ",$$^%QZCHW("OK")," !" G GOF
REF D ^%VSQUEAK W "   ",$$^%QZCHW("Recuperation avortee")," !"
GOF Q
ENT(QUI) 
 S DX=0,DY=8 D CLEBAS^%VVIDEO W "Liste a partir de : " S DX=$X D ^%VLEC G FIN:CTRLA,FIN:CTRLF S NUINT=$S(Y1="":"",1:$ZP(^[QUI]MOZGARDE(Y1)))
 S:'($D(%PGTR)) %PGTR="" S LILIM=21,IMPR=0
 S DX=0,DY=6 D CLEBAS^%VVIDEO W ?2,"No de gamme",?23,"Materiel",?55,"Designation" S GLZ=0,ZLG=100,EGAP=0 F IZ=1:1 S NUINT=$O(^[QUI]MOZGARDE(NUINT)) Q:NUINT=""  D:NUINT'="z" TRAIT Q:ARRET=1
 W *-1 D E
FIN K ^AFFPAG($J),^AFFREP($J),%PGTR,ATEST,Y1,SUP,IMPR,LILIM,NUGA,INT,IZ,%CH,%LGR,ZLG,EGAP,TIT Q
TRAIT S NUGA=NUINT D TR Q
TR S %CH=NUGA,MAT=^[QUI]MOZGARDE(NUGA),DES=$P(MAT,"^",10),MAT=$P(MAT,"^",9)
 S %CH=%CH_$J("",20-$L(%CH))_$E(MAT,1,30)_$J("",30-$L(MAT))_$E(DES,1,25)
 
 S GLZ=GLZ+1,ZLG=ZLG+1 I ZLG>LILIM S GLZ=1,ZLG=8,EGAP=EGAP+1,^AFFREP($J,EGAP)=%CH,DX=0,DY=7 D CLEBAS^%VVIDEO,POCLEPA^%VVIDEO W "(CTRLA) pour finir ",?60,"Page : ",EGAP S DX=0,DY=7 X XY
 S ^AFFPAG($J,EGAP,ZLG)=%CH,^AFFGAM($J,EGAP,ZLG)=NUGA
 I (GLZ#15)=0 S GLZ=1,DX=0,DY=7 D CLEBAS^%VVIDEO,POCLEPA^%VVIDEO W "(CTRLA) pour finir ",?60,"Page : ",EGAP S DX=0,DY=7 X XY
 W !,%CH R *ARRET:0 D TOUCHE^%INCCLAV(ARRET,.ARRET) G FTR
FTR Q
E S TIT="No de gammes"_$J("",10)_"Materiels"_$J("",20)_"Designations"
 D ^%MZAFLGA
 Q

