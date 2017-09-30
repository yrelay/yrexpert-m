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

;%SDEANT4^INT^1^59547,73888^0
SDEANT4 ;
 
 
 
 
 
 
CAR S C=$E(CH,P,P) D AFF^%AN7(C)
 Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
DEMIEL 
 D EMPIL^%ANGEPIL("DEL0^%SDEANT4")
 S (NOLIB,NOEXP)=1,NBEXP=2
 
 G PLUEXP^%SDEANT1
DEL0 G:'(RESULT) RET^%ANGEPIL
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S RES=RES_LIB(1)_" ; "_LIB(2)_" ; "
 S %COMPIL=""
 D LEC,EMPIL^%ANGEPIL("DEL1^%SDEANT4")
 G ENTIER^%AN1
DEL1 G:'(RESULT) RET^%ANGEPIL
 D KILL^%ANA(NORES)
 I (%COMPIL'=1)&(%COMPIL'=2) S MERR=$$^%QZCHW("Type syntaxe : 1 ou 2") G MERLIG
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S RES=RES_%COMPIL_" ; "
 S PAR3=%COMPIL
 S REFPT=1,(PT(1),PT(2),PT(3))=""
 S REFCOR=1,(COOR(1),COOR(2))="",NOPT=1
 D LEC,EMPIL^%ANGEPIL("DEL2^%SDEANT4")
 G REFPO^%SDEANT2
DEL2 G:'(RESULT) RET^%ANGEPIL
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S RES=RES_REFERENCE_" ; "
 D LEC
 G:PAR3=2 DEL5
 
 
 S NOPT=2
 D EMPIL^%ANGEPIL("DEL3^%SDEANT4")
 G REFPO^%SDEANT2
DEL3 G:'(RESULT) RET^%ANGEPIL
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S RES=RES_REFERENCE_" ; "
 S NOPT=3
 D LEC,EMPIL^%ANGEPIL("DEL4^%SDEANT4")
 G REFPO^%SDEANT2
DEL4 G:'(RESULT) RET^%ANGEPIL
 S RES=RES_REFERENCE
 
 S XCENTRE=(COOR(1)+COOR(3))/2
 S YCENTRE=(COOR(2)+COOR(4))/2
 
 S PAR4="$$DISTANCE^%PBCACV("_XCENTRE_","_YCENTRE_","_COOR(1)_","_COOR(2)_")"
 S PAR5="$$DISTANCE^%PBCACV("_XCENTRE_","_YCENTRE_","_COOR(5)_","_COOR(6)_")"
 S PAR6="$$ANGLE^%PBCACV("_XCENTRE_","_YCENTRE_","_COOR(1)_","_COOR(2)_")"
 S AIDE=NOM_$C(0)_LIB(1)_$C(0)_LIB(2)_$C(0)_LIB(3)_$C(0)_LIB(4)_$C(0)_LIB(5)_$C(0)_LIB(6)_$C(0)_LIB(7)_$C(0)_LIB(8)_$C(0)_$C(0)_$C(0)_$C(0)_PT(1)_$C(0)_PT(2)_$C(0)_PT(3)
 D EMPIL^%ANGEPIL("DELF^%SDEANT4")
 G COND^%SDEANT1
 
DEL5 
 S NOEXP=4,NBEXP=3
 D EMPIL^%ANGEPIL("DEL6^%SDEANT4")
 G PLUEXP^%SDEANT1
DEL6 G:'(RESULT) RET^%ANGEPIL
 S RES=RES_LIB(5)_" ; "_LIB(6)_" ; "_LIB(7)
 S AIDE=NOM_$C(0)_LIB(1)_$C(0)_LIB(2)_$C(0)_LIB(3)_$C(0)_LIB(4)_$C(0)_$C(0)_$C(0)_$C(0)_$C(0)_LIB(5)_$C(0)_LIB(6)_$C(0)_LIB(7)_$C(0)_PT(1)_$C(0)
 D CAR
 
 I C="" S LIB(8)="",LIB(9)="" G DEL9
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 D LEC
 I C=";" S LIB(8)="" G DEL7
 D EMPIL^%ANGEPIL("DEL7^%SDEANT4")
 G PREF^%SDEANT2
DEL7 G:'(RESULT) RET^%ANGEPIL
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 D LEC
 I C=";" S LIB(9)="" G DEL8
 D EMPIL^%ANGEPIL("DEL8^%SDEANT4")
 G PREF^%SDEANT2
DEL8 G:'(RESULT) RET^%ANGEPIL
 S RES=RES_" ; "_LIB(8)_" ; "_LIB(9)
DEL9 S AIDE=AIDE_LIB(8)_$C(0)_LIB(9)
 S XCENTRE=COOR(1),YCENTRE=COOR(2)
 D EMPIL^%ANGEPIL("DELF^%SDEANT4")
 G COND^%SDEANT1
 
