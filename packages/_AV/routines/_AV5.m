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

;%AV5^INT^1^59547,73867^0
%AV5 ;;10:33 AM  20 Oct 1993
 
 
 
 
 
 
 
 
 
 S DEJAEXP=$$TEMP^%SGUTIL
 S @DEJAEXP@(0,"VV")=1,@DEJAEXP@(0,"RR")=""
 S GLOROUT=$$TEMP^%SGUTIL
 S @GLOROUT@("ACCES BASE")="$$qscalin^%AV5"
 S @GLOROUT@("INDIVIDU COURANT")="tcour^%AV5"
 S @GLOROUT@("PROXIMITE")="prox^%AV5"
 
 
 D UNEXP(GEXP,.VV,.RR)
 Q
UNEXP(GEXP,VV,RR) 
 
 S PILAND=$$TEMP^%SGUTIL
 D INIPILE^%AVUTI(PILAND)
 W /C(1,2),"   information traitee  "
 S PTR=0
loop S PTR=PTR+1
 G:'($D(@GEXP@(PTR))) FIN
 S TYPE=@GEXP@(PTR),VAL=@GEXP@(PTR,"VAL"),INFO=@GEXP@(PTR,"INFO")
 W /C(1,3),/EL,/C(1,3),PTR,?5,TYPE,?30,VAL R *x
 I TYPE["OPERATEUR" G OPERA
 I TYPE="VERBE" G VERBE
 I TYPE="AFFECTATION" G AFFECT
 
 D PUSH^%AVUTI(PILAND,VAL,"")
 G loop
 
OPERA 
 S NB=$P(TYPE,".",2)
 S NB=$S(NB="UNAIRE":1,NB="BINAIRE":2)
 
 K TV,TR
 F I=1:1:NB G:$$PILEVIDE^%AVUTI(PILAND) ERROR D PULL^%AVUTI(PILAND,.TVV,.TRR) S TV(I)=TVV,TR(I)=TRR
 
 
 D:VAL="$indeval" indeval
 D:VAL="$subex" subex
 D:VAL="$indice" indice
 D:VAL="^" chap
 D:"+-#_*"[VAL BINSTD
 D:VAL="'" NEGAT
 
 
 D PUSH^%AVUTI(PILAND,TVV,TRR) G loop
 
VERBE 
 S NB=$P(INFO,"/",4)
 
 K TV,TR
 F I=NB:-1:1 G:$$PILEVIDE^%AVUTI(PILAND) ERROR D PULL^%AVUTI(PILAND,.TVV,.TRR) S TV(I)=TVV,TR(I)=TRR
 
 
 K V
 S IREG=1,IARG=1
NXX G:'($D(TV(IARG))) CALLVRB
 S NATPAR=^%RQSGLO("MOTEUR","TRT","VERBE",VAL,"NATURE.PARAMETRE",IARG)
 G:NATPAR="ATT" PARATT
 
 S V(IREG)=TV(IARG),IREG=IREG+1,IARG=IARG+1 G NXX
 
 
 
 
PARATT S V(IREG)=$P(TR(IARG),$C(0),3),IREG=IREG+1
 S V(IREG)=$P(TR(IARG),$C(0),4),IREG=IREG+1
 S V(IREG)=$P(TR(IARG),$C(0),1),IREG=IREG+1
 S V(IREG)=$P(TR(IARG),$C(0),2),IREG=IREG+1
 S V(IREG)=TV(IARG),IREG=IREG+1
 S IARG=IARG+1 G NXX
 
CALLVRB 
 S ROUT=^%RQSGLO("MOTEUR","TRT","VERBE",VAL,"ADRESSE.DE.LA.ROUTINE",1)
 S @("RES="_ROUT_"(1,"_(IREG-1)_")")
 S TVV=RES,TRR=""
 
 D PUSH^%AVUTI(PILAND,TVV,TRR) G loop
 
 
FIN 
 
 I $$PILEVIDE^%AVUTI(PILAND) S ERROR=1 G ERROR
 D PULL^%AVUTI(PILAND,.VV,.RR)
 I '($$PILEVIDE^%AVUTI(PILAND)) S ERROR=1 G ERROR
 Q
 
ERROR Q
 
 
 
 
 
 
 
 
 
 
 
 
indeval N REP,IND
 I TV(1)="%courant" S ROUT=@GLOROUT@("INDIVIDU COURANT") D @(ROUT_"(.REP,.IND)") S TVV=REP_$C(0)_IND,TR="" Q
 S ROUT=@GLOROUT@("PROXIMITE") D @(ROUT_"(TV(1),.REP,.IND)") S TVV=REP_$C(0)_IND,TR="" Q
 
subex N NUMK
 S NUMK=$E(TV(1),2,$L(TV(1))-1)
 S TVV=@DEJAEXP@(NUMK,"VV"),TRR=@DEJAEXP@(NUMK,"RR")
 Q
indice S TVV=TV(2)_$C(0)_TV(1),TRR=TR(2)_$C(0)_TR(1) Q
 
chap N REP,IND,ATT,ORD
 S REP=$P(TV(2),$C(0)),IND=$P(TV(2),$C(0),2),ATT=$P(TV(1),$C(0)),ORD=$P(TV(1),$C(0),2)
 S ROUT=@GLOROUT@("ACCES BASE")
 S @("TVV="_ROUT_"(REP,IND,ATT,ORD)")
 S TRR=TV(2)_$C(0)_TV(1)
 Q
 
 
 
BINSTD S TVV=$C(0) S:(TV(1)'=$C(0))&(TV(2)'=$C(0)) @("TVV=TV(2)"_VAL_"TV(1)") S TRR="" Q
 
 
AFFECT 
 K TV,TR
 F I=2:-1:1 G:$$PILEVIDE^%AVUTI(PILAND) ERROR D PULL^%AVUTI(PILAND,.TVV,.TRR) S TV(I)=TVV,TR(I)=TRR
 S ROUT=@GLOROUT@("ECRITURE BASE")
 S @("TVV="_ROUT_"(TR(1),TV(2))")
 S TRR=TR(1)_$C(0)_TR(2)
 
 D PUSH^%AVUTI(PILAND,TVV,TRR) G loop
 
NEGAT G:$$PILEVIDE^%AVUTI(PILAND) ERROR
 D PULL^%AVUTI(PILAND,.TVV,.TRR)
 D PUSH^%AVUTI(PILAND,'(TVV),TRR) G loop
 
TEST 
 S GEXP="^TEST(1)"
 D ^%AV5
 Q
 
 
TEST2 S DEJAEXP=$$TEMP^%SGUTIL
 D CLEPAG^%VVIDEO
 S @DEJAEXP@(0,"VV")=1,@DEJAEXP@(0,"RR")=""
 S GLOROUT=$$TEMP^%SGUTIL
 S @GLOROUT@("ACCES BASE")="$$qscalin^%AV5"
 S @GLOROUT@("INDIVIDU COURANT")="tcour^%AV5"
 S @GLOROUT@("PROXIMITE")="prox^%AV5"
 S @GLOROUT@("ECRITURE BASE")="$$affect^%AV5"
 S ENSPOLO="^TEST(1)" G:$D(@ENSPOLO)<10 ACTI
 F III=1:1 Q:'($D(@ENSPOLO@(III)))  W /C(10,0),/AB,"expression ",III,/AA D UNEXP($$CONCAT^%QZCHAD(ENSPOLO,III),.VV,.RR) S @DEJAEXP@(III,"VV")=VV,@DEJAEXP@(III,"RR")=RR
 K @(DEJAEXP)
 W !,"resultat de la condition : ",VV
ACTI S ENSPOLO="^TEST(2)"
 S @DEJAEXP@(0,"VV")=1,@DEJAEXP@(0,"RR")=""
 F III=1:1 Q:'($D(@ENSPOLO@(III)))  W /C(10,0),/AB,"expression ",III,/AA D UNEXP($$CONCAT^%QZCHAD(ENSPOLO,III),.VV,.RR) S @DEJAEXP@(III,"VV")=VV,@DEJAEXP@(III,"RR")=RR
 W !,"resultat de l'action : ",VV
 K @(DEJAEXP)
 Q
 
qscalin(REP,IND,ATT,ORD) Q $$^%QSCALIN(REP,IND,ATT,ORD)
prox(VPCT,REP,IND) S REP=CXT(VPCT,"BASE"),IND=CXT(VPCT,"OBJET") Q
tcour(REP,IND) S REP="ARTICLE",IND="TEST" Q
affect(ADRESSE,VALEUR) 
 S REP=$P(ADRESSE,$C(0)),IND=$P(ADRESSE,$C(0),2),ATT=$P(ADRESSE,$C(0),3),ORD=$P(ADRESSE,$C(0),4)
 I $E(ATT)="%" D PA^%QSGESTI("%",$J,ATT,VALEUR,ORD) Q 1
 D PA^%QSGESTI(REP,IND,ATT,VALEUR,ORD) Q 1

