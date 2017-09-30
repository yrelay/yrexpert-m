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

;%MZS01^INT^1^59547,73872^0
MOZS01(GAM) 
 
 
 
 
 
 
 K ^CONS($J),^DIM($J) G GOG
TOT(GAM) 
GOG K ^OPVU($J) D SAH^%QSGESTI($$GI^%MZQS,GAM,$$LIEN^%MZQS) S TB="^U($J,0)",NPH="",COM=0,LC="" D INIT,INIS
 K SOP S SOP=0,IDC="",NLI="",NM=0
LOP S NLI=$O(@TB@(NLI)) G:NLI="" FIN S LC=@TB@(NLI),TYP=$P(LC,"^",1)+0,LC=$P(LC,"^",2,999) S:TYP>3 TYP=3 G @TYP
0 G 3
1 K VAL,ATT I '($D(^TOR3($J,NLI))) G LOP
 D C(1) S SOP=5E-1,IDC="",NPH=ATT("NUMERO.OPERATION",1) G LOP
2 I ^TOR2($J,NLI)="" G LOP
 G 3:NPH="" D C(2) G 3:'($D(ATT("ACTION"))),3:ATT("ACTION",1)="",3:ATT("NUMERO.OPERATION",1)=""
 S SOP=$S($D(SOP(NPH)):SOP(NPH)+1,1:1),SOP(NPH)=SOP+1,OP=NPH_"."_$TR($J("",3-$L(SOP))," ",0)_SOP,IDC=ATT("ACTION",1)_"/"_OP
 S ^OPVU($J,OP)=IDC,^OPVU($J)=GAM
 D PA^%QSGESTI($$GI^%MZQS,GAM,$$LIEN^%MZQS,IDC,OP),PA^%QSGESTI($$OI^%MZQS,GAM_","_IDC,$$GE^%MZQS,GAM,1),PA^%QSGESTI($$OI^%MZQS,GAM_","_IDC,"NOM",IDC,1)
 S ATT="" F %U=1:1 S ATT=$O(ATT(ATT)) Q:ATT=""  S NOR="" F %U=1:1 S NOR=$O(ATT(ATT,NOR)) Q:NOR=""  D PA^%QSGESTI($$OI^%MZQS,GAM_","_IDC,ATT,$S((ATT["MACHINE")!(ATT["POSTE.MAIN"):$$M^%QAX(ATT(ATT,NOR)),1:ATT(ATT,NOR)),NOR)
 G LOP
3 G 31:IDC'="",LOP
31 I $E(LC)="*" S SOP=0,NPH="",IDC="" K ATT G LOP
 I $E(LC)=";" G LOP
 I '($D(NOR(IDC))) K NOR S NOR(IDC)=0
 S NOR=NOR(IDC)+1,NOR(IDC)=NOR D PA^%QSGESTI($$OI^%MZQS,GAM_","_IDC,"COMMENTAIRE",$$GETLBLAN^%VTLBLAN(LC),NOR) G LOP
C(I) 
 S %U="" F %V=1:1 S %U=$O(MOZ(I,%U)) Q:%U=""  S ATT=$P(MOZ(I,%U),"^",1),VAL=$$GETLBLAN^%VTLBLAN($P(LC,$C(1),%V)),NOR=$P(MOZ(I,%U),"^",2) S:NOR="" NOR=1 S ATT(ATT,NOR)=VAL
FIN D:$D(^CONS($J)) ATTS("^CONS($J)","CONSIGNE")
 D:$D(^DIM($J)) ATTS("^DIM($J)","DIMENSION.A.L.OUTIL")
 Q
ATTS(TB,ATT) 
 
 S NOPX300=""
 F %U=0:0 S NOPX300=$O(^OPVU($J,NOPX300)) Q:NOPX300=""  I $D(@TB@(^OPVU($J,NOPX300))) S IDFX300=^OPVU($J,NOPX300),%NTT="" F %U=0:0 S %NTT=$O(@TB@(IDFX300,%NTT)) Q:%NTT=""  D PA^%QSGESTI($$OI^%MZQS,^OPVU($J)_","_IDFX300,ATT,@TB@(IDFX300,%NTT),%NTT)
 K %NTT,NOPX300,IDFX300 Q
INIS K ^TOR3($J),^TOR2($J),^TOR1($J) S %NX300="",%IX300=0,NOP=""
T1 S %NX300=$O(@TB@(%NX300)) G:%NX300="" T2 S %LX300=@TB@(%NX300),%TX300=$P(%LX300,"^",1)+0
 I %TX300=1 S NOP=$$GETLBLAN^%VTLBLAN($P($P(%LX300,"^",2,999),$C(1),1)),%IX300=%IX300+1,^TOR1($J,%NX300)=NOP G T1
 I %TX300=2 S %VX300=$ZP(^TOR1($J,%NX300)),^TOR2($J,%NX300)=%VX300 S:%VX300'="" ^TOR3($J,%VX300,%NX300)=""
 G T1
T2 K %TX300,%VX300,%NX300,%LX300,%IX300 Q
INIT 
 S %TS="STAND" K MOZ D ADR^%QCAGLC("^MOZ(""GRILLE"",""TRAZOM"",""STAND""","MOZ")
 K ATT S LI="" F %U=1:1 S LI=$O(MOZ(LI)) Q:LI=""  S ATX300="" F %U=1:1 S ATX300=$O(MOZ(LI,ATX300)) Q:ATX300=""  S ATT($P(MOZ(LI,ATX300),"^",1))=ATX300
 K ATX300,LX300 Q

