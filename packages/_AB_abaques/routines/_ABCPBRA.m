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

;%ABCPBRA^INT^1^59547,73864^0
%ABCPBRA ;
 
GETVAL S NBNUL=0,%STOP=0 F %VV="P","R" S LIG=-1 F MM=0:0 S LIG=$N(^LIGSCRC($I,%VV,LIG)) Q:LIG=-1  S NCAZ=NCAZ+1 G:(%VV="R")&(%STOP=1) END D TRAIV
 G END
TRAIV S AVORT=0 G @%VV
R I NBNUL'<NBPAR G END
 I '($D(@TB@(DP,%VV,LIG,XX))) S PARA=^[QUW]RESUGRIL(NUGR,LIG),@("^[QUW]GRUPLET(NUGR,"_UPLET_","""_PARA_""")")="Indefini|"_DP_"/"_XX W "." G END
 S PARA=^[QUW]RESUGRIL(NUGR,LIG),@("^[QUW]GRUPLET(NUGR,"_UPLET_","""_PARA_""")")=@TB@(DP,%VV,LIG,XX)_"|"_DP_"/"_XX W "." G END
P I '($D(@TB@(DP,%VV,LIG,XX))) S VAL=%TS,NBNUL=NBNUL+1 G SUIT
 S LIB=$$GETLBLAN^%VTLBLAN(@TB@(DP,%VV,LIG,XX)) I LIB="" S VAL=%TS G SUIT
 I (LIB=$$^%QZCHW("TOUS"))!((LIB=$$^%QZCHW("TOUTES"))!(LIB=$$^%QZCHW("SINON"))) S VAL=%TS G SUIT
 I ^LIGSCRC($I,%VV,LIG)=1 D BRAQ G SUIT
 S VAL=LIB G SUIT
BRAQ S CPG="",CPD="",BRAQ=LIB,MEMBG=$P(BRAQ,",",1),MEMBD=$P(BRAQ,",",2),VSUP=$E(MEMBD,1,$L(MEMBD)-1),CPD=$E(MEMBD,$L(MEMBD)),CPD=$S(CPD="[":"<",1:"'>") G:%SCPR="N" BRAQS
 S VINF=$S(MEMBG["==>":-99999999,1:$E(MEMBG,2,299)),PCH=VINF D TO^%QZNBN1 D:'(ISNUM) ERROR^%ABCPGEX S PCH=VSUP D:'(ISNUM) ERROR^%ABCPGEX S ATEST="%BI'>"_VINF_"&(%BS'<"_VSUP_")" D EPSIL G END
BRAQS I MEMBG["==>" S ATEST="%INT"_CPD_VSUP,PCH=VSUP D TO^%QZNBN1 D:'(ISNUM) ERROR^%ABCPGEX D EPSIL G END
 S VINF=$E(MEMBG,2,299),CPG=$E(MEMBG,1),CPG=$S(CPG="[":"'<",1:">")
 S PCH=VINF D TO^%QZNBN1 D:'(ISNUM) ERROR^%ABCPGEX S PCH=VSUP D TO^%QZNBN1 D:'(ISNUM) ERROR^%ABCPGEX S ATEST="%INT"_CPG_VINF_"&(%INT"_CPD_VSUP_")" D EPSIL G END
EPSIL I $D(^INTERVAL($I,ATEST)) S VAL=^INTERVAL($I,ATEST) G END
 S VAL=$S($D(^[QUW]INTERGRI(NUGR)):^[QUW]INTERGRI(NUGR),1:1),^[QUW]INTERGRI(NUGR)=VAL+1,^[QUW]INTERGRI(NUGR,VAL)=ATEST,^INTERVAL($I,ATEST)=VAL G END
SUIT S:NBNUL<NBPAR UPLET=UPLET_$S(UPLET="":"",1:",")_""""_VAL_"""",@("^[QUW]GRUPLET(NUGR,"_UPLET_")")=1 G END
END Q

