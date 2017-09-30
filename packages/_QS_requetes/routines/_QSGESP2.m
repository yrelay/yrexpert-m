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

;%QSGESP2^INT^1^59547,73881^0
QSGESP2 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
EXE(ACT,XG,YH,LA,HA,BA,IND,ATT,VAL,ORD,ROUT) 
 N %G,%N,AFF,DER,G,GL,NUM,OLDLC,OLDYC,OLDP,XC
 S OLDYC=YC,OLDLC=LC,OLDP=PAGE,DER=$ZP(^ATT($J,Z,""))
 S ROUT=ROUT_"(ACT,XG,YH,LA,HA,BA,IND,ATT,.VAL,.ORD,.GL,.AFF)"
 D @ROUT
 S G=""
 F %G=0:0 S G=$O(GL("SUP",G)) Q:G=""  S NUM="" F %N=0:0 S NUM=$O(GL("SUP",G,NUM)) Q:NUM=""  S LC=^LATT($J,Z,G,NUM) D SUP^%QSATTR2(G,GL("SUP",G,NUM),NUM,.LC)
 S G="" F %G=0:0 S G=$O(GL("AJ",G)) Q:G=""  S NUM="" F %N=0:0 S NUM=$O(GL("AJ",G,NUM)) Q:NUM=""  D AJ^%QSATTR2(G,GL("AJ",G,NUM),NUM)
 S G="" F %G=0:0 S G=$O(GL("MOD",G)) Q:G=""  S NUM="" F %N=0:0 S NUM=$O(GL("MOD",G,NUM)) Q:NUM=""  S LC=^LATT($J,Z,G,NUM) D MOD^%QSATTR2(G,GL("MOD",G,NUM),NUM,LC)
 G:PAGE'=OLDP FE
 S YC=OLDYC,LC=OLDLC
 I (LC=DER)&('($D(^ATT($J,Z,LC)))) S LC=LC-1,YC=YC-1
FE S:'($D(AFF)) AFF=1 D:AFF'=0 POCLEPA^%VVIDEO
 I AFF=2 S DX=XG,DY=YH D CLEBAS^%VVIDEO,REAFF^%QSATTR2
 Q:AFF'=3
 G:'($D(NIVREP)) FE2
 N SZ
 S SZ=Z,Z=NIVREP
 D CLEPAG^%VVIDEO,CAD^%QSGBASE,REAFF^%QUCHOI2
 S Z=Z+1 D REAFF^%QUCHOI2
 S Z=SZ,DX=XG,DY=YH D CLEBAS^%VVIDEO
FE2 D REAFF^%QSATTR2
 Q
 
EXE2(ACT,XG,YH,LA,HA,BA,IND,ATT,VAL,ORD,ROUT) 
 N %G,%N,L,AFF,G,GL,NUM,OLDPC,OLDPL,%SPIL,PL2
 I '($D(OLD)) N OLD S OLD=VAL
 S OLDPC=PC,OLDPL=PL,OLDPY=PY
 S ROUT=ROUT_"(ACT,XG,YH,LA,HA,BA,IND,ATT,.VAL,.ORD,.GL,.AFF)"
 D @ROUT
 D:AFF'=0 POCLEPA^%VVIDEO
 D:AFF=2 REAFF^%QSCOLF
 G:AFF'=3 SEXE2
 D POCLEPA^%VVIDEO,TITRE^%QSAJCM4
 S %SPIL=PIL
 F %I=1:1:%SPIL S PIL=%I D AFREP^%QSAJCM4($P(PIL(%I),"^",3)),AFIND^%QSAJCM4($P(PIL(%I),"^"))
 S PIL=%SPIL
 D REAFF^%QSCOLF
SEXE2 
 S PC=1,PX=POSIT(PC),G=""
 F %G=0:0 S G=$O(GL("SUP",G)) Q:G=""  S NUM="" F %N=0:0 S NUM=$O(GL("SUP",G,NUM)) Q:NUM=""  S PL=@GATT@(G,NUM),PY=((YH+2)-LIGDEP)+PL D SUP^%QSCOLF3(G,NUM,"",1,PL)
 S G="" F %G=0:0 S G=$O(GL("AJ",G)) Q:G=""  S NUM="" F %N=0:0 S NUM=$O(GL("AJ",G,NUM)) Q:NUM=""  S PL2=$ZP(@DONNE@(""))+1 D AJ^%QSCOLF3(G,NUM,G,NUM,PL2,1) S PX=POSIT(2),PC=2 D AJ^%QSCOLF3("","",GL("AJ",G,NUM),1,PL2,2) S PC=1,PX=POSIT(1)
 S LARG=$P(@COLON@(OLDPC),"^",3)
 
 S G="" F %G=0:0 S G=$O(GL("MOD",G)) Q:G=""  S NUM="" F %N=0:0 S NUM=$O(GL("MOD",G,NUM)) Q:NUM=""  S PL=@GATT@(G,NUM),DX=POSIT(OLDPC),DY=OLDPY X XY W $J("",LARG) X XY W $E(GL("MOD",G,NUM),1,LARG) D MOD^%QSCOLF3(OLD,NUM,G,GL("MOD",G,NUM),NUM,PL)
 S PC=OLDPC,PX=POSIT(PC),PL=OLDPL,PY=OLDPY
 Q

