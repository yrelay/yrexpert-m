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

;TONGIVBL^INT^1^59547,74873^0
TONGIVBL ;
 
PHAS D GOG,GLMX S COUTOT=0,DURTOT=0,DURPTO=0
 S HPN=-1 F UU=0:0 S HPN=$N(^[USER]PHAS(INUFA,NUREF,HPN)) Q:HPN=-1  S AHPN=HPN D NET,SUIT
 G COUT
SUIT S PQ=^[USER]PHAS(INUFA,NUREF,HPN),PQ1=$P(PQ,"/",1),OG1=$P(PQ,"/",2),PH1=$S($D(^PHASY($I,OG1)):$P(^PHASY($I,OG1),"|",1),1:"?") G:TBL="OP" FIN
 S ^[QUI]PHAS(GNUFA,GTWREF,GOG_"."_AHPN)=PQ1_"/"_GOG_"."_AHPN,^[QUI]RAISON(GNUFA,GTWREF,GOG_"."_AHPN)=INUFA_"|"_$S($D(^[USER]RAISON(INUFA,NUREF,HPN)):^[USER]RAISON(INUFA,NUREF,HPN),1:"")
 S ^PHASADM($I,GNUFA,GTWREF,"PHAS","OK",PH1,PQ1)=GOG_"."_AHPN K ^TENTATIV($I,GNUFA,GTWREF,"PHAS",PH1,PQ1)
 I $D(^[USER]ORDEVAL(INUFA,NUREF,"PHAS",HPN)) S ^[QUI]ORDEVAL(GNUFA,GTWREF,"PHAS",GOG_"."_AHPN)=^[USER]ORDEVAL(INUFA,NUREF,"PHAS",HPN)_"^"_INUFA_"^"_NUREF_"^"_USER_"^"_$S($D(^[USER]RAISON(INUFA,NUREF,HPN)):^[USER]RAISON(INUFA,NUREF,HPN),1:"???")
 I $D(^[USER]RAISON(INUFA,NUREF,PQ)) S ^[QUI]RAISON(GNUFA,GTWREF,PQ1_"/"_GOG_"."_AHPN)=INUFA_"|"_^[USER]RAISON(INUFA,NUREF,PQ)_"|"_USER
 G FIN
COUT S HPN=-1 F UU=0:0 S HPN=$N(^[USER]COUT(INUFA,NUREF,HPN)) Q:HPN=-1  S AHPN=$P(HPN,"/",2) D NET S COUTOT=COUTOT+^[USER]COUT(INUFA,NUREF,HPN) I TBL'="OP" S ^[QUI]COUT(GNUFA,GTWREF,$P(HPN,"/",1)_"/"_GOG_"."_AHPN)=^[USER]COUT(INUFA,NUREF,HPN)
DUREE S HPN=-1,TDU="^[USER]DUREE(INUFA,NUREF)"
 F UU=0:0 S HPN=$N(@TDU@(HPN)) Q:HPN=-1  S AHPN=$P(HPN,"/",2) D NET S DUR=@TDU@(HPN),DURTOT=DURTOT+$P(DUR,"^",2),DURPTO=DURPTO+$P(DUR,"^",1) I TBL'="OP" S ^[QUI]DUREE(GNUFA,GTWREF,$P(HPN,"/",1)_"/"_GOG_"."_AHPN)=DUR
 
 S HPN=-1,TDU="^[USER]CARATPC(INUFA,NUREF)"
 F UU=0:0 S HPN=$N(@TDU@(HPN)) Q:HPN=-1  S AHPN=$P(HPN,"/",2) D NET S %DXX="" F %DXX2=0:0 S %DXX=$O(@TDU@(HPN,%DXX)) Q:%DXX=""  S DUR=@TDU@(HPN,%DXX) I TBL'="OP" S ^[QUI]CARATPC(GNUFA,GTWREF,$P(HPN,"/",1)_"/"_GOG_"."_AHPN,%DXX)=DUR
 
 G:TBL="OP" FIN
SECT S HPN=-1,IGTB="^[USER]SECT(INUFA,NUREF)"
 F UU=0:0 S HPN=$N(@IGTB@(HPN)) Q:HPN=-1  S GS=@IGTB@(HPN),AHPN=$P(HPN,"/",2) D NET S ^[QUI]SECT(GNUFA,GTWREF,$P(HPN,"/",1)_"/"_GOG_"."_AHPN)=GS,^PHASADM($I,GNUFA,GTWREF,"MAC","OK",GS,PQ1,PH1)=GOG_"."_AHPN
DIM S HPN=-1
 F UU=0:0 S HPN=$N(^[USER]DIM(INUFA,NUREF,HPN)) Q:HPN=-1  S AHPN=$P(HPN,"/",2) D NET S NW=-1 F VV=0:0 S NW=$N(^[USER]DIM(INUFA,NUREF,HPN,NW)) Q:NW=-1  S ^[QUI]DIM(GNUFA,GTWREF,$P(HPN,"/",1)_"/"_GOG_"."_AHPN,NW)=^[USER]DIM(INUFA,NUREF,HPN,NW)
CONS S HPN=-1
 F UU=0:0 S HPN=$N(^[USER]CONS(INUFA,NUREF,HPN)) Q:HPN=-1  S AHPN=$P(HPN,"/",2) D NET,CONS1
 G FIN
CONS1 S ^[QUI]CONS(GNUFA,GTWREF,$P(HPN,"/",1)_"/"_GOG_"."_AHPN)=^[USER]CONS(INUFA,NUREF,HPN)
 I $D(^[USER]RAISON(INUFA,NUREF,HPN)) S ^[QUI]RAISON(GNUFA,GTWREF,$P(HPN,"/",1)_"/"_GOG_"."_AHPN)=INUFA_"|"_^[USER]RAISON(INUFA,NUREF,HPN)
FIN Q
NET S LS=LMX-$L(AHPN) F IG=1:1:LS S AHPN=0_AHPN
 K LS,IG
DNET I $E(AHPN,$L(AHPN))'=0 G FIN
 S AHPN=$E(AHPN,1,$L(AHPN)-1) G DNET
GOG K ^PHASY($I) S AY=$P(@("^[USER]TREEWORK("""_INUFA_""","_NUREF_")"),"^",1),TAY="^[USER]PHASE(AY)"
 S QP=-1 F %U=0:0 S QP=$N(@TAY@(QP)) Q:QP=-1  S QG=-1 F %U=0:0 S QG=$N(@TAY@(QP,QG)) Q:QG=-1  S QO=-1 F %U=0:0 S QO=$N(@TAY@(QP,QG,QO)) Q:QO=-1  S ^PHASY($I,QG)=QP_"|"_QO
 K AY,TAY,QP,QG,QO,%U Q
GLMX S HPN=-1,LMX=0 F UU=1:1 S HPN=$N(^[USER]PHAS(INUFA,NUREF,HPN)) Q:HPN=-1  S LMX=$S($L(HPN)>LMX:$L(HPN),1:LMX)
 Q

