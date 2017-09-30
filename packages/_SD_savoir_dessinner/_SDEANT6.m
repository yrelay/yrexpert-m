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

;%SDEANT6^INT^1^59547,73888^0
SDEANT6 ;
 
 
 
 
 
 
 
 
 
CAR S C=$E(CH,P,P) D AFF^%AN7(C)
 Q
 
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
TEXTE 
 S (NOLIB,NOEXP,NBEXP)=1
 
 D EMPIL^%ANGEPIL("TEXTE0^%SDEANT6")
 G PLUEXP^%SDEANT1
TEXTE0 G:'(RESULT) RET^%ANGEPIL
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S RES=RES_LIB(1)_" ; "
 S NOLIB=2
 S REFPT=1,PT(1)="",NOPT=1
 S REFCOR=1,(COOR(1),COOR(2))=""
 D LEC,EMPIL^%ANGEPIL("TEXTE02^%SDEANT6")
 G REFPO^%SDEANT2
TEXTE02 G:'(RESULT) RET^%ANGEPIL
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S RES=RES_REFERENCE_" ; "
 D LEC,EMPIL^%ANGEPIL("TEXTE1^%SDEANT6")
 S %COMPIL="",HB=0,PLIB=P
 G EXPRESS^%AN4
TEXTE1 S HB=1
 G:'(RESULT) RET^%ANGEPIL
 S PAR3=%COMPIL
 S LIB(NOLIB)=$$GETLBLAN^%VTLBLAN($E(CH,PLIB,P-1))
 S RES=RES_LIB(NOLIB),NOLIB=NOLIB+1
 D KILL^%ANA(NORES)
 S LIB(NOLIB)=0,PAR2=0
 D CAR
 I C="" G TEXTE3
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 D LEC
 I C=";" S RES=RES_" ; " G TEXTE3
 D EMPIL^%ANGEPIL("TEXTE2^%SDEANT6")
 G PLUEXP^%SDEANT1
TEXTE2 G:'(RESULT) RET^%ANGEPIL
 S RES=RES_" ; "_LIB(5)
TEXTE3 S AIDE=NOM_$C(0)_LIB(1)_$C(0)_LIB(2)_$C(0)_LIB(3)_$C(0)_LIB(4)_$C(0)_LIB(5)_$C(0)_PT(1)
 D EMPIL^%ANGEPIL("TEXTE4^%SDEANT6")
 G COND^%SDEANT1
 
TEXTE4 S %COMPIL(1)="S TAILLE="_PAR1
 S %COMPIL(2)="S I="_PAR2
 S %COMPIL(3)="S AD="_COOR(1)
 S %COMPIL(4)="S OD="_COOR(2)
 S %COMPIL(5)="S TEXTE="_PAR3
 S %COMPIL(6)="X ^%ENVIRON(""SD"",""TEXTE"")"
 G RET^%ANGEPIL
 
FLECHE 
 D EMPIL^%ANGEPIL("FL0^%SDEANT6")
 S (NOLIB,NOEXP)=1,NBEXP=2
 
 G PLUEXP^%SDEANT1
FL0 G:'(RESULT) RET^%ANGEPIL
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S RES=RES_LIB(1)_" ; "_LIB(2)_" ; "
 D LEC,EMPIL^%ANGEPIL("FL01^%SDEANT6")
 S %COMPIL="",PLIB=P
 G EXPRESS^%AN4
FL01 G:'(RESULT) RET^%ANGEPIL
 S LIB(3)=$$GETLBLAN^%VTLBLAN($E(CH,PLIB,P-1))
 D KILL^%ANA(NORES)
 S PAR3="$S("_%COMPIL_"=$$^%QZCHW(""EXTERIEUR""):""E"","_%COMPIL_"=$$^%QZCHW(""INTERIEUR""):""I"",1:"""")"
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S RES=RES_LIB(3)_" ; "
 D LEC,EMPIL^%ANGEPIL("FL02^%SDEANT6")
 S %COMPIL="",PLIB=P
 G EXPRESS^%AN4
FL02 G:'(RESULT) RET^%ANGEPIL
 S LIB(4)=$$GETLBLAN^%VTLBLAN($E(CH,PLIB,P-1))
 D KILL^%ANA(NORES)
 S PAR4="$S("_%COMPIL_"=$$^%QZCHW(""SIMPLE""):""S"","_%COMPIL_"=$$^%QZCHW(""DOUBLE""):""D"",1:"""")"
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S RES=RES_%COMPIL_" ; "
 D KILL^%ANA(NORES)
 
 D LEC,EMPIL^%ANGEPIL("FL03^%SDEANT6")
 S %COMPIL="",HB=0,PLIB=P
 G EXPRESS^%AN4
