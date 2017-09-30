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

;%MZS02^INT^1^59547,73872^0
MOZS02(GAM) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N CPTOP,NOPS,NBRPT,REP
INT I '($D(^MOZTRAIT($J))) D CLEPAG^%VVIDEO,^%VZCD0($E(GAM,1,40))
 
 
 S CPTOP=0
 S TOP="^OP($J)" K @(TOP) D LISTE^%QSCALVA($$GI^%MZQS,GAM,$$LIEN^%MZQS,TOP)
 G DEB:@TOP=0
 G DEB:$$^%QCAZG("%AJM")="A"
 G:$D(^MOZTRAIT($J)) DEB
CHOIX S DX=1,DY=8 X XY S REP=$$MES^%VZEOUI("Voulez-vous la gamme complete ? ","O") I REP=1 G DEB
 I REP=-1 G CHOIX
 G SELECT
DEB S TTI="^TI($J)" K @(TTI),^IND($J) D:'($D(^MOZTRAIT($J))) ^%VZEATT D RQS G SUI
RQS S NOR=""
 F %U=1:1 S NOR=$O(@TOP@(NOR)) Q:NOR=""  S OP=@TOP@(NOR),NOP=$P(OP,"/",2),^IND($J)=(NOP#1)*1000 D NOPER S @TTI@(NOP,^IND($J),1)=$C(1)_OP,^IND($J,NOP,^IND($J))=2
 Q
SUI K ^U($J),^V($J) D INIT^%MZMAJ S OP="",NLU=1
LOP K ^TS5($J) S OP=$O(@TTI@(OP)) G:OP="" FIN S SOP=""
LSO K ^TSP($J) S SOP=$O(@TTI@(OP,SOP)) G:SOP="" LOP S ^IND($J)=""
LIN S ^IND($J)=$O(@TTI@(OP,SOP,^IND($J))) G:^IND($J)="" LSO S LC=@TTI@(OP,SOP,^IND($J))
 I $E(LC)=$C(2) D POP($E(LC,2),$P(LC,"^",2,999)) G LIN
 I $E(LC)'=$C(1) D POP(3,LC) G LIN
 K ATT S %OP=$P(LC,$C(1),2,999),IDF=GAM_","_$P(LC,$C(1),2,999),RF=""
 S %N=$$^%QSCALVA($$OI^%MZQS,IDF,"NUMERO.OPERATION"),%AC=$$^%QSCALVA($$OI^%MZQS,IDF,"ACTION") D:%N="" PA^%QSGESTI($$OI^%MZQS,IDF,"NUMERO.OPERATION",$P(%OP,"/",2),1) D:%AC="" PA^%QSGESTI($$OI^%MZQS,IDF,"ACTION",$P(%OP,"/",1),1)
 K %CH
 F %U=1,2 S %CH(%U)="",%V="" F %W=1:1 S %V=$O(MOZ(%U,%V)) Q:%V=""  S %X=MOZ(%U,%V),NOR=$P(%X,"^",2),%PS=$P(%X,"^",3),%X=$P(%X,"^",1) S:NOR="" NOR=1 S %CH(%U)=%CH(%U)_$J("",(%PS-$L(%CH(%U)))-2)_" "_$$SYN_$C(1) D:%U=1 RF
 
 G:$D(@("^V($J,"_RF_")")) OPS S @("^V($J,"_RF_")")=1 D POP(1,%CH(1))
 I $D(^TS5($J)) S NB="" F %U=1:1 S NB=$O(^TS5($J,NB)) Q:NB=""  D POP(3,^TS5($J,NB))
 I $D(^TSP($J)) S NB="" F %U=1:1 S NB=$O(^TSP($J,NB)) Q:NB=""  D POP(3,^TSP($J,NB))
 K ^TSP($J),^TS5($J)
OPS D POP(2,%CH(2)) K ^COM($J) D LISTE^%QSCALVA($$OI^%MZQS,IDF,"COMMENTAIRE","^COM($J)") S %V="" F %U=1:1 S %V=$O(^COM($J,%V)) Q:%V=""  D POP(3,^COM($J,%V))
 G LIN
RF S VAL418A=$$GET^%QSCALIN($$OI^%MZQS,IDF,%X,NOR) S:VAL418A="" VAL418A=0
 S RF=RF_$S(RF="":"",1:",")_""""_VAL418A_"""" K VAL418A Q
POP(T,I) 
 I ^IND($J)=0 S NB=$S(($D(^TSP($J))#10)=1:^TSP($J),1:1),^TSP($J,NB)=I,^TSP($J)=NB+1 G FOP
 I SOP=5E-1 S NB=$S(($D(^TS5($J))#10)=1:^TS5($J),1:1),^TS5($J,NB)=I,^TS5($J)=NB+1 G FOP
 S ^U($J,0,NLU)=T_"^"_I,^U($J,0,NLU,0)=$ZP(^U($J,0,NLU))+0,NLU=NLU+1
FOP Q
FIN S ^U($J,0,NLU)=3_"^",^U($J,0,NLU,0)=$ZP(^U($J,0,NLU))+0,NLU=NLU+1
 D:'($D(^MOZTRAIT($J))) CLEPAG^%VVIDEO
 
 
 Q
NOPER 
 S NBRPT=$L(NOP,".")
 S NOPS=$P(NOP,".",2,NBRPT-1)
 S NOP=NOP\1,NOP=$S(NOPS'="":NOP_"."_NOPS,1:NOP)
 I NBRPT<3 S CPTOP=1 Q
 S IND($J)=CPTOP+1 Q
SYN() 
 I ((%X'["MACHINE")&(%X'="POSTE.MAIN"))&(%X'="OUTIL") Q $$GET^%QSCALIN($$OI^%MZQS,IDF,%X,NOR)
 Q $$S^%QAX($$GET^%QSCALIN($$OI^%MZQS,IDF,%X,NOR))
SELECT 
 N OP1,OP2,OP3,OP4,INF,SUP,GUN S GUN="^GUN($J)" K @(GUN)
 S OP3=""
SELECT0 S OP3=$O(@TOP@(OP3)) G:OP3="" SELECT1 S OP4=OP3\1
 I '($D(@GUN@(OP4))) S @GUN@(OP4)=""
 G SELECT0
SELECT1 S DX=0,DY=10 X XY W "Selection de :"
 S DX=20,DY=10 X XY W "1ere operation :"
 D INIT^%QUCHOIP(GUN,1,"",20,11,16,11),AFF^%QUCHOIP S OP1=$$UN^%QUCHOIP D END^%QUCHOIP G:OP1="" INT
 S DX=40,DY=10 X XY W "2eme operation :"
 D INIT^%QUCHOIP(GUN,1,"",40,11,16,11),AFF^%QUCHOIP S OP2=$$UN^%QUCHOIP D END^%QUCHOIP G:OP1="" INT
 I OP1'>OP2 S INF=OP1,SUP=OP2
 I OP1'<OP2 S INF=OP2,SUP=OP1
 S OP3=""
SELECT2 S OP3=$O(@TOP@(OP3)) G:OP3="" SELECT3 S OP4=OP3\1
 I (OP4<INF)!(OP4>SUP) K @TOP@(OP3)
 G SELECT2
SELECT3 K @(GUN) G DEB

