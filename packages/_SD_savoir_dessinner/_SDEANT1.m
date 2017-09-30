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

;%SDEANT1^INT^1^59547,73888^0
SDEANT1 ;
 
 
 
 
 
 
 
 
 
 
CAR S C=$E(CH,P,P) D AFF^%AN7(C)
 Q
 
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
LIGNE(Y1,DX,DY,ANCNOM,VISU,PLEI,NOM,RES,MERR) 
 N I,LIB,OK,COOR,PT,Y
 S SX=DX,SY=DY
 I VISU=1 D INIT^%AN7(SX,SY)
 I VISU=0 D INIT2^%AN7(SX,SY)
 S CH=Y1,HB=1
 K @(TEMPREF)
 K %COMPIL
 S %COMPIL="",RES="",MERR=""
 K ^DOC($J)
 S NORES=0,RESULT=1,P=1
 S I=1
BOUC S C=$E(CH,I) I C=" " S I=I+1 G BOUC
 D EMPIL^%ANGEPIL("LIG0^%SDEANT1") G ENTIER^%AN1
 
LIG0 I RESULT=0 S MERR=$$^%QZCHW("numero d'element incorrect") G MERLIG
 G:ANCNOM=%COMPIL LIG00
 I $D(@GLOBJ@("EL",%COMPIL)) S MERR=$$^%QZCHW("Un element de meme numero existe deja") G MERLIG
LIG00 S NOM=%COMPIL,%COMPIL=""
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S RES=NOM_" ; "
 D LEC
 G TYPE
 
LIG1 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 S %COMPIL=""
 D LEC,EMPIL^%ANGEPIL("LIG2^%SDEANT1")
 G @$E($P(TYPE,"."),1,6)
 
LIG2 G:'(RESULT) ERRLIG
 D CAR
 I C'="" S MERR=$$^%QZCHW("Caracteres en trop a la fin de la ligne") G MERLIG
 S OK=1,NOEL=$$GETLBLAN^%VTLBLAN($P(RES,";"))
 D ANAOK^%SDEGES2(ANCNOM'="",ANCNOM,NOEL,TEMPREF,AIDE,TYPE,.%COMPIL,RES,PAR99)
 
FINLIG D END^%AN7,KILL^%ANA(NORES)
 K @(TEMPO),@(TEMPREF),^DOC($J),%COMPIL,PAR99
 Q OK
 
MERLIG G:'(ERRMES) ERRLIG
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(MERR) H 2
 D POCLEPA^%VVIDEO
 
ERRLIG S (RES,%COMPIL)="",OK=0
 G FINLIG
 
 
TYPE S TYPE=""
 F I=1:1 Q:'($D(@GLOTYP@(I)))  I $E(Y1,P,(P+@GLOTYP@(I,"L"))-1)=@GLOTYP@(I) S TYPE=I Q
 I TYPE="" S MERR=$$^%QZCHW("Type d'element inconnu") G MERLIG
 F I=1:1:@GLOTYP@(TYPE,"L") D LEC
 S TYPE=@GLOTYP@(TYPE)
 S RES=RES_TYPE_" ; "
 G LIG1
 
POINT 
 G POINT^%SDEANT2
DROITE 
 G DROITE^%SDEANT2
CERCLE 
 G CERCLE^%SDEANT3
ARC 
 G ARC^%SDEANT3
RECTAN 
 G RECTAN^%SDEANT5
ELLIPS 
 G ELLIPSE^%SDEANT5
DEMIE 
 G DEMIEL^%SDEANT4
FLECHE 
 G FLECHE^%SDEANT6
TEXTE 
 G TEXTE^%SDEANT6
RACCOR 
 G RACCORD^%SDEANT4
 
PLUEXP 
 S MEXP=NOEXP+NBEXP
BPLEXP D EMPIL^%ANGEPIL("PLEXPR^%SDEANT1")
 S %COMPIL="",PLIB=P
 G EXPRESS^%AN4
PLEXPR G:'(RESULT) RET^%ANGEPIL
 D KILL^%ANA(NORES)
 S @("PAR"_NOEXP_"=%COMPIL")
 S LIB(NOLIB)=$$GETLBLAN^%VTLBLAN($E(CH,PLIB,P-1)),NOLIB=NOLIB+1
 S NOEXP=NOEXP+1
 D CAR
 G:NOEXP=MEXP RET^%ANGEPIL
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERR
 D LEC
 G BPLEXP
 
COORD 
 D CAR
 I C'="(" S MERR=$$^%QZCHW("Une ""("" etait attendue") G MERR
 D LEC
 D EMPIL^%ANGEPIL("COORD3^%SDEANT1")
 S %COMPIL="",PLIB=P
 G EXPRESS^%AN4
COORD3 G:'(RESULT) RET^%ANGEPIL
 D KILL^%ANA(NORES)
 D CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERR
 S COOR(REFCOR)=%COMPIL,REFCOR=REFCOR+1
 S LIB(NOLIB)=$$GETLBLAN^%VTLBLAN($E(CH,PLIB,P-1)),REFERENCE="( "_LIB(NOLIB)_" ; "
 S NOLIB=NOLIB+1
 D LEC
 D EMPIL^%ANGEPIL("COORD4^%SDEANT1")
 S %COMPIL="",PLIB=P
 G EXPRESS^%AN4
COORD4 G:'(RESULT) RET^%ANGEPIL
 D KILL^%ANA(NORES)
 D CAR
 I C'=")" S MERR=$$^%QZCHW("Une "")"" etait attendue") G MERR
 S COOR(REFCOR)=%COMPIL,REFCOR=REFCOR+1
 S LIB(NOLIB)=$$GETLBLAN^%VTLBLAN($E(CH,PLIB,P-1))
 S REFERENCE=REFERENCE_LIB(NOLIB)_" )"
 S NOLIB=NOLIB+1
 D LEC
 G RET^%ANGEPIL
 
MERR S RESULT=0,(%COMPIL,RES)=""
 G:'(ERRMES) RET^%ANGEPIL
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(MERR) H 2
 D POCLEPA^%VVIDEO
 G RET^%ANGEPIL
 
COND 
 D LEC S PAR99=""
 I C="" G RET^%ANGEPIL
 S PP=P,SSCH=C
 F I=0:0 S P=P+1 D LEC^%AN7,CAR Q:(C=" ")!(C="")  S SSCH=SSCH_C
 I SSCH'="""CONDITION""" G RET^%ANGEPIL
 D LEC,CAR
 I C'=";" S MERR=$$^%QZCHW("Un "";"" etait attendu") G MERLIG
 D LEC,EMPIL^%ANGEPIL("COND0^%SDEANT1")
 S %COMPIL="" G CHAINE^%AN1
COND0 G:'(RESULT) RET^%ANGEPIL
 S PAR99=%COMPIL
 S RES=RES_" ; "_SSCH_" ; "_PAR99
 S:$D(AIDE) AIDE=AIDE_$C(0)_PAR99
 
 G RET^%ANGEPIL

