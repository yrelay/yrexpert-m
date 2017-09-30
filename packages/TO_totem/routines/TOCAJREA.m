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

;TOCAJREA^INT^1^59547,74871^0
TOCAJREA ;
 
Q1 D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("Ajout de couts") D TO4^%VZCD
Q0 W *-1 S DX=0,DY=10 X XY W $$^%QZCHW("Sur l'objet : ") S DX=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN S (YA,YB)=Y1 G:$D(^[QUI]EXPLICI(YA)) SUIT I $D(^[QUI]ACOMMEB(YA)) S YB=$P(^[QUI]ACOMMEB(YA),"^",1) G SUIT
 W " ???" D POCLEPA^%VVIDEO W $$^%QZCHW("Parametres explicites inconnus sur cet objet ! ") H 3 S DX=0,DY=5 D CLEBAS^%VVIDEO G Q0
SUIT D ^TO4GEXPL
S0 D ^TOAJREA1 G:%ABAND=1 Q1
S11 S %EXPERT=YB,NUM=-1,IDENT=%EXPERT
 F UU=0:0 S NUM=$N(^TO4GEXPL($I,NUM)) Q:NUM=-1  S PARA=^VALPAR($I,^TO4GEXPL($I,NUM)) S:PARA="" PARA=$$^%QZCHW("TOUS") S IDENT=IDENT_"/"_PARA
 K ^POSENR($I) S NU=1,REFID=IDENT,LIB=%EXPERT,ARTET=YA,ARTCT=YB F %U=2:1 S IT=$P(IDENT,"/",%U) Q:IT=""  D AFF
 I LIB'="" S ^POSENR($I,NU)=LIB
 G S2
AFF S L1=$L(LIB)+$L(IT) I L1>70 S ^POSENR($I,NU)=LIB,NU=NU+1,LIB=""
 S LIB=LIB_"/"_IT Q
S2 D CONS^TO3RETUD S DX=0,DY=5 D CLEBAS^%VVIDEO G:$D(@("^[QUI]CTACHCPT("_RRR_")")) REFUS S DY=DY+3 X XY S NU=-1 F %U=1:1 S NU=$N(^POSENR($I,NU)) Q:NU=-1  X XY W ^POSENR($I,NU) S DY=DY+1
Q2 D POCLEPA^%VVIDEO W $$^%QZCHW("OK pour le stockage du cout pour ce composant (O/N) ? ") R *REP S REP=$C(REP) G:(REP'=$$^%QZCHW("O"))&(REP'=$$^%QZCHW("N")) Q2 G:REP=$$^%QZCHW("N") S0 S DX=0,DY=17 X XY W $$^%QZCHW("Reference : ") S DX=$X D ^%VLEC S REFEREN=Y1
 S DX=0,DY=18 X XY W $$^%QZCHW("Cout : ") S DX=$X D ^%VLEC S COUT=Y1
 S DX=0,DY=19 X XY W $$^%QZCHW("Commentaire : ") S DX=$X D ^%VLEC S COM=Y1
 S @("^[QUI]CTACHCPT("_RRR_")")=REFEREN_"^"_COUT_"^"_COM G S0
FIN Q
REFUS D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("Existe deja ! Stockage refuse... [RETURN] ") R *RET G S0
 
 
 
 
 G S0

