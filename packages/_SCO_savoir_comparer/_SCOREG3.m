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

;%SCOREG3^INT^1^59547,73888^0
SCOREG3 ;
 
 
 
 
PLUS 
 S VAL2=$O(@GLO@(DES(1),"NON.EGALITE",DES(2),DES(3),DES(4),DES(5)))
 I VAL2'="" S DES(5)=VAL2 D REAFF G DIAL2^%SCOREG
 S VAL1=$O(@GLO@(DES(1),"NON.EGALITE",DES(2),DES(3),DES(4)))
 I VAL1'="" S DES(4)=VAL1,DES(5)=$O(@GLO@(DES(1),"NON.EGALITE",DES(2),DES(3),DES(4),"")) D REAFF G DIAL2^%SCOREG
 S IN=$O(@GLO@(DES(1),"NON.EGALITE",DES(2),DES(3)))
 I IN'="" S DES(3)=IN,DES(4)=$O(@GLO@(DES(1),"NON.EGALITE",DES(2),DES(3),"")),DES(5)=$O(@GLO@(DES(1),"NON.EGALITE",DES(2),DES(3),DES(4),"")) D REAFF G DIAL2^%SCOREG
 S AT=$O(@GLO@(DES(1),"NON.EGALITE",DES(2)))
 I AT'="" S DES(2)=AT,DES(3)=$O(@GLO@(DES(1),"NON.EGALITE",DES(2),"")),DES(4)=$O(@GLO@(DES(1),"NON.EGALITE",DES(2),DES(3),"")),DES(5)=$O(@GLO@(DES(1),"NON.EGALITE",DES(2),DES(3),DES(4),"")) D REAFF G DIAL2^%SCOREG
 S DO=$O(@GLO@(DES(1)))
 I DO="" G RETOUR
 S SDES(1)=DO
 S SDES(2)=$O(@GLO@(SDES(1),"NON.EGALITE",""))
 I SDES(2)="" G RETOUR
 S SDES(3)=$O(@GLO@(SDES(1),"NON.EGALITE",SDES(2),""))
 I SDES(3)="" G RETOUR
 S SDES(4)=$O(@GLO@(SDES(1),"NON.EGALITE",SDES(2),SDES(3),""))
 I SDES(4)="" G RETOUR
 S SDES(5)=$O(@GLO@(SDES(1),"NON.EGALITE",SDES(2),SDES(3),SDES(4),""))
 I SDES(5)="" G RETOUR
 F I=1:1:5 S DES(I)=SDES(I)
 K SDES
 D REAFF
 G DIAL2^%SCOREG
MOINS 
 S VAL2=$ZP(@GLO@(DES(1),"NON.EGALITE",DES(2),DES(3),DES(4),DES(5)))
 I VAL2'="" S DES(5)=VAL2 D REAFF G DIAL2^%SCOREG
 S VAL1=$ZP(@GLO@(DES(1),"NON.EGALITE",DES(2),DES(3),DES(4)))
 I VAL1'="" S DES(4)=VAL1,DES(5)=$ZP(@GLO@(DES(1),"NON.EGALITE",DES(2),DES(3),DES(4),"")) D REAFF G DIAL2^%SCOREG
 S IN=$ZP(@GLO@(DES(1),"NON.EGALITE",DES(2),DES(3)))
 I IN'="" S DES(3)=IN,DES(4)=$ZP(@GLO@(DES(1),"NON.EGALITE",DES(2),DES(3),"")),DES(5)=$ZP(@GLO@(DES(1),"NON.EGALITE",DES(2),DES(3),DES(4),"")) D REAFF G DIAL2^%SCOREG
 S AT=$ZP(@GLO@(DES(1),"NON.EGALITE",DES(2)))
 I AT'="" S DES(2)=AT,DES(3)=$ZP(@GLO@(DES(1),"NON.EGALITE",DES(2),"")),DES(4)=$ZP(@GLO@(DES(1),"NON.EGALITE",DES(2),DES(3),"")),DES(5)=$ZP(@GLO@(DES(1),"NON.EGALITE",DES(2),DES(3),DES(4),"")) D REAFF G DIAL2^%SCOREG
 S DO=$ZP(@GLO@(DES(1)))
 I DO="" G RETOUR
 S SDES(1)=DO
 S SDES(2)=$ZP(@GLO@(SDES(1),"NON.EGALITE",""))
 I SDES(2)="" G RETOUR
 S SDES(3)=$ZP(@GLO@(SDES(1),"NON.EGALITE",SDES(2),""))
 I SDES(3)="" G RETOUR
 S SDES(4)=$ZP(@GLO@(SDES(1),"NON.EGALITE",SDES(2),SDES(3),""))
 I SDES(4)="" G RETOUR
 S SDES(5)=$ZP(@GLO@(SDES(1),"NON.EGALITE",SDES(2),SDES(3),SDES(4),""))
 I SDES(5)="" G RETOUR
 F I=1:1:5 S DES(I)=SDES(I)
 K SDES
 D REAFF
 G DIAL2^%SCOREG
 
