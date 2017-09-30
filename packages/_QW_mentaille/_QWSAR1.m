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

;%QWSAR1^INT^1^59547,73886^0
QWSAR1 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
INT(VAL) 
 I VAL'="?" S %QUE=VAL G EXIS
 S REFUSE=1 D ^%QSCHQUE,CLEPAG^%VVIDEO,^%VAFIGRI,^%VAFISCR Q:%QUE=""
 S TAB(IC)=%QUE D ^%VAFFICH S REFUSE=0 Q
EXIS S REFUSE='($$REP^%QSGEST5($$NOMINT^%QSF(%QUE))) I REFUSE D ^%VZEAVT($$^%QZCHW("Ce repertoire n'existe pas"))
 Q
 
COMP(VAL) 
 S REFUSE=0
 Q:VAL="="  Q:VAL="'="  Q:VAL="<"  Q:VAL=">"  Q:VAL="'<"  Q:VAL="'>"
 Q:VAL="["  Q:VAL="'["
 S REFUSE=1
 D ^%VZEAVT($$^%QZCHW("Comparateurs possibles : = '= < '< > '> [ '["))
 Q
 
ETOILE(AT) 
 Q:AT'="*"
 S REFUSE=0,TAB(7)="*",ICC=7 D ^%VAFFICH
 S TAB(8)="*",ICC=8 D ^%VAFFICH
 Q
 
VAL(VAL) 
 N PRE
 S REFUSE=0,PRE=RESUL(ICC-1)
 I (((((((PRE="[[")!(PRE="]]"))!(PRE="]["))!(PRE="[]"))!(PRE="'[["))!(PRE="']]"))!(PRE="']["))!(PRE="'[]") G DBL
 Q:$$ADR^%QZNBN1(VAL)
 S RESUL(IC)=$TR(VAL,"""","")
 Q
DBL 
 N P,D
 S P=$P(VAL,","),D=$P(VAL,",",2),REFUSE=1
 I (P="")!(D="") D ^%VZEAVT($$^%QZCHW("Vous devez definir un intervalle de valeurs separees par une virgule")) Q
 I $$ADR^%QZNBN1(P)=0 D ^%VZEAVT($$^%QZCHW("Vous devez definir des valeurs numeriques")) Q
 I $$ADR^%QZNBN1(D)=0 D ^%VZEAVT($$^%QZCHW("Vous devez definir des valeurs numeriques")) Q
 S REFUSE=0
 Q
 
ATTR 
 S A=RESUL(IC) Q:A=""
 Q
 
ATR 
 N OLD,OLDB
 S OLD=RESUL(ICC),RESUL(ICC)=$$GETLBLAN^%VTLBLAN($P(OLD,"("))
 I OLD="" S REFUSE=0 Q
 D EXIOP^%LXUC5 Q:REFUSE
 D CHBKPT^%LXUC5 Q:REFUSE
 D FULL^%LXUC4 Q:REFUSE
 S OLDB=RESUL(ICC),REFUSE=1,TAB(ICC)=$J("",20),REFUSE=0 D ^%VAFFICH
 S REFUSE=1,TAB(ICC)=OLDB_$S($P(OLD,"(",2)="":"",1:" ("_$P(OLD,"(",2)),REFUSE=0 D ^%VAFFICH
 Q
 
EXPR(VAL) 
 I RESUL(ICC-1)="" D ^%VZEAVT($$^%QZCHW("Veuillez definir le champ attribut en premier")) S REFUSE=1 Q
 N V,SC
 
 D ^%VSAVMUL(SCR)
 S OICC=ICC,OSCR=SCR
 S SX=DX,SY=DY
 D INIT^%QWANA(SX,SY,1)
 S GANA=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"R")
 S GANA=$$CONCAS^%QZCHAD(GANA,RESUL(ICC-1))
 S NPAR=0,ICOUR=1
 S VAL=$$GETLBLAN^%VTLBLAN(VAL),V=VAL
 S RES=$$EXPR^%QWANA(V,GANA,"AFF^%QWSAR1")
 S REFUSE=('(RES))!(NPAR'=0)
 S SC=SCR D REST^%VRESMUL
 I REFUSE=0 X XY S TAB(ICC)=VAL D NORM^%VVIDEO,^%VAFFICH
 Q
 
AFF 
 S SCR=OSCR
 D ^%VRESMUL(SCR)
 D ^%VAFIGRI,^%VAFISCR
 S ICC=OICC Q
 
STOCK 
 N AR,%AR,EXPSIMP
 D ^%VAUTOST
 Q:ABENDSCR=1
 N A,B1,B2,C,C1,C2,V
 S GCOMP=$$CONCAS^%QZCHAD("^[QUI]RQSDON(""QW"",""C1"")",RESUL(3))
 S GCOMP=$$CONCAS^%QZCHAD(GCOMP,RESUL(4))
 S A=RESUL(6),@GCOMP@("P")=A
 S C=RESUL(7)
 S V=RESUL(8)
 I A="*" S @GCOMP@("C")=1 G C1
 I (((((C="=")!(C=">"))!(C="<"))!(C="'<"))!(C="'>"))!(C="'=") S @GCOMP@("C")="$$A1^%QWSTOL("_""""_A_""""_")"_C_""""_V_"""" G C1
 
 S C1=$S($E(C)="[":"'<",1:">"),C2=$S($E(C,2,2)="]":"'>",1:"<")
 S B1=$P(V,","),B2=$P(V,",",2)
 S @GCOMP@("C")="(($$A1^%QWSTOL("_""""_A_""""_")"_C1_""""_B1_""""_")&($$A1^%QWSTOL("_""""_A_""""_")"_C2_""""_B2_""""_"))"
C1 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 D ^%QCAGLC1(TEMP,GCOMP)
 S @GCOMP@("S")=$S(RESUL(5)="N":1,1:0)
 K @(TEMP)
 Q
 
KILL() 
 K @(m("OLDF")),@(m("OLDN")),^[QUI]RQSDON("QW","C1",RESUL(3),RESUL(4))
 
 K ^[QUI]RQSDON("QW","REM",1,RESUL(3),RESUL(4))
 Q 1

