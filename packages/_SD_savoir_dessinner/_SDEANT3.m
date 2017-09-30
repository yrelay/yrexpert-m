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

;%SDEANT3^INT^1^59547,73888^0
SDEANT3 ;
 
 
 
 
 
 
 
 
 
 
CAR S C=$E(CH,P,P) D AFF^%AN7(C)
 Q
 
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
CERCLE 
 D EMPIL^%ANGEPIL("CERCL0^%SDEANT3")
 S NOLIB=1,NOEXP=1,NBEXP=2
 
 G PLUEXP^%SDEANT1
CERCL0 G:'(RESULT) RET^%ANGEPIL
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S RES=RES_LIB(1)_" ; "_LIB(2)_" ; "
 S %COMPIL=""
 D LEC,EMPIL^%ANGEPIL("CERCL1^%SDEANT3")
 G ENTIER^%AN1
CERCL1 G:'(RESULT) RET^%ANGEPIL
 D KILL^%ANA(NORES)
 I (%COMPIL'=1)&(%COMPIL'=2) S MERR=$$^%QZCHW("Type syntaxe : 1 ou 2") G MERLIG
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S RES=RES_%COMPIL_" ; "
 S PAR3=%COMPIL
 D LEC,EMPIL^%ANGEPIL("CERCL2^%SDEANT3")
 S REFPT=1,(PT(1),PT(2))=""
 S REFCOR=1,(COOR(1),COOR(2))="",NOPT=1
 G REFPO^%SDEANT2
CERCL2 G:'(RESULT) RET^%ANGEPIL
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S RES=RES_REFERENCE_" ; "
 D LEC
 G:PAR3=2 CERCL4
 
 
 S NOPT=2
 D EMPIL^%ANGEPIL("CERCL3^%SDEANT3")
 G REFPO^%SDEANT2
CERCL3 G:'(RESULT) RET^%ANGEPIL
 S RES=RES_REFERENCE
 
 S PAR4="$$DISTANCE^%PBCACV("_COOR(1)_","_COOR(2)_","_COOR(3)_","_COOR(4)_")"
 S AIDE=NOM_$C(0)_LIB(1)_$C(0)_LIB(2)_$C(0)_LIB(3)_$C(0)_LIB(4)_$C(0)_LIB(5)_$C(0)_LIB(6)_$C(0)_$C(0)_PT(1)_$C(0)_PT(2)
 D EMPIL^%ANGEPIL("CERCLF^%SDEANT3")
 G COND^%SDEANT1
 
 
CERCL4 S %COMPIL="",PLIB=P
 D EMPIL^%ANGEPIL("CERCL5^%SDEANT3")
 G EXPRESS^%AN4
CERCL5 G:'(RESULT) RET^%ANGEPIL
 D KILL^%ANA(NORES)
 S LIB(5)=$$GETLBLAN^%VTLBLAN($E(CH,PLIB,P-1))
 S RES=RES_LIB(5)
 S PAR4=%COMPIL
 D EMPIL^%ANGEPIL("CERCL6^%SDEANT3")
 G COND^%SDEANT1
CERCL6 S AIDE=NOM_$C(0)_LIB(1)_$C(0)_LIB(2)_$C(0)_LIB(3)_$C(0)_LIB(4)_$C(0)_$C(0)_$C(0)_LIB(5)_$C(0)_PT(1)_$C(0)_PAR99
 
CERCLF S %COMPIL(1)="S EPAISSEUR="_PAR1_",TRAIT="_PAR2
 S %COMPIL(2)="S AD="_COOR(1)
 S %COMPIL(3)="S OD="_COOR(2)
 S %COMPIL(4)="S R="_PAR4
 S %COMPIL(5)="X ^%ENVIRON(""SD"",""CERCLE"")"
 G RET^%ANGEPIL
 
ARC 
 S NOLIB=1,NOEXP=1,NBEXP=2
 D EMPIL^%ANGEPIL("ARC0^%SDEANT3")
 
 G PLUEXP^%SDEANT1
ARC0 G:'(RESULT) RET^%ANGEPIL
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S RES=RES_LIB(1)_" ; "_LIB(2)_" ; "
 S %COMPIL=""
 D LEC,EMPIL^%ANGEPIL("ARC1^%SDEANT3")
 G ENTIER^%AN1
ARC1 G:'(RESULT) RET^%ANGEPIL
 D KILL^%ANA(NORES)
 I (%COMPIL'=1)&(%COMPIL'=2) S MERR=$$^%QZCHW("Type syntaxe : 1 ou 2") G MERLIG
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S RES=RES_%COMPIL_" ; "
 S PAR3=%COMPIL
 S REFPT=1,(PT(1),PT(2),PT(3))=""
 S REFCOR=1,(COOR(1),COOR(2))="",NOPT=1
 D LEC,EMPIL^%ANGEPIL("ARC2^%SDEANT3")
 G REFPO^%SDEANT2
