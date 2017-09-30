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
;! Nomprog     : TO3PHAS1                                                     !
;! Module      : TOTEM                                                        !
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
;! HL002 ! HL     ! 22/06/08 ! Ajout du label YAERR                           !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;TO3PHAS1^INT^1^59547,74870^0
TO3PHAS1 ;
 
 
 Q:$D(^KLNTOT($J))
 
 Q:$D(^[QUI]TOTG("TO3PHAS1",YA,"PHASE"))
 Q:'($D(^TENTATIV($I,NUFA,TWREF,"PHAS")))  Q:^TOZE($I,"PHASE")=0  S %TABTV="^[QUI]TVPAR(NUFA,TWREF)",%TABRA="^[QUI]RAISON(NUFA,TWREF)",%LIEU=$$^%QZCHW("Phases") D ^TO3WLIEU S NTABN="PHASES",NCLE=4,PNUM=1,NFOR=1,F1=25
DEB S %ABEND=0,NPH=-1,TENT="^TENTATIV($I,NUFA,TWREF,""PHAS"")"
TRAIT S COUTOT=0,DURTOT=0,QUAN=^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE")) D ^TO3GETV
LOPPH S NPH=$N(@%TPH@(NPH)) G:NPH=-1 END S %IND=0,RFU=@%TPH@(NPH) G:$E(RFU,1,2)'="!!" NOIND D ^TOINDPHA S %IND=1 G GET
NOIND S %IND=0,(RIN,RPH)=$P(@%TPH@(NPH),"^",1),%PHSUP=$P(@%TPH@(NPH),"^",2),%U1=$S(%PHSUP=1:5,1:2),%U1(1)=%U1
 F %U3="PH","OG","OP" S @%U3=$P(RPH,"""",2*%U1),%U1=%U1+1
 S %U1=%U1(1) F %U3="PH","OG","OP" S @%U3@(1)=$P(RPH,"""",2*%U1),%U1=%U1+1
GET G:'($D(@TENT@(PH,OP,OG))) LOPPH S ANC=$E(OG_"   "_PH_"   "_OP,1,60) D ^TOEVCOUR
RETERR G:%ABEND=1 FIN S $ZT=^TOZE($I,"C"),NTABN="PHASES"
 S SOURCE=RPH,TSDEF=1,RBIS="("_SOURCE_")" D:%N10=1 ^TOPHSDEF G:'(TSDEF) LOPPH I %PHSUP=1 S CONDIT=1,^[QUI]RAISON(NUFA,TWREF,OG)="IMPLICITMODIFICATION" G SOLO
 G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""C"")"))) NOLO S %TBL="^[QUI]EXPRLONG("_SOURCE_",""C"")" D GET^TOCHEXPR G:%ERR YAERR S CONDIT=RES1 G ROLO
NOLO S COND=^[QUI]CPHASE(YA,PH(1),OG(1),OP(1)),@("CONDIT="_COND)
ROLO G REF:CONDIT=0 S ^[QUI]RAISON(NUFA,TWREF,OG)="^[QUI]PHASE("""_YA_""","""_PH(1)_""","""_OG(1)_""","""_OP(1)_""")"
SOLO S BLOCPH=0 D ^TONAUTPH I BLOCPH&(^SAVE($I,"OK")=0) G BLOPH
 S TBBP=$S(%PHSUP=1:"^PHASE($I,NUFA,TWREF)",1:"^[QUI]PHASE"),OOG=OG I (OP(1)["~")!(PH(1)["~") D ^TOINDOPH S OG=NOP
 S CHP=@TBBP@(YA,PH(1),OG(1),OP(1)),^PHASADM($I,NUFA,TWREF,"PHAS",1,NPH)=YA_"^"_PH_"^"_OG_"^"_OP_"|"_CHP_"|"_YA_"^"_PH(1)_"^"_OG_"^"_OP(1),^PHASADM($I,NUFA,TWREF,"PHAS","OK",PH,OP)=OG
 I %IND=1 S IN=-1 F %U=1:1 S IN=$N(^INDPH($J,IN)) Q:IN=-1  S ^PHASADM($I,NUFA,TWREF,"PHAS",1,NPH,"IND",IN)=^INDPH($J,IN)
 I '(BLOCPH) S ^PHASADM($I,NUFA,TWREF,"MAC",0,NPH)=1,^[QUI]PHAS(NUFA,TWREF,OG)=OP_"/"_OG,^[QUI]ORDEVAL(NUFA,TWREF,"PHAS",OG)=PH_"^"_OP D LMA
 S ^NBRGLEV($I,NUFA,"COUR")=^NBRGLEV($I,NUFA,"COUR")+1 K @TENT@(PH,OP,OOG) G LOPPH
FIN Q
REF K @TENT@(PH,OP,OG) G LOPPH
BLOPH S %ABEND=2,ET=^PILETUD($I,0),^PILETUD($I,ET)=NUFA_"^"_TWREF_"^"_(%N10+1)_"^PHAS^^"_QUI_"^^"_^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE"))_"^"_YA_"^"_YB_"^1^"_%N10
END K %PHSUP,TENT,BLOCPH,CHP,NPH,%U1,%U3,%TPH,COND,CONDIT,COUTOT,DURTOT,NCLE,NFOR,NTABN,OG,OP,PH,PNUM,QUAN,SEC,SOURCE,%U3,%U1,OP,OG,PH,VU,MI,TBT,TB0,TBPH,RS,%NOM,RPH Q
LMA S %NOM="^[QUI]APHASE(YA,PH(1),OG(1),OP(1))"
 
SUIT S TBPH="^TENTATIV($I,NUFA,TWREF,""PHMAC"")",TBT="^TENTATIV($I,NUFA,TWREF,""MAC"")",TB0="^PHASADM($I,NUFA,TWREF,""MAC"",0,NPH,""CH"")" D ^TOMACHAD
 K %RS,%NOM,TB0,UU,M1 Q
 ;HLOO2
YAERR W "ERREUR [Entree]" R *TMP