FL03 S HB=1
 G:'(RESULT) RET^%ANGEPIL
 D KILL^%ANA(NORES)
 S LIB(5)=$$GETLBLAN^%VTLBLAN($E(CH,PLIB,P-1))
 S NOLIB=5,RES=RES_LIB(NOLIB)_" ; ",NOLIB=NOLIB+1
 S PAR5=%COMPIL,%COMPIL=""
 D LEC,EMPIL^%ANGEPIL("FL1^%SDEANT6")
 G ENTIER^%AN1
FL1 G:'(RESULT) RET^%ANGEPIL
 D KILL^%ANA(NORES)
 I (%COMPIL'=1)&(%COMPIL'=2) S MERR=$$^%QZCHW("Type syntaxe : 1 ou 2") G MERLIG
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S RES=RES_%COMPIL_" ; "
 S PAR6=%COMPIL
 S REFPT=1,(PT(1),PT(2))=""
 S REFCOR=1,(COOR(1),COOR(2))="",NOPT=1
 D LEC,EMPIL^%ANGEPIL("FL2^%SDEANT6")
 G REFPO^%SDEANT2
FL2 G:'(RESULT) RET^%ANGEPIL
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S RES=RES_REFERENCE_" ; "
 D LEC
 G:PAR6=2 FL4
 
 S NOPT=2
 D EMPIL^%ANGEPIL("FL3^%SDEANT6")
 G REFPO^%SDEANT2
FL3 G:'(RESULT) RET^%ANGEPIL
 S RES=RES_REFERENCE
 S AIDE=NOM_$C(0)_LIB(1)_$C(0)_LIB(2)_$C(0)_LIB(3)_$C(0)_LIB(4)_$C(0)_LIB(5)_$C(0)_LIB(6)_$C(0)_LIB(7)_$C(0)_LIB(8)_$C(0)_LIB(9)_$C(0)_$C(0)_$C(0)_PT(1)_$C(0)_PT(2)
 D EMPIL^%ANGEPIL("FLECHF^%SDEANT6")
 G COND^%SDEANT1
 
 
FL4 S NOEXP=7,NBEXP=2
 D EMPIL^%ANGEPIL("FL5^%SDEANT6")
 G PLUEXP^%SDEANT1
FL5 G:'(RESULT) RET^%ANGEPIL
 S RES=RES_LIB(8)_" ; "_LIB(9)
 S COOR(3)=COOR(1)_"+("_PAR7_"*$$COS^%PBCACV("_PAR8_"))"
 S COOR(4)=COOR(2)_"+("_PAR7_"*$$SIN^%PBCACV("_PAR8_"))"
 S AIDE=NOM_$C(0)_LIB(1)_$C(0)_LIB(2)_$C(0)_LIB(3)_$C(0)_LIB(4)_$C(0)_LIB(5)_$C(0)_LIB(6)_$C(0)_LIB(7)_$C(0)_$C(0)_$C(0)_LIB(8)_$C(0)_LIB(9)_$C(0)_PT(1)_$C(0)
 D CAR
 
 I C="" S LIB(10)="" G FL7
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 D LEC
 I C=";" S LIB(10)="" G FL7
 D EMPIL^%ANGEPIL("FL6^%SDEANT6")
 G PREF^%SDEANT2
FL6 G:'(RESULT) RET^%ANGEPIL
 G:'($$DEPEND^%SDEPOI2($P(LIB(10),"P",2),2,PT(1),COOR(3),COOR(4),NOM,ANCNOM,PLEI,GLOBJ,.X,.Y,.MERR)) MERLIG
 S COOR(3)=X,COOR(4)=Y
FL7 S RES=RES_" ; "_LIB(10)
 S AIDE=AIDE_LIB(10)
 D EMPIL^%ANGEPIL("FLECHF^%SDEANT6")
 G COND^%SDEANT1
 
FLECHF S %COMPIL(1)="S EPAISSEUR="_PAR1_",TRAIT="_PAR2
 S %COMPIL(2)="S AD="_COOR(1)
 S %COMPIL(3)="S OD="_COOR(2)
 S %COMPIL(4)="S AA="_COOR(3)
 S %COMPIL(5)="S OA="_COOR(4)
 S %COMPIL(6)="S POINTE="_PAR3
 S %COMPIL(7)="S TYPE="_PAR4
 S %COMPIL(8)="S TEXTE="_PAR5
 S %COMPIL(9)="X ^%ENVIRON(""SD"",""FLECHE"")"
 G RET^%ANGEPIL
 
MERLIG S RESULT=0,(RES,%COMPIL)=""
 G:'(ERRMES) RET^%ANGEPIL
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(MERR) H 2
 D POCLEPA^%VVIDEO
 G RET^%ANGEPIL

