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

;%SDEANT2^INT^1^59547,73888^0
SDEANT2 ;
 
 
 
 
 
 
 
 
 
 
 
CAR S C=$E(CH,P,P) D AFF^%AN7(C)
 Q
 
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
POINT 
 D EMPIL^%ANGEPIL("POINT0^%SDEANT2")
 S NOLIB=1
 G PREF
POINT0 G:'(RESULT) RET^%ANGEPIL
 I ANCNOM'="" G:$D(@GLOBJ@("PAEI",ANCNOM,%COMPIL)) POINT00
 I $D(@GLOBJ@("PT",%COMPIL)) S MERR=$$^%QZCHW("Point deja existant") G MERLIG
POINT00 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S PAR1=%COMPIL,RES=RES_"P"_PAR1_" ; "
 S NOEXP=2,NBEXP=2
 D LEC,EMPIL^%ANGEPIL("POINT2^%SDEANT2")
 G PLUEXP^%SDEANT1
POINT2 G:'(RESULT) RET^%ANGEPIL
 I (LIB(2)'=1)&(LIB(2)'=2) S MERR=$$^%QZCHW("type de syntaxe 1 ou 2") G MERLIG
 S RES=RES_LIB(2)_" ; "_LIB(3)
 S REFCOR=1,(COOR(1),COOR(2),LIB(4),LIB(5))=""
 I C="" D EMPIL^%ANGEPIL("POINTC^%SDEANT2") G COND^%SDEANT1
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S NOPT=1
 D LEC,EMPIL^%ANGEPIL("POINT3^%SDEANT2")
 G COORD^%SDEANT1
POINT3 G:'(RESULT) RET^%ANGEPIL
 S RES=RES_" ; "_REFERENCE
 D EMPIL^%ANGEPIL("POINTC^%SDEANT2")
 G COND^%SDEANT1
 
