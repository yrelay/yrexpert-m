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

;TOUCONT3^INT^1^59547,74876^0
TOUCONT3 ;
 
ABR 
EXIOP 
OPS S PARA=RESUL(IC),REFUSE=0 G:PARA=$$^%QZCHW("%MACHINE") FIN I $P(PARA,"'",2)=$$^%QZCHW("%MACHINE") S PARA=$P(PARA,"'",1)
 F OP="~","%","*",":","^","+","-","_","/","\","#","<",">","&","!","=","$","[","]" I PARA[OP G FORS
 G FIN
FORS D FORS^%LXUC5 I REFUSE>1 S STOPUC=1 G FIN
 D FORMUL^%LXUC5 Q:(STOPUC=1)!(REFUSE=1)  S STOPUC=1 G FIN
FULL Q:RESUL(IC)'["~"
 D FORMUL^%LXUC5 Q:(STOPUC=1)!(REFUSE=1)  S ICC=IC,TAB(ICC)=EXF D ^%VAFFICH S STOPUC=1 G FIN
FIN K TAB Q
AN I RESUL(IC)="" D ZD^%QMDATE4 S ICC=IC,TAB(ICC)=$P(%DAT,"/",3) D ^%VAFFICH G FIN
 S REFUSE=1 Q:$L(RESUL(IC))>2  S %PCH=RESUL(IC) D ^%QZNBN1 Q:'(ISNUM)  S ICC=IC,TAB(ICC)=$J("",$L(RESUL(IC))) D ^%VAFFICH S TAB(ICC)=%PCH+0 D ^%VAFFICH S REFUSE=0 G FIN
SEM I RESUL(IC)="" D ZD^%QMDATE4 S %PNS=%DAT D NSEM^%QMDATE4 S ICC=IC,TAB(ICC)=%RNS D ^%VAFFICH G FIN
 S REFUSE=1,%PCH=RESUL(IC) D ^%QZNBN1 Q:'(ISNUM)  Q:RESUL(IC)<1  Q:RESUL(IC)>53  S ICC=IC,TAB(ICC)=$J("",$L(RESUL(ICC))) D ^%VAFFICH S TAB(ICC)=%PCH+0 D ^%VAFFICH S REFUSE=0 G FIN
CHAR I RESUL(IC)="" S ICC=IC,TAB(IC)=0 D ^%VAFFICH G FIN
 S %PCH=RESUL(IC) D ^%QZNBN1 I '(ISNUM) S REFUSE=1 G FIN
 Q:'($D(^ORES($J,7)))  I RESUL(IC)>^ORES($J,7) D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Attention, la charge maxi est depassee...[RETURN]") R *RET:60 D POCLEPA^%VVIDEO
 G FIN
CAPA I RESUL(IC)="" S ICC=IC,TAB(IC)=0 D ^%VAFFICH G FIN
 S %PCH=RESUL(IC) D ^%QZNBN1 I '(ISNUM) S REFUSE=1 G FIN
 G FIN
DAT S OICC=RESUL(IC) D ^%VYDAT G FIN:REFUSE=1 I OICC="" K OICC D ^%QMDAK0 S DAAT=DAAT_$$^%QZCHW(" a ")_HEURE
 S ICC=IC,TAB(ICC)=DAAT D ^%VAFFICH G FIN
EXICAR S REFUSE=1,CC="""%~,;_$:'" F %U=1:1 S CI=$E(CC,%U) Q:CI=""  G:RESUL(IC)[CI FIN
 S REFUSE=0 G FIN

