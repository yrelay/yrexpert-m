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

;%SDEANT5^INT^1^59547,73888^0
SDEANT5 ;
 
 
 
 
 
 
CAR S C=$E(CH,P,P) D AFF^%AN7(C)
 Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
RECTAN 
 S (NOLIB,NOEXP)=1,NBEXP=2
 
 D EMPIL^%ANGEPIL("RECTA0^%SDEANT5")
 G PLUEXP^%SDEANT1
RECTA0 G:'(RESULT) RET^%ANGEPIL
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG^%SDEANT6
 S RES=RES_LIB(1)_" ; "_LIB(2)_" ; "
 S %COMPIL=""
 D LEC,EMPIL^%ANGEPIL("RECTA01^%SDEANT5")
 G CHAINE^%AN1
RECTA01 G:'(RESULT) RET^%ANGEPIL
 D KILL^%ANA(NORES)
 S PAR3=$E(%COMPIL,2)
 S PAR3=$S(PAR3=$E($$^%QZCHW("OUI")):1,PAR3=$E($$^%QZCHW("NON")):0,1:"")
 I PAR3="" S MERR=$$^%QZCHW("Plein : ""O"" ou ""N""") G MERLIG^%SDEANT6
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG^%SDEANT6
 S RES=RES_%COMPIL_" ; "
 S PAR3=%COMPIL
 S %COMPIL=""
 D LEC,EMPIL^%ANGEPIL("RECTA1^%SDEANT5")
 G ENTIER^%AN1
RECTA1 G:'(RESULT) RET^%ANGEPIL
 D KILL^%ANA(NORES)
 I (%COMPIL'=1)&(%COMPIL'=2) S MERR=$$^%QZCHW("Type syntaxe : 1 ou 2") G MERLIG^%SDEANT6
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG^%SDEANT6
 S RES=RES_%COMPIL_" ; "
 S PAR4=%COMPIL
 S REFPT=1,(PT(1),PT(2))=""
 S REFCOR=1,(COOR(1),COOR(2))="",NOPT=1
 D LEC,EMPIL^%ANGEPIL("RECTA2^%SDEANT5")
 G REFPO^%SDEANT2
RECTA2 G:'(RESULT) RET^%ANGEPIL
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG^%SDEANT6
 S RES=RES_REFERENCE_" ; "
 D LEC
 G:PAR4=2 RECTA4
 
 
 S NOPT=2
 D EMPIL^%ANGEPIL("RECTA3^%SDEANT5")
 G REFPO^%SDEANT2
RECTA3 G:'(RESULT) RET^%ANGEPIL
 S RES=RES_REFERENCE
 S AIDE=NOM_$C(0)_LIB(1)_$C(0)_LIB(2)_$C(0)_LIB(3)_$C(0)_LIB(4)_$C(0)_LIB(5)_$C(0)_LIB(6)_$C(0)_$C(0)_$C(0)_$E($S(PAR3=0:$$^%QZCHW("NON"),1:$$^%QZCHW("OUI")),1)_$C(0)_PT(1)_$C(0)_PT(2)
 G RECTAF
 
RECTA4 S NOEXP=4,NBEXP=2
 D EMPIL^%ANGEPIL("RECTA5^%SDEANT5")
 G PLUEXP^%SDEANT1
RECTA5 G:'(RESULT) RET^%ANGEPIL
 S RES=RES_LIB(5)_" ; "_LIB(6)
 S COOR(3)=COOR(1)_"+"_PAR5
 S COOR(4)=COOR(2)_"-"_PAR4
 S AIDE=NOM_$C(0)_LIB(1)_$C(0)_LIB(2)_$C(0)_LIB(3)_$C(0)_LIB(4)_$C(0)_$C(0)_$C(0)_LIB(5)_$C(0)_LIB(6)_$C(0)_$E($S(PAR3=0:$$^%QZCHW("NON"),1:$$^%QZCHW("OUI")),1)_$C(0)_PT(1)_$C(0)
 D CAR
 
 I C="" G RECTAF
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG^%SDEANT6
 D LEC,EMPIL^%ANGEPIL("RECTA6^%SDEANT5")
 G PREF^%SDEANT2
RECTA6 G:'(RESULT) RET^%ANGEPIL
 G:'($$DEPEND^%SDEPOI2($P(LIB(7),"P",2),2,PT(1),COOR(3),COOR(4),NOM,ANCNOM,PLEI,GLOBJ,.X,.Y,.MERR)) MERLIG^%SDEANT6
 S COOR(3)=X,COOR(4)=Y
 S RES=RES_" ; "_LIB(7)
 S AIDE=AIDE_LIB(7)
 
RECTAF S %COMPIL(1)="S EPAISSEUR="_PAR1_",TRAIT="_PAR2_",PLEIN="_PAR3
 S %COMPIL(2)="S AD="_COOR(1)
 S %COMPIL(3)="S OD="_COOR(2)
 S %COMPIL(4)="S AA="_COOR(3)
 S %COMPIL(5)="S OA="_COOR(4)
 S %COMPIL(6)="X ^%ENVIRON(""SD"",""RECTANGLE"")"
 G RET^%ANGEPIL
 
