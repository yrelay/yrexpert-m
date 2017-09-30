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

;%DLPARAM^INT^1^59547,73868^0
DLPARAM(TYPE) 
 
 
 
 
 
 
 
 
 N RESUL,CTR,STO
 
 S STO=$$CONCAS^%QZCHAD("^[QUI]RQSGLO(""JALON"")",TYPE)
 
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Definition des parametres au niveau")_" "_$$^%QZCHW($S(TYPE="SYS":"SYSTEME",1:"APPLICATIF")),0)
 I TYPE="APP",'($D(^[QUI]RQSGLO("JALON","SYS"))) D ^%VZEAVT($$^%QZCHW("Les parametres au niveau SYSTEME n'ont pas ete definis")) Q
 
 I $D(@STO) D CHARG
 D AFF1^%VACTGRQ("DLPARAM",.RESUL,.CTR)
 I CTR="A" Q
 D SAUV
 Q
 
CHARG 
 S RESUL(1)=@STO@("DEC")
 S RESUL(2)=@STO@("TYPDEC")
 S RESUL(3)=@STO@("COEF.INF")
 S RESUL(4)=@STO@("COEF.SUP")
 S RESUL(5)=@STO@("MAX.ITER")
 Q
 
SAUV 
 S @STO@("DEC")=RESUL(1)
 S @STO@("TYPDEC")=RESUL(2)
 S @STO@("COEF.INF")=RESUL(3)
 S @STO@("COEF.SUP")=RESUL(4)
 S @STO@("MAX.ITER")=RESUL(5)
 I TYPE="APP" Q
 N APP
 S APP=$$CONCAS^%QZCHAD("^[QUI]RQSGLO(""JALON"")","APP")
 S @APP@("DEC")=RESUL(1)
 S @APP@("TYPDEC")=RESUL(2)
 S @APP@("COEF.INF")=RESUL(3)
 S @APP@("COEF.SUP")=RESUL(4)
 S @APP@("MAX.ITER")=RESUL(5)
 Q
 
STAND N RESUL,STO,TYPE
 S RESUL(1)="OUI/NON",RESUL(2)="C/R",RESUL(3)=1,RESUL(4)=100,RESUL(5)=200
 S TYPE="SYS"
 S STO=$$CONCAS^%QZCHAD("^[QUI]RQSGLO(""JALON"")",TYPE)
 G SAUV
 
 
 
