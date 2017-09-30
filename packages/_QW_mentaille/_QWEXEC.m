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

;%QWEXEC^INT^1^59547,73886^0
%QWEXEC ;
 
 
 
 
 N AJOUT,RESOR,RESVIS,ORIEN,VISI,SWITCHAF
 S AJOUT=0
 S ORIEN="NON",VISI="OUI",DOMEX=""
 D REAF
DOM D LIRE2^%VREAD($$^%QZCHW("Domaine d'execution")_" : ",DOMEX,10,70,10,10,"REAF^%QWEXEC","$$UCDOM^%QWSARGU",.CTR,.DOMEX)
 
 I CTR="A" D SUP^%QWACTI(NOMETUDE) Q
 I CTR="F" G FEXE
 S:DOMEX="" DOMEX="GENERAL"
 S @WWBUT=0
EXE D LIRE2^%VREAD($$^%QZCHW("Execution orientee")_" : ",ORIEN,10,70,12,12,"","$$UCOR^%QWEXEC",.CTR,.ORIEN)
 I CTR="A" G DOM
 I CTR="F" G FEXE
 I ORIEN="OUI" D BUT(WWBUT),REAF
 D LIRE2^%VREAD($$^%QZCHW("Mode visible")_" : ",VISI,10,70,14,14,"","$$UCVIS^%QWEXEC",.CTR,.VISI)
 I CTR="A" G EXE
FEXE 
 S SWITCHAF=1 I VISI="N" S SWITCHAF=0
 G TRAIT
 
AUTO(DOMEX,SWITCHAF) 
 S @WWBUT=0
 G TRAIT
 
TRAIT 
 S ISVGDE=1,REFUSMNP="0"
 D EXEC^%QWAC(DOMEX,SWITCHAF,0)
 D MAJREM^%QWACTI
 D ^%QCAGLC1(WWINIT,$$CONCAS^%QZCHAD("^[QUI]RQSGLO(""QW"",""ET"")",NOMETUDE_",I"))
 D DEBUT^%QWSIT
 Q
 
UCOR(YY1,REAF) 
 I (YY1="OUI")!(YY1="NON") Q 1
 S YY1="NON"
 D POCLEPA^%VVIDEO I $$MES^%VZEOUI($$^%QZCHW("Y-a-t'il un but particulier a atteindre"),"N")=1 S YY1="OUI"
 D POCLEPA^%VVIDEO S REAF=1 Q 1
 
UCVIS(YY1,REAF) 
 I (YY1="OUI")!(YY1="NON") Q 1
 S YY1="OUI"
 D POCLEPA^%VVIDEO I $$MES^%VZEOUI($$^%QZCHW("L'execution se deroule-t-elle en mode visible"),"N")=0 S YY1="NON"
 D POCLEPA^%VVIDEO S REAF=1 Q 1
 
REAF 
 D FOND
 S DX=11,DY=11 X XY W $$^%QZCHW("Domaine d'execution")," : ",DOMEX
 S DX=11,DY=13 X XY W $$^%QZCHW("Execution orientee")," : ",ORIEN
 S DX=11,DY=15 X XY W $$^%QZCHW("Mode visible")," : ",VISI
 Q
FOND 
 D CLEPAG^%VVIDEO,SIGNAL^%QWAFFI,ETUDE^%QWAFFI
 D CARSP^%VVIDEO(18,0,3,58,0)
 S DX=35,DY=1 X XY W $$^%QZCHW("E X E C U T I O N")
 D CARSP^%VVIDEO(6,9,9,68,0)
 Q
 
BUT(WWBUT) 
 N YA,YB,YC,YL,YV,CTR,ETOILE,ICOND,IPAS,REPBUT,INDBUT,ATTBUT
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Saisie des buts a atteindre"),0)
 D CARSP^%VVIDEO(10,2,4,60)
RB D LIRE2^%VREAD($$^%QZCHW("repertoire")_" : ","",13,60,2,2,"","",.CTR,.REPBUT)
 I REPBUT="" Q
 D LIRE2^%VREAD($$^%QZCHW("individu")_" : ","",13,60,3,3,"","",.CTR,.INDBUT)
 I INDBUT="" G RB
 D CARSP^%VVIDEO(5,6,17,73)
 S DX=10,DY=6 X XY D REV^%VVIDEO X XY W $$^%QZCHW("Attribut") X XY D NORM^%VVIDEO
 S DX=35 X XY D REV^%VVIDEO X XY W $$^%QZCHW("Comparateur") X XY D NORM^%VVIDEO
 S DX=47 X XY D REV^%VVIDEO X XY W $$^%QZCHW("Valeur") X XY D NORM^%VVIDEO
 S YB=5,ICOND=1,IPAS=2,@WWBUT=0
BCL 
 S YL=YB+(ICOND*IPAS)
 S ETOILE=0
AT D LIRE2^%VREAD("","",7,30,YL,YL,"","$$UCATT^%QWEXEC",.CTR,.YA)
 I YA="" Q
 S @WWBUT=@WWBUT+1
 S @WWBUT@(ICOND,"A")=YA
COMP D LIRE2^%VREAD("","",35,40,YL,YL,"","$$UCCOMP^%QWEXEC",.CTR,.YC)
 I CTR'="" G AT
 I YC="" S YC="*",ETOILE=1,DX=36,DY=YL+1 X XY W "*"
 S @WWBUT@(ICOND,"C")=YC
 I '(ETOILE) G COMPL
 S DX=46,DY=YL+1 X XY W "*"
 S @WWBUT@(ICOND,"V")="*"
 S @WWBUT@(ICOND,"E")="$$EXIRIA^%QWSTOL("_""""_REPBUT_""""_","_""""_INDBUT_""""_","_""""_YA_""""_")"
 G EPIB
COMPL D LIRE2^%VREAD("","",45,75,YL,YL,"","",.CTR,.YV)
 I CTR'="" G COMP
 S @WWBUT@(ICOND,"V")=YV
 S @WWBUT@(ICOND,"E")="$$A1B^%QWSTOL("_""""_REPBUT_""""_","_""""_INDBUT_""""_","_""""_YA_""""_")"_YC_""""_YV_""""
EPIB S ICOND=ICOND+1
 G:YL<20 BCL
 Q
 
UCATT(YY1,REAF) 
 Q:YY1="" 1
 N MOT,RES
 S RES=$$LEX^%LXSTOCK(YY1,.MOT)
 I RES=1 S YY1=MOT Q 1
 I RES=0 D ^%VZEAVT($$^%QZCHW("Attribut inconnu au lexique")) Q 0
 D ^%VZEAVT($$^%QZCHW("Attribut ambigu au lexique")) Q 0
 
UCCOMP(YY1,REAF) 
 Q:YY1="" 1
 S REAF=0
 I YY1="*" S ETOILE=1 Q 1
 I ((((((YY1'="=")&(YY1'="'="))&(YY1'="<"))&(YY1'=">"))&(YY1'="'<"))&(YY1'="'>"))&(YY1'="[") Q 0
 Q 1

