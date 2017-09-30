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

;%PSSAOP1^INT^1^59547,73874^0
%PSSAOP1(DOM,OPE) ;;01:02 PM  11 Dec 1991;
 
 
 
 
 N C,I,L1,L2,L3,TEMP,DEF,MEN,CONTR,ADRES,PRD,TRT,STO
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T") K @(TEMP)
 S DEF=$$CONCAS^%QZCHAD(TEMP,"DEF")
 S MEN=$$CONCAS^%QZCHAD(TEMP,"MEN")
 S STO=$$CONCAS^%QZCHAD(TEMP,"STO")
 S @DEF@("DOM")=DOM,@DEF@("OPE")=OPE,@DEF@("MODT")=0,@DEF@("MODP")=0
 S (L1,L2,L3)=1
 S TRT=$$^%QSCALIN("OPERATEUR",DOM_","_OPE,"TRAITEMENT","PROLOGUE") S:TRT'="" @STO@(1,1)=TRT
 F I=1:1 S PRD=$$^%QSCALIN("OPERATEUR",DOM_","_OPE,"PREDICAT",I) Q:PRD=""  S @STO@(2,I)=PRD
 F I=1:1 S TRT=$$^%QSCALIN("OPERATEUR",DOM_","_OPE,"TRAITEMENT",I) Q:TRT=""  S @STO@(3,I)=TRT
 S @MEN="22^10^79"
 S @MEN@(1)=$$^%QZCHW("prologue")_"^PROL",@MEN@(1,"COM")=$$^%QZCHW("traitement a activer avant l'evaluation des predicats")
 S @MEN@(2)=$$^%QZCHW("conditions")_"^COND",@MEN@(2,"COM")=$$^%QZCHW("Predicats conditions d'application de l'operateur")
 S @MEN@(3)=$$^%QZCHW("actions")_"^ACTI",@MEN@(3,"COM")=$$^%QZCHW("traitements de l'operateur")
 S @MEN@(4)=$$^%QZCHW("predicats")_"^PRED",@MEN@(4,"COM")=$$^%QZCHW("acces a la gestion des  predicats ")
 S @MEN@(5)=$$^%QZCHW("traitements")_"^TRAI",@MEN@(5,"COM")=$$^%QZCHW("acces a la gestion des  traitements ")
 
 D CLEPAG^%VVIDEO
 D REAFFI
LL S DX=0,DY=21 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,23,MEN,.ADRES,.CONTR)
 I (CONTR="A")!(CONTR="F") G FIN
 I ADRES'="" G @ADRES
 D ^%VSQUEAK G LL
 
FIN G:'(@DEF@("MODT")) FIN2
 D PSV^%QSGESTI("OPERATEUR",DOM_","_OPE,"TRAITEMENT")
 D PA^%QSGESTI("OPERATEUR",DOM_","_OPE,"TRAITEMENT",@STO@(1,1),"PROLOGUE")
 F I=1:1 Q:'($D(@STO@(3,I)))  D PA^%QSGESTI("OPERATEUR",DOM_","_OPE,"TRAITEMENT",@STO@(3,I),I)
FIN2 G:'(@DEF@("MODP")) FIN3
 D PSV^%QSGESTI("OPERATEUR",DOM_","_OPE,"PREDICAT")
 F I=1:1 Q:'($D(@STO@(2,I)))  D PA^%QSGESTI("OPERATEUR",DOM_","_OPE,"PREDICAT",@STO@(2,I),I)
FIN3 K @(TEMP)
 Q
 
 
PROL D ^%QULIMO(0,3,80,4,$$CONCAS^%QZCHAD(STO,1),.L1,"ADDACTI^%PSSAOP1","SUPACTI^%PSSAOP1") G LL
 
 
COND D ^%QULIMO(0,7,80,5,$$CONCAS^%QZCHAD(STO,2),.L2,"ADDCOND^%PSSAOP1","SUPCOND^%PSSAOP1") G LL
 
 
ACTI D ^%QULIMO(0,12,80,8,$$CONCAS^%QZCHAD(STO,3),.L3,"ADDACTI^%PSSAOP1","SUPACTI^%PSSAOP1") G LL
 
 
REAFFI D CLEPAG^%VVIDEO,CADR
 D REAFF^%QULIMO3(1,1,$$CONCAS^%QZCHAD(STO,1),0,3,80,4)
 D REAFF^%QULIMO3(1,1,$$CONCAS^%QZCHAD(STO,2),0,7,80,5)
 D REAFF^%QULIMO3(1,1,$$CONCAS^%QZCHAD(STO,3),0,12,80,8)
 Q
 
CADR D ^%VZCD(0,79,0,2,0,0,OPE)
 D CARSP^%VVIDEO(0,3,4,80,0)
 S DX=38,DY=3 X XY W $$^%QZCHW(" Traitement prologue ")
 D CARSP^%VVIDEO(0,7,5,80,0)
 S DX=38,DY=7 X XY W $$^%QZCHW(" Predicats d'application ")
 D CARSP^%VVIDEO(0,12,8,80,0)
 S DX=38,DY=12 X XY W $$^%QZCHW(" Traitements de l'operateur ")
 Q
 
 
ADDACTI N TEMP,DEF S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T"),DEF=$$CONCAS^%QZCHAD(TEMP,"DEF"),@DEF@("MODT")=1
 S OK=1 Q
 
 
SUPACTI N TEMP,DEF S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T"),DEF=$$CONCAS^%QZCHAD(TEMP,"DEF"),@DEF@("MODT")=1
 S OK=1 Q
 
 
ADDCOND N POSIT,RA,SAVY1,SX,SY
 N TEMP,DEF S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T"),DEF=$$CONCAS^%QZCHAD(TEMP,"DEF"),@DEF@("MODP")=1
 S SAVY1=Y1,SX=DX,SY=DY,(POSIT,P)=1,PRED=Y1
 I PRED="?" S PRED=$$CHOIX^%PSPRSA D REAFFI G:PRED="" CONDNOK
 I $$EXIPRED^%PSPRGES(PRED) G CONDOK
 D ^%VZEAVT("predicat inconnu")
 I $$CONFIRM^%VZEOUI("creation ?") D ^%PSPRSA1(PRED,3,5) G CONDOK
CONDNOK S Y1=SAVY1,DX=SX,DY=SY,OK=0 D ^%VSQUEAK Q
CONDOK S Y1=PRED,DX=SX,DY=SY,OK=1 Q
 
 
SUPCOND N TEMP,DEF S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T"),DEF=$$CONCAS^%QZCHAD(TEMP,"DEF"),@DEF@("MODP")=1
 S OK=1 Q
 
 
TRAI D ^%TLMENUG G LL
 
 
PRED D ^%PSPRSA G LL