POINTC G:'($$ELEM^%SDEPOIN(NOM,ANCNOM,PAR1,1,PLEI,GLOBJ,COOR(1),COOR(2),.MERR)) MERLIG
 S AIDE=NOM_$C(0)_LIB(2)_$C(0)_LIB(3)_$C(0)_LIB(4)_$C(0)_LIB(5)_$C(0)_"P"_PAR1
 S %COMPIL(1)="S EPAISSEUR="_PAR2_",VISIBLE=$S($$^%QZCHW("_PAR3_")=""INVISIBLE"":0,1:1)"
 S %COMPIL(2)="S AD="_$S(LIB(2)=2:COOR(1),1:"$$^%SDSCPT(""%POINT"_PAR1_""",""ABSCISSE"")")
 S %COMPIL(3)="S OD="_$S(LIB(2)=2:COOR(2),1:"$$^%SDSCPT(""%POINT"_PAR1_""",""ORDONNEE"")")
 S %COMPIL(4)="S TEXTE=""P"_PAR1_""""
 S %COMPIL(5)="X ^%ENVIRON(""SD"",""POINT"")"
 G RET^%ANGEPIL
 
DROITE 
 D EMPIL^%ANGEPIL("DROIT0^%SDEANT2")
 S NOLIB=1,NOEXP=1,NBEXP=2
 
 G PLUEXP^%SDEANT1
DROIT0 G:'(RESULT) RET^%ANGEPIL
 S RES=RES_LIB(1)_" ; "_LIB(2)_" ; "
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S REFPT=1,(PT(1),PT(2))="",NOLIB=3
 S REFCOR=1,(COOR(1),COOR(2))="",NOPT=1
 S %COMPIL=""
 D LEC,EMPIL^%ANGEPIL("DROIT2^%SDEANT2")
 G ENTIER^%AN1
DROIT2 G:'(RESULT) RET^%ANGEPIL
 I (%COMPIL'=1)&(%COMPIL'=2) S MERR=$$^%QZCHW("Type syntaxe : 1 ou 2") G MERLIG
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S RES=RES_%COMPIL_" ; ",PAR6=%COMPIL
 D LEC,EMPIL^%ANGEPIL("DROIT1^%SDEANT2")
 G REFPO
DROIT1 G:'(RESULT) RET^%ANGEPIL
 S RES=RES_REFERENCE_" ; "
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 D LEC
 G:PAR6=1 DROIT4
 
 
 S NOPAR=4,NBPAR=2
 D EMPIL^%ANGEPIL("DROIT3^%SDEANT2")
 G PLUEXP^%SDEANT1
DROIT3 G:'(RESULT) RET^%ANGEPIL
 S RES=RES_LIB(5)_" ; "_LIB(6)
 S COOR(3)=COOR(1)_"+("_PAR3_"*$$COS^%PBCACV("_PAR4_"))"
 S COOR(4)=COOR(2)_"+("_PAR3_"*$$SIN^%PBCACV("_PAR4_"))"
 S AIDE=NOM_$C(0)_LIB(1)_$C(0)_LIB(2)_$C(0)_LIB(3)_$C(0)_LIB(4)_$C(0)_$C(0)_$C(0)_LIB(5)_$C(0)_LIB(6)_$C(0)_PT(1)_$C(0)
 D CAR
 
 I C="" D EMPIL^%ANGEPIL("DROITC^%SDEANT2") G COND^%SDEANT1
DROIT30 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S NOLIB=7
 D LEC
 I C=";" S LIB(7)="" G DROIT32
 D EMPIL^%ANGEPIL("DROIT31^%SDEANT2")
 G PREF
DROIT31 G:'(RESULT) RET^%ANGEPIL
 G:'($$DEPEND^%SDEPOI2($P(LIB(7),"P",2),2,PT(1),COOR(3),COOR(4),NOM,ANCNOM,PLEI,GLOBJ,.X,.Y,.MERR)) MERLIG
 S COOR(3)=X,COOR(4)=Y
DROIT32 S RES=RES_" ; "_LIB(7)
 S AIDE=AIDE_LIB(7)
 D EMPIL^%ANGEPIL("DROITC^%SDEANT2")
 G COND^%SDEANT1
 
DROIT4 D EMPIL^%ANGEPIL("DROIT5^%SDEANT2")
 S NOPT=2
 G REFPO
DROIT5 G:'(RESULT) RET^%ANGEPIL
 S RES=RES_REFERENCE
 D EMPIL^%ANGEPIL("DROIT6^%SDEANT2")
 G COND^%SDEANT1
DROIT6 G:'(RESULT) RET^%ANGEPIL
 S AIDE=NOM_$C(0)_LIB(1)_$C(0)_LIB(2)_$C(0)_LIB(3)_$C(0)_LIB(4)_$C(0)_LIB(5)_$C(0)_LIB(6)_$C(0)_$C(0)_$C(0)_PT(1)_$C(0)_PT(2)_$C(0)_PAR99
 
DROITC S %COMPIL(1)="S EPAISSEUR="_PAR1_",TRAIT="_PAR2
 S %COMPIL(2)="S AD="_COOR(1)
 S %COMPIL(3)="S OD="_COOR(2)
 S %COMPIL(4)="S AA="_COOR(3)
 S %COMPIL(5)="S OA="_COOR(4)
 S %COMPIL(6)="X ^%ENVIRON(""SD"",""TRAIT"")"
 G RET^%ANGEPIL
 
REFPO 
 D CAR
 G:C="(" COORD^%SDEANT1
 I C'="P" S MERR=$$^%QZCHW("Un point est reference par P<n> ou (x;y)") G MERLIG
 
 D LEC,EMPIL^%ANGEPIL("REFPO1^%SDEANT2")
 S %COMPIL="" G ENTIER^%AN1
REFPO1 G:'(RESULT) RET^%ANGEPIL
 D KILL^%ANA(NORES)
 G:'($$ANAUSE^%SDEPOIN(%COMPIL,NOPT,NOM,PLEI,GLOBJ,.REFPT,.REFCOR)) ERRLIG
 S LIB(NOLIB)="",LIB(NOLIB+1)="",NOLIB=NOLIB+2
 S REFERENCE="P"_%COMPIL
 G RET^%ANGEPIL
 
PREF 
 I C'="P" S MERR=$$^%QZCHW("Une reference du type P<n> etait attendue") G MERLIG
 S %COMPIL=""
 D LEC,EMPIL^%ANGEPIL("PREF1^%SDEANT2")
 G ENTIER^%AN1
PREF1 G:'(RESULT) RET^%ANGEPIL
 D KILL^%ANA(NORES)
 S LIB(NOLIB)="P"_%COMPIL,NOLIB=NOLIB+1
 G RET^%ANGEPIL
 
MERLIG G:'(ERRMES) ERRLIG
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(MERR) H 2
 D POCLEPA^%VVIDEO
 
ERRLIG S RESULT=0,(RES,%COMPIL)=""
 G RET^%ANGEPIL