RETOUR D ^%VZEAVT($$^%QZCHW("Recherche epuisee")) G DIAL2^%SCOREG
 
CHERCH() 
 I RESUL(1)'="" S DES(1)=RESUL(1) G CH2
 S DES(1)=$O(@GLO@(""))
 I DES(1)="" Q 0
 F I=2:1:^%SCRE(SCR) S RESUL(I)=""
CH2 I RESUL(2)'="" S DES(2)=RESUL(2) G CH3
 S DES(2)=$O(@GLO@(DES(1),"NON.EGALITE",""))
 I DES(2)="" Q 0
 F I=3:1:^%SCRE(SCR) S RESUL(I)=""
CH3 I RESUL(3)'="" S DES(3)=RESUL(3) G CH4
 S DES(3)=$O(@GLO@(DES(1),"NON.EGALITE",DES(2),"")) F I=4:1:^%SCRE(SCR) S RESUL(I)=""
CH4 I RESUL(4)'="" S DES(4)=RESUL(4) G CH5
 S DES(4)=$O(@GLO@(DES(1),"NON.EGALITE",DES(2),DES(3),"")) F I=5:1:^%SCRE(SCR) S RESUL(I)=""
CH5 I RESUL(5)'="" S DES(5)=RESUL(5) G FCH
 S DES(5)=$O(@GLO@(DES(1),"NON.EGALITE",DES(2),DES(3),DES(4),""))
FCH F I=1:1:5 S RESUL(I)=DES(I)
 Q 1
AFF1 
 
 N GLO S GLO="^[QUI]SCOMPREG"
 N SCR S SCR="SCOREG1"
 D ^%VAFIGRI,^%VAFISCR
AFF11 S DX=4,DY=0 X XY W $$^%QZCHW(" Description ")
 S DX=64,DY=0 D REV^%VVIDEO X XY W $$^%QZCHW($S(%AJM="A":" Ajout ",%AJM="D":" Duplication ",%AJM="M":" Modification ",1:" Consultation "))
 D NORM^%VVIDEO Q
 
AFF2 
 
 S CAG=1 N GLO S GLO="^[QUI]SCOMPREG"
 F I=DES(1),"NON.EGALITE",DES(2),DES(3),DES(4),DES(5) S GLO=$$CONCAS^%QZCHAD(GLO,I)
 S GLO=$$CONCAS^%QZCHAD(GLO,"COND")
 S DXG=0,DYH=11,LV=8,LH=80 D CARS^%VVIDEO S DX=4,DY=11 X XY W $$^%QZCHW(" Conditions ") D NORM^%VVIDEO
 I $D(@GLO) D REAFF^%QULIMO3(1,1,GLO,0,11,80,8)
 Q
 
AFF3 
 
 N SCR S SCR="SCOREG2"
 N GLO S GLO="^[QUI]SCOMPREG"
 D ^%VAFIGRI,^%VAFISCR
 S DX=4,DY=19 X XY W $$^%QZCHW(" Action ")
 Q
REAFF 
 D CLEPAG^%VVIDEO N RESUL,GLO S GLO="^[QUI]SCOMPREG"
 F I=1:1:^%SCRE("SCOREG1") S RESUL(I)=""
 I $D(DES) D RES^%SCOREG
 D AFF1,AFF2
 S (RESUL(1),RESUL(2))=""
 D AFFACT^%SCOREG,AFF3
 Q
REAFBIS 
 S %AJM=SAJM D REAFF,A18^%QULIMO4,REAFF^%AN7 Q