DELF S %COMPIL(1)="S EPAISSEUR="_PAR1_",TRAIT="_PAR2
 S %COMPIL(2)="S AD="_XCENTRE
 S %COMPIL(3)="S OD="_YCENTRE
 S %COMPIL(4)="S PR="_PAR4
 S %COMPIL(5)="S GR="_PAR5
 S %COMPIL(6)="S ID="_PAR6
 S %COMPIL(7)="X ^%ENVIRON(""SD"",""DEMIE-ELLIPSE"")"
 G RET^%ANGEPIL
 
RACCORD 
 S (NOLIB,NOEXP)=1,NBEXP=2
 
 D EMPIL^%ANGEPIL("RACCO0^%SDEANT4")
 G PLUEXP^%SDEANT1
RACCO0 G:'(RESULT) RET^%ANGEPIL
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S RES=RES_LIB(1)_" ; "_LIB(2)_" ; "
 S %COMPIL=""
 D LEC,EMPIL^%ANGEPIL("RACCO01^%SDEANT4")
 G ENTIER^%AN1
RACCO01 G:'(RESULT) RET^%ANGEPIL
 D KILL^%ANA(NORES)
 S LIB(3)=%COMPIL
 I '($D(@GLOBJ@("EL",%COMPIL))) S MERR=$$^%QZCHW("Element no")_" "_%COMPIL_" "_$$^%QZCHW("inexistant") G MERLIG
 I @GLOBJ@("EL",%COMPIL,"TYPE")'="DROITE" S MERR=$$^%QZCHW("Element no")_" "_%COMPIL_" "_$$^%QZCHW("n'est pas une droite") G MERLIG
 S RES=RES_%COMPIL_" ; "
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S NOLIB=4
 D LEC,EMPIL^%ANGEPIL("RACCO02^%SDEANT4")
 G PREF^%SDEANT2
RACCO02 G:'(RESULT) RET^%ANGEPIL
 I '($D(@GLOBJ@("PAE",%COMPIL))) S MERR=$$^%QZCHW("Le point")_" P"_%COMPIL_" "_$$^%QZCHW("est inconnu") G MERLIG
 I '($D(@GLOBJ@("PAE",%COMPIL,LIB(3)))) S MERR=$$^%QZCHW("Le point")_" P"_%COMPIL_" "_$$^%QZCHW("n'appartient pas a la droite no")_" "_LIB(3) G MERLIG
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S RES=RES_"P"_%COMPIL_" ; "
 S %COMPIL=""
 D LEC,EMPIL^%ANGEPIL("RACCO1^%SDEANT4")
 G ENTIER^%AN1
RACCO1 G:'(RESULT) RET^%ANGEPIL
 D KILL^%ANA(NORES)
 I '($D(@GLOBJ@("EL",%COMPIL))) S MERR=$$^%QZCHW("Element no")_" "_%COMPIL_" "_$$^%QZCHW("inexistant") G MERLIG
 I @GLOBJ@("EL",%COMPIL,"TYPE")'="DROITE" S MERR=$$^%QZCHW("Element no")_" "_%COMPIL_" "_$$^%QZCHW("n'est pas une droite") G MERLIG
 S LIB(5)=%COMPIL
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S RES=RES_%COMPIL_" ; "
 S NOLIB=6
 D LEC,EMPIL^%ANGEPIL("RACCO2^%SDEANT4")
 G PREF^%SDEANT2
RACCO2 G:'(RESULT) RET^%ANGEPIL
 I '($D(@GLOBJ@("PAE",%COMPIL))) S MERR=$$^%QZCHW("Le point")_" P"_%COMPIL_" "_$$^%QZCHW("est inconnu") G MERLIG
 I '($D(@GLOBJ@("PAE",%COMPIL,LIB(5)))) S MERR=$$^%QZCHW("Le point")_" P"_%COMPIL_" "_$$^%QZCHW("n'appartient pas a la droite no")_" "_LIB(5) G MERLIG
 S RES=RES_"P"_%COMPIL
 S AIDE=NOM_$C(0)_LIB(1)_$C(0)_LIB(2)_$C(0)_LIB(3)_$C(0)_LIB(4)_$C(0)_LIB(5)_$C(0)_"P"_%COMPIL
 D EMPIL^%ANGEPIL("RACCO3^%SDEANT4")
 G COND^%SDEANT1
RACCO3 S %COMPIL(1)="S EPAISSEUR="_PAR1_",TRAIT="_PAR2
 S %COMPIL(2)="S D1="_LIB(3)
 S %COMPIL(3)="S D2="_LIB(5)
 S %COMPIL(4)="S P1="""_LIB(4)_""""
 S %COMPIL(5)="S P2="""_LIB(6)_""""
 S %COMPIL(6)="X ^%ENVIRON(""SD"",""RACCORD"")"
 G RET^%ANGEPIL
 
MERLIG G MERLIG^%SDEANT6