DEC 
 N DEC,P,NON,NONM,OUI,OUIM
 I TYPE="SYS" S DEC=""
 E  S DEC=^[QUI]RQSGLO("JALON","SYS","DEC")
 
 I RESUL(ICC)="" S TAB(ICC)=$S(TYPE="SYS":$$^%QZCHW("NON"),1:DEC) G FDE
 S P=$E(RESUL(ICC),1)
 
 I (P="?")&(TYPE="SYS") D ^%VZEAVT("Reponse possible : OUI ou NON ou OUI/NON") S REFUSE=1 Q
 S (REFUSE,STOPUC)=0
 S OUI=$$^%QZCHW("oui"),OUIM=$$^%QZCHW("OUI")
 S NON=$$^%QZCHW("non"),NONM=$$^%QZCHW("NON")
 I RESUL(ICC)["/" G DEC2
 I (P=$E(OUI))!(P=$E(OUIM)) D AFFI(0) S TAB(ICC)=OUIM G FDE
 I (P=$E(NON))!(P=$E(NONM)) D AFFI(0) S TAB(ICC)=NONM G FDE
DEC2 S (REFUSE,STOPUC)='(RESUL(ICC)=(OUIM_"/"_NONM))
 I REFUSE=1 Q
FDE D ^%VAFFICH
 
 I TYPE="APP",DEC'="OUI/NON" D AFFI(0) S TAB(ICC)=DEC D ^%VAFFICH
 F I=ICC+1:1:ICC+4 S PATOUCH(I)=RESUL(ICC)="NON" I PATOUCH(I)=1 D AFFI(I-ICC)
 Q
 
TYPDEC 
 N TYPD
 I TYPE="SYS" S TYPD=""
 E  S TYPD=^[QUI]RQSGLO("JALON","SYS","TYPDEC")
 I RESUL(ICC)="?" D ^%VZEAVT("Reponse possible : C ou R ou CR ou composition des 3 precedentes reponses separees par un /") S REFUSE=1 Q
 
 D PARTIE(RESUL(ICC),TYPD,.RES,.MSG)
 I MSG'="" D ^%VZEAVT(MSG)
 I RES="" S (REFUSE,STOPUC)=1 Q
 D AFFI(0)
 S TAB(ICC)=RES D ^%VAFFICH
 
 F I=ICC+1:1:ICC+3 S PATOUCH(I)=""
 I RESUL(ICC)="C" S PATOUCH(ICC+3)=1 D AFFI(3) Q
 I RESUL(ICC)="R" S PATOUCH(ICC+1)=1 D AFFI(1) S PATOUCH(ICC+2)=1 D AFFI(2) Q
 Q
 
PARTIE(CONT,PERM,RES,MSG) 
 N I,LP,N,NB,PA,LPS
 S MSG=""
 I CONT="" S RES=$S(PERM="":"C",1:PERM) Q
 S (N,NB)=0,RES=""
 I PERM="" G PAR
 F I=1:1 S PA=$P(PERM,"/",I) Q:PA=""  S LPS(PA)=""
PAR S N=N+1
 S PA=$P(CONT,"/",N)
 I PA="" G FPAR
 I ((PA'="C")&(PA'="R"))&(PA'="CR") S MSG=PA_" "_$$^%QZCHW("est un type inconnu") Q
 I $D(LP(PA)) G PAR
 I PERM'="",'($D(LPS(PA))) S MSG=PA_" "_$$^%QZCHW("est un type non permis"),RES=PERM Q
 S NB=NB+1,LP(PA)=NB
 G PAR
FPAR 
 S RES=$TR($J("",NB)," ","/")
 S PA=""
 F I=1:1:NB S PA=$O(LP(PA)),$P(RES,"/",LP(PA))=PA
 S RES=$P(RES,"/",1,$L(RES,"/")-1)
 Q
 
AFFI(NB) 
 S ICC=ICC+NB
 S TAB(ICC)=$J("",20) D ^%VAFFICH
 S TAB(ICC)="" D ^%VAFFICH
 S ICC=ICC-NB
 Q
 
COEF(COEF) 
 N BORI,BORS
 S BORI=$P(COEF,"^"),BORS=$P(COEF,"^",2)
 S (REFUSE,STOPUC)=1
 I $$NUM^%DLETUC(RESUL(ICC))=0 Q
 
 I BORI="" D ^%VZEAVT($$^%QZCHW("Veuillez definir la borne inferieure en premier")) Q
 I (BORI="")!(BORS="") G FCOEF
 
 I BORI>BORS D ^%VZEAVT($$^%QZCHW("la borne superieure doit etre > a la borne inferieure")) Q
FCOEF I TYPE="SYS" S (REFUSE,STOPUC)=0 Q
 
 N BS,BI
 S BI=^[QUI]RQSGLO("JALON","SYS","COEF.INF")
 S BS=^[QUI]RQSGLO("JALON","SYS","COEF.SUP")
 I BORI'="",BORI<BI D ^%VZEAVT($$^%QZCHW("la borne est inferieure a celle permise")_" ("_BI_")") Q
 I BORS'="",BORS>BS D ^%VZEAVT($$^%QZCHW("la borne est superieure a celle permise")_" ("_BS_")") Q
 S (REFUSE,STOPUC)=0
 Q
 
ITER 
 I $$NUM^%DLETUC(RESUL(ICC))=0 S (REFUSE,STOPUC)=1 Q
 I TYPE="SYS" Q
 
 S (REFUSE,STOPUC)=^[QUI]RQSGLO("JALON","SYS","MAX.ITER")<RESUL(ICC)
 Q
 
VERDEC(DEC) 
 N M,DECA
 S DECA=^[QUI]RQSGLO("JALON","APP","DEC")
 I DECA="OUI/NON" Q ""
 I DEC'=DECA S DEC=DECA,M=$$^%QZCHW("le decalage doit etre egal a")_" "_DECA Q M
 Q ""
 
VERCOEF(COEF) 
 N M,CI,CS
 I $$NUM^%DLETUC(COEF)=0 S M=$$^%QZCHW("Coefficient non numerique") Q M
 S CI=^[QUI]RQSGLO("JALON","APP","COEF.INF"),CS=^[QUI]RQSGLO("JALON","APP","COEF.SUP")
 I (COEF>CS)!(COEF<CI) S M=$$^%QZCHW("coefficient non compris entre")_" "_CI_" et "_CS Q M
 Q ""
 
VERITER(ITER) 
 N M,NB
 I $$NUM^%DLETUC(ITER)=0 S M=$$^%QZCHW("nbre d'iterations non numerique") Q M
 S NB=^[QUI]RQSGLO("JALON","APP","MAX.ITER")
 I ITER>NB S M=$$^%QZCHW("nbre d'iterations")_" > "_NB_" ("_$$^%QZCHW("nbre maximum permis")_")" Q M
 Q ""