ARC2 G:'(RESULT) RET^%ANGEPIL
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S RES=RES_REFERENCE_" ; "
 D LEC
 G:PAR3=2 ARC5
 
 
 S NOPT=2
 D EMPIL^%ANGEPIL("ARC3^%SDEANT3")
 G REFPO^%SDEANT2
ARC3 G:'(RESULT) RET^%ANGEPIL
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S RES=RES_REFERENCE_" ; "
 S NOPT=3
 D LEC,EMPIL^%ANGEPIL("ARC4^%SDEANT3")
 G REFPO^%SDEANT2
ARC4 G:'(RESULT) RET^%ANGEPIL
 S RES=RES_REFERENCE
 
 S PAR4="$$DISTANCE^%PBCACV("_COOR(1)_","_COOR(2)_","_COOR(5)_","_COOR(6)_")"
 
 S PAR5="$$ANGLE^%PBCACV("_COOR(1)_","_COOR(2)_","_COOR(3)_","_COOR(4)_")"
 
 S PAR6="$$ANGLE^%PBCACV("_COOR(1)_","_COOR(2)_","_COOR(5)_","_COOR(6)_")"
 S AIDE=NOM_$C(0)_LIB(1)_$C(0)_LIB(2)_$C(0)_LIB(3)_$C(0)_LIB(4)_$C(0)_LIB(5)_$C(0)_LIB(6)_$C(0)_LIB(7)_$C(0)_LIB(8)_$C(0)_$C(0)_$C(0)_$C(0)_PT(1)_$C(0)_PT(2)_$C(0)_PT(3)
 D EMPIL^%ANGEPIL("ARCF^%SDEANT3")
 G COND^%SDEANT1
 
ARC5 
 S NOEXP=4,NBEXP=3
 D EMPIL^%ANGEPIL("ARC6^%SDEANT3")
 G PLUEXP^%SDEANT1
ARC6 G:'(RESULT) RET^%ANGEPIL
 
 S COOR(3)=COOR(1)_"+("_PAR4_"*$$COS^%PBCACV("_PAR5_"))"
 S COOR(4)=COOR(2)_"+("_PAR4_"*$$SIN^%PBCACV("_PAR5_"))"
 
 S COOR(5)=COOR(1)_"+("_PAR4_"*$$COS^%PBCACV("_PAR6_"))"
 S COOR(6)=COOR(2)_"+("_PAR4_"*$$SIN^%PBCACV("_PAR6_"))"
 S RES=RES_LIB(5)_" ; "_LIB(6)_" ; "_LIB(7)
 S AIDE=NOM_$C(0)_LIB(1)_$C(0)_LIB(2)_$C(0)_LIB(3)_$C(0)_LIB(4)_$C(0)_$C(0)_$C(0)_$C(0)_$C(0)_LIB(5)_$C(0)_LIB(6)_$C(0)_LIB(7)_$C(0)_PT(1)_$C(0)
 D CAR
 
 I C="" S AIDE=AIDE_$C(0) D EMPIL^%ANGEPIL("ARCF^%SDEANT3") G COND^%SDEANT1
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 D LEC
 I C=";" S LIB(8)="" G ARC7
 D EMPIL^%ANGEPIL("ARC7^%SDEANT3")
 G PREF^%SDEANT2
ARC7 G:'(RESULT) RET^%ANGEPIL
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 D LEC
 I C=";" S LIB(9)="" G ARC9
 D EMPIL^%ANGEPIL("ARC8^%SDEANT3")
 G PREF^%SDEANT2
ARC8 G:'(RESULT) RET^%ANGEPIL
 G:'($$DEPEND^%SDEPOI2($P(LIB(8),"P",2),2,PT(1),COOR(3),COOR(4),NOM,ANCNOM,PLEI,GLOBJ,.X,.Y,.MERR)) MERLIG
 G:'($$DEPEND^%SDEPOI2($P(LIB(9),"P",2),3,PT(1),COOR(5),COOR(6),NOM,ANCNOM,PLEI,GLOBJ,.X,.Y,.MERR)) MERLIG
ARC9 S RES=RES_" ; "_LIB(8)_" ; "_LIB(9)
 S AIDE=AIDE_LIB(8)_$C(0)_LIB(9)
 D EMPIL^%ANGEPIL("ARCF^%SDEANT3")
 G COND^%SDEANT1
 
ARCF S %COMPIL(1)="S EPAISSEUR="_PAR1_",TRAIT="_PAR2
 S %COMPIL(2)="S AD="_COOR(1)
 S %COMPIL(3)="S OD="_COOR(2)
 S %COMPIL(4)="S R="_PAR4
 S %COMPIL(5)="S ID="_PAR5
 S %COMPIL(6)="S IF="_PAR6
 S %COMPIL(7)="X ^%ENVIRON(""SD"",""ARC"")"
 G RET^%ANGEPIL
 
MERLIG G MERLIG^%SDEANT6

