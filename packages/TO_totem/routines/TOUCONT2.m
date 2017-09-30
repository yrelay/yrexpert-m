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

;TOUCONT2^INT^1^59547,74876^0
TOUCONT2 ;
 
RESUM S REFUSE=0
 I RESUL(IC)'="?" G FIN
 I RESUL(IC-2)="" S REFUSE=1 G FIN
 S OICC=IC D CLEPAG^%VVIDEO S DXG=0,DXD=35,DYH=0,DYB=4,GRAPH=1,MSG=RESUL(IC-2) D TO4^%VZCD
 S DY=6,DX=0 X XY
 I '($D(^[QUI]EXPLICI(RESUL(IC-2)))) S DX=5 X XY W $$^%QZCHW("Desole ! Parametres explicites de "),RESUL(IC-2),$$^%QZCHW(" inconnus ! ") G RESUM1
 S NUM=-1 F UU=1:1 S NUM=$N(^[QUI]EXPLICI(RESUL(IC-2),NUM)) Q:NUM=-1  W ?((UU-1)#2)*40,$S(NUM<10:" ",1:""),NUM," ",$N(^[QUI]EXPLICI(RESUL(IC-2),NUM,-1)) I (UU#2)=0 W !
RESUM1 D POCLEPA^%VVIDEO W "[RETURN] " R *RET D ^%VAFIGRI,^%VAFISCR S (IC,ICC)=OICC,STOPUC=1,REFUSE=1 G FIN
FIN Q
LEX S REFUSE=0 G:RESUL(IC)="" FIN
 I RESUL(IC)["?" G LEXS
 I RESUL(IC)'[":" S REFUSE=2 G FIN
 G:RESUL(IC)'["""" FIN S RP=RESUL(IC-2) G:RP'[":" FIN S RP=$P(RP,":",2),%CAR="/",RS=RP D ^%QZCHNBC K COPT S %NBCAR=%NBCAR+1 F %7=1:1:%NBCAR S COPT(%7)=$P(RP,"/",%7)
 S RP1=$P(RESUL(IC),":",1)_":",RP=$P(RESUL(IC),":",2,500) F %7=1:1:%NBCAR S %71=$P(RP,"/",%7) I %71="""" S $P(RP,"/",%7)=COPT(%7)
 S ICC=IC,TAB(ICC)=RP1_RP K COPT,RS,%7,%71,RP,RP1 D ^%VAFFICH G FIN
LEXS S ART=$P(RESUL(IC),"?",1) I ART[":" S ART=$P(ART,":",1)
 I ART="" S REFUSE=1 G FIN
 S OICC=IC D CLEPAG^%VVIDEO S DXG=0,DXD=35,DYH=0,DYB=4,GRAPH=1,MSG=ART D TO4^%VZCD
 S DY=6,DX=0 X XY
 I $D(^[QUI]EXPLICI(ART)) G LIST
 I $D(^[QUI]ACOMMEB(ART)) S ART=$P(^[QUI]ACOMMEB(ART),"^",1) G LIST
 S DX=5 X XY W $$^%QZCHW("Desole ! Parametres explicites de "),ART,$$^%QZCHW(" inconnus ! ") G RESUM1
LIST S NUM=-1 F UU=1:1 S NUM=$N(^[QUI]EXPLICI(ART,NUM)) Q:NUM=-1  W ?((UU-1)#2)*40,$S(NUM<10:" ",1:""),NUM," ",$N(^[QUI]EXPLICI(ART,NUM,-1)) I (UU#2)=0 W !
 G RESUM1
ISNUM S REFUSE=0 I RESUL(IC)="" S REFUSE=1 G FIN
 S PCH=RESUL(ICC) D TO^%QZNBN1 I '(ISNUM) S REFUSE=1 G FIN
 G FIN
NUDIM S %IT2=5 G NUDIM3
NUDIM1 S %IT2=3 G NUDIM3
NUDIM2 S %IT2=1
NUDIM3 S REFUSE=1,%RE="" F %IT=1:1:%IT2 G:'($D(RESUL(%IT))) FNUD G:RESUL(%IT)="" FNUD S %RE=%RE_$S(%RE="":"",1:",")_""""_RESUL(%IT)_""""
 I RESUL(IC)=$$^%QZCHW("SINON") S REFUSE=0 G FNUD
NUDIM4 S %TB=NOMTAB_"("_%RE_")",REFUSE=0 I '($D(@%TB)) S ICC=IC,TAB(IC)=1 D ^%VAFFICH G FNUD
 S (%ITR,%IT)=-1 F %ITT=1:1 S %IT=$N(@%TB@(%IT)) Q:%IT=-1  S %ITR=%IT
 S ICC=IC,TAB(IC)=$S(%ITR=-1:1,1:%ITR+1) D ^%VAFFICH
FNUD K %IT,TAB,%ITT,%ITR,%RE,%TB G FIN
NUMAC S REFUSE=1,%RE=""""_RESUL(1)_"""" G NUDIM4
VID S REFUSE=0 G:RESUL(IC)'="" FIN
 I RESUL(IC-1)="" S REFUSE=1 G FIN
 S RESUL(IC)=RESUL(IC-1) G FIN
NCLICH S REFUSE=1 G:%AJCMS'=$$^%QZCHW("Ajout") FIN D ^TOP0CPOP S RESUL(IC)=NCLICH,REFUSE=0 G FIN
NUFIPF S REFUSE=1,%RE=NR G:'($D(RESUL(1))) FNUD G:RESUL(1)="" FNUD S %RE=%RE_","_""""_RESUL(1)_""""
 S %TB=NOMTAB_"("_%RE_")",REFUSE=0 I '($D(@%TB)) S ICC=IC,TAB(IC)=1 D ^%VAFFICH G FNUD
 S (%ITR,%IT)=-1 F %ITT=1:1 S %IT=$N(@%TB@(%IT)) Q:%IT=-1  S %ITR=%IT
 S ICC=IC,TAB(IC)=$S(%ITR=-1:1,1:%ITR+1) D ^%VAFFICH G FNUD
NOMOD S ICC=IC,TAB(ICC)=^OABRES($I,ICC) D ^%VAFFICH G FIN
NUDIM5 S %RE=""""_$I_"""" G NUDIM4
NUM S PCH=RESUL(IC) D TO^%QZNBN1 S REFUSE='(ISNUM) G FIN
OBDOL S REFUSE=0 G:$E(RESUL(IC),1)="$" FIN S (STOPUC,REFUSE)=1 G FIN
ACT S REFUSE=1 Q:RESUL(IC)=""  I RESUL(IC)["?" D POCLEPA^%VVIDEO W $$^%QZCHW("(E)phemere, (P)ermanent  [RETURN] ") R *X:30 D POCLEPA^%VVIDEO G FIN
 G:($E(RESUL(IC),1)'=$$^%QZCHW("E"))&($E(RESUL(IC),1)'=$$^%QZCHW("P")) FIN S ICC=IC,TAB(ICC)=$S($E(RESUL(IC),1)=$$^%QZCHW("E"):$$^%QZCHW("EPHEMERE"),1:$$^%QZCHW("PERMANENT")),REFUSE=0 D ^%VAFFICH G FIN