ELLIPSE 
 S NOLIB=1,NOEXP=1,NBEXP=2
 
 D EMPIL^%ANGEPIL("ELL0^%SDEANT5")
 G PLUEXP^%SDEANT1
ELL0 G:'(RESULT) RET^%ANGEPIL
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG^%SDEANT6
 S RES=RES_LIB(1)_" ; "_LIB(2)_" ; "
 S %COMPIL=""
 D LEC,EMPIL^%ANGEPIL("ELL1^%SDEANT5")
 G ENTIER^%AN1
ELL1 G:'(RESULT) RET^%ANGEPIL
 D KILL^%ANA(NORES)
 I (%COMPIL'=1)&(%COMPIL'=2) S MERR=$$^%QZCHW("Type syntaxe : 1 ou 2") G MERLIG^%SDEANT6
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG^%SDEANT6
 S RES=RES_%COMPIL_" ; "
 S PAR3=%COMPIL
 S REFPT=1,(PT(1),PT(2),PT(3))=""
 S REFCOR=1,(COOR(1),COOR(2))="",NOPT=1
 D LEC,EMPIL^%ANGEPIL("ELL2^%SDEANT5")
 G REFPO^%SDEANT2
ELL2 G:'(RESULT) RET^%ANGEPIL
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG^%SDEANT6
 S RES=RES_REFERENCE_" ; "
 D LEC
 G:PAR3=2 ELL5
 
 
 S NOPT=2
 D EMPIL^%ANGEPIL("ELL3^%SDEANT5")
 G REFPO^%SDEANT2
ELL3 G:'(RESULT) RET^%ANGEPIL
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG^%SDEANT6
 S RES=RES_REFERENCE_" ; "
 S NOPT=3
 D LEC,EMPIL^%ANGEPIL("ELL4^%SDEANT5")
 G REFPO^%SDEANT2
ELL4 G:'(RESULT) RET^%ANGEPIL
 S RES=RES_REFERENCE
 
 S XCENTRE=(COOR(1)+COOR(3))/2
 S YCENTRE=(COOR(2)+COOR(4))/2
 
 S PAR4="$$DISTANCE^%PBCACV("_XCENTRE_","_YCENTRE_","_COOR(1)_","_COOR(2)_")"
 S PAR5="$$DISTANCE^%PBCACV("_XCENTRE_","_YCENTRE_","_COOR(5)_","_COOR(6)_")"
 S PAR6="$$ANGLE^%PBCACV("_XCENTRE_","_YCENTRE_","_COOR(1)_","_COOR(2)_")"
 S AIDE=NOM_$C(0)_LIB(1)_$C(0)_LIB(2)_$C(0)_LIB(3)_$C(0)_LIB(4)_$C(0)_LIB(5)_$C(0)_LIB(6)_$C(0)_LIB(7)_$C(0)_LIB(8)_$C(0)_$C(0)_$C(0)_$C(0)_PT(1)_$C(0)_PT(2)_$C(0)_PT(3)
 D EMPIL^%ANGEPIL("ELLF^%SDEANT5")
 G COND^%SDEANT1
 
ELL5 
 S NOEXP=4,NBEXP=3
 D EMPIL^%ANGEPIL("ELL6^%SDEANT5")
 G PLUEXP^%SDEANT1
ELL6 G:'(RESULT) RET^%ANGEPIL
 S RES=RES_LIB(5)_" ; "_LIB(6)_" ; "_LIB(7)
 S AIDE=NOM_$C(0)_LIB(1)_$C(0)_LIB(2)_$C(0)_LIB(3)_$C(0)_LIB(4)_$C(0)_$C(0)_$C(0)_$C(0)_$C(0)_LIB(5)_$C(0)_LIB(6)_$C(0)_LIB(7)_$C(0)_PT(1)_$C(0)
 D CAR
 
 I C="" S LIB(8)="",LIB(9)="" G ELL9
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG^%SDEANT6
 D LEC
 I C=";" S LIB(8)="" G ELL7
 D EMPIL^%ANGEPIL("ELL7^%SDEANT5")
 G PREF^%SDEANT2
ELL7 G:'(RESULT) RET^%ANGEPIL
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG^%SDEANT6
 D LEC
 I C=";" S LIB(9)="" G ELL8
 D EMPIL^%ANGEPIL("ELL8^%SDEANT5")
 G PREF^%SDEANT2
ELL8 G:'(RESULT) RET^%ANGEPIL
 S RES=RES_" ; "_LIB(8)_" ; "_LIB(9)
ELL9 S AIDE=AIDE_LIB(8)_$C(0)_LIB(9)
 S XCENTRE=COOR(1),YCENTRE=COOR(2)
 D EMPIL^%ANGEPIL("ELLF^%SDEANT5")
 G COND^%SDEANT1
 
ELLF S %COMPIL(1)="S EPAISSEUR="_PAR1_",TRAIT="_PAR2
 S %COMPIL(2)="S AD="_XCENTRE
 S %COMPIL(3)="S OD="_YCENTRE
 S %COMPIL(4)="S PR="_PAR4
 S %COMPIL(5)="S GR="_PAR5
 S %COMPIL(6)="S ID="_PAR6
 S %COMPIL(7)="X ^%ENVIRON(""SD"",""ELLIPSE"")"
 G RET^%ANGEPIL
 ;

