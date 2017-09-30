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

;%QMEACL2^INT^1^59547,73877^0
QMEACL2 ;
 
 
 
 
REAFF(XG,YH,LA,HA) 
 N XC,YC
 D CLFEN^%VVIDEO(XG,YH,HA,LA)
 D CARSP^%VVIDEO(XG,YH,HA,LA,1)
 D CUROF^%VVIDEO
 D REV^%VVIDEO,LIB,NORM^%VVIDEO,VAL,TI,HE
 D CURON^%VVIDEO
 Q
 
LIB 
 S YC=""
BLIBY S YC=$O(@DESAT@(NOPAG,YC)) Q:YC=""
 I YC'<HA Q
 S XC=""
BLIBX S XC=$O(@DESAT@(NOPAG,YC,XC))
 G:XC="" BLIBY
 S DY=YC+YH,DX=XC+XG
 X XY W @DESAT@(NOPAG,YC,XC)
 G BLIBX
 
VAL 
 S YC=""
BVALY S YC=$O(@DESDON@(NOPAG,YC)) Q:YC=""
 I YC'<HA Q
 S XC=""
BVALX S XC=$O(@DESDON@(NOPAG,YC,XC))
 G:XC="" BVALY
 S DY=YC+YH,DX=XC+XG X XY
 W @DON@(@DESDON@(NOPAG,YC,XC,"ORD"))
 G BVALX
 
HE 
 S DX=XG+2,DY=(YH+HA)-1 X XY
 W $$^%QZCHW("(+),(-),(?),(HELP),(CtrlX),(CtrlP),(CtrlL),(CtrlH)")
 Q
 
TI 
 S DX=XG+2,DY=YH X XY W $$^%QZCHW(" Page : "),NOPAG,"/",$ZP(@DESDON@(""))
 Q
 
 
 
AFPRES(R,S,XG,YG,LH,LV,PP) 
 N MOD,AT,ORD,AFF,TYP,V
 S MOD="C",AT="PRESENTATION",AFF=0
 S V=$$^%QSCALVA(R,S,"PRESENTATION") Q:V=""
 S ORD=$$OR^%QSCALVA(R,S,"PRESENTATION",V)
 D AFF2^%QSNOTE2(XG,YG,LH,LV,R,S,AT,V,ORD,BASE,IND,RAFFICH,PP)
 Q
 
IMPR(NOPAG) 
 N P,LNO,LISTE,NOL,NOC,%NOL,%NOC,CDEP
 D MSG^%VZEATT($$^%QZCHW("Impression en cours..."))
 S P=^TABIDENT(WHOIS,"PRINTER")
 S LISTE=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(LISTE)
 S NOL=""
 F %NOL=0:0 S NOL=$O(@DESAT@(NOPAG,NOL)) Q:NOL=""  S NOC="" F %NOC=0:0 S NOC=$O(@DESAT@(NOPAG,NOL,NOC)) Q:NOC=""  S @LISTE@(NOL,NOC)=@DESAT@(NOPAG,NOL,NOC)
 F %NOL=0:0 S NOL=$O(@DESDON@(NOPAG,NOL)) Q:NOL=""  S NOC="" F %NOC=0:0 S NOC=$O(@DESDON@(NOPAG,NOL,NOC)) Q:NOC=""  S @LISTE@(NOL,NOC)=@DON@(@DESDON@(NOPAG,NOL,NOC,"ORD"))
 S LNO=0 C P O P U P
 W #
 W !,$$^%QZCHW("Le "),$$DATE^%QMDATE,$$^%QZCHW(" a "),$$HEURE^%QMDATE,?40,$$^%QZCHW("Saisie : "),S
 W !,!
 S CDEP=5
 W ?CDEP,"+"
 W "---- ",$$^%QZCHW("Page: "),NOPAG," "
 F %NOC=($X-CDEP)+1:1:LH2 W "-"
 W "+"
 S NOL=0
BLI S NOL=NOL+1
 G:NOL>LV2 BLIF
 W !,?CDEP,"|"
 G:$D(@LISTE@(NOL)) BCOLI
 W ?LH2+CDEP,"|"
 G BLI
BCOLI S %NOC=0
 S NOC=""
BCO S NOC=$O(@LISTE@(NOL,NOC))
 I NOC="" W ?LH2+CDEP,"|" G BLI
 F %I=1:1:NOC-%NOC W " "
 W @LISTE@(NOL,NOC)
 S %NOC=NOC+$L(@LISTE@(NOL,NOC))
 G BCO
BLIF W !,?CDEP,"+"
 F %NOC=2:1:LH2 W "-"
 W "+"
 C P U 0
 K @(LISTE)
 D POCLEPA^%VVIDEO
 W $$^%QZCHW("Impression terminee...")
 H 3
 D POCLEPA^%VVIDEO
 D NORM^%VVIDEO
 Q
HELP 
 N P,VL,%I,CHL,LISTE
 S LISTE=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(LISTE)
 D CLFEN^%VVIDEO(XG1,YG1,LV1,LH1)
 D CARSP^%VVIDEO(XG1,YG1,LV1,LH1,0)
 S DX=XG1+15,DY=YG1 X XY
 D BLD^%VVIDEO,REV^%VVIDEO W $$^%QZCHW("AIDE") D NORM^%VVIDEO
 S P=1
 F %I=1:1 S VL=$T(AIDE+%I) Q:VL=""  S @LISTE@(%I)=$P(VL,";;",2)
 D REAFF^%QULIMO3(1,1,LISTE,XG1,YG1,LH1,LV1)
 D VISU^%QULIMO(XG1,YG1,LH1,LV1,LISTE,.P)
 K @(LISTE)
 Q
 
 
AIDE ;;
 ;;
 ;;  +           page suivante
 ;;  -           page precedente
 ;;
 ;;  v           ligne suivante
 ;;  ^           ligne precedente
 ;;  >           zone suivante
 ;;  <           zone precedente
 ;;
 ;;  ?           affichage des valeurs legales
 ;;  RETURN      validation de la saisie et passage a la zone suivante
 ;;  CTRLA       fin
 ;;  CTRLF        "
 ;;  CTRLG       gommage de la zone de saisie
 ;;  CTRLH       aide concernant les differentes touches
 ;;  CTRLJ       impression de la fenetre courante de la SAISIE
 ;;  CTRLL       passage de l'affichage horizontal a l'affichage vertical
 ;;              et vice-versa
 ;;  CTRLP       acces au texte de presentation de la SAISIE
 ;;  CTRLR       reaffichage
 ;;  CTRLX       acces au texte de presentation de la zone de saisie
 ;;  HELP                   "                    "

