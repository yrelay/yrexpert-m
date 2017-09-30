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

;TOAJREA0^INT^1^59547,74871^0
TOAJREA0 ;
 
Q1 D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("Ajout de realisations") D TO4^%VZCD
Q0 W *-1 S DX=0,DY=10 X XY W $J("",65) X XY W $$^%QZCHW("Sur l'objet : ") S AX=$X,AY=$Y,DX=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN D ADR^%LXABR(Y1,.OK,.YA)
 I OK'=1 D POCLEPA^%VVIDEO W $S(OK=0:$$^%QZCHW("Inconnu"),1:$$^%QZCHW("Ambigu"))," [RETURN] " R *X:^TOZE($I,"ATTENTE") G FIN:X=-1 D POCLEPA^%VVIDEO G Q0
 S DX=AX,DY=AY X XY W YA H 1 S YB=YA G:$D(^[QUI]EXPLICI(YA)) SUIT I $D(^[QUI]ACOMMEB(YA)) S YB=$P(^[QUI]ACOMMEB(YA),"^",1) G SUIT
 W " ???" D POCLEPA^%VVIDEO W $$^%QZCHW("Parametres explicites inconnus sur cet objet ! ,[RETURN]") R *X:^TOZE($I,"ATTENTE") G FIN:X=-1 D POCLEPA^%VVIDEO G Q0
SUIT D ^TO4GEXPL
S0 D ^TOAJREA1 G:%ABAND=1 Q1
S11 S %EXPERT=YB,TAB="^[QUI]ANTETUDE(%EXPERT,NUFA,0)",NUM=-1,IDENT=%EXPERT
 F UU=0:0 S NUM=$N(^TO4GEXPL($I,NUM)) Q:NUM=-1  S PARA=^VALPAR($I,^TO4GEXPL($I,NUM)) S:PARA="" PARA=$$^%QZCHW("TOUS") S IDENT=IDENT_"/"_PARA
 K ^POSENR($I) S NU=1,REFID=IDENT,LIB=%EXPERT,ARTET=YA,ARTCT=YB F %U=2:1 S IT=$P(IDENT,"/",%U) Q:IT=""  D AFF
 I LIB'="" S ^POSENR($I,NU)=LIB
 G S2
AFF S L1=$L(LIB)+$L(IT) I L1>70 S ^POSENR($I,NU)=LIB,NU=NU+1,LIB=""
 S LIB=LIB_"/"_IT Q
S2 D CONS^TO3RETUD S DX=0,DY=5 D CLEBAS^%VVIDEO G:$D(@("^[QUI]REFANTET("_RRR_")")) REFUS D ^TOTPOP S DX=10,DY=6 X XY W $$^%QZCHW("Realisation "),NUFA S DY=DY+3 X XY S NU=-1 F %U=1:1 S NU=$N(^POSENR($I,NU)) Q:NU=-1  X XY W ^POSENR($I,NU) S DY=DY+1
Q2 D POCLEPA^%VVIDEO W $$^%QZCHW("OK pour le stockage de cette realisation (O/N) ? ") R *REP S REP=$C(REP) G:(REP'=$$^%QZCHW("O"))&(REP'=$$^%QZCHW("N")) Q2 G:REP=$$^%QZCHW("N") S0 S DX=0,DY=17 X XY W $$^%QZCHW("Commentaire : ") S DX=$X D ^%VLEC S COM=Y1
 D ZD^%QMDATE4,INT^%QMDAK0 S @TAB=IDENT_"^"_0_"^"_%DAT_"^"_HEURE_"^"_COM,@("^[QUI]REFANTET("_RRR_","""_NUFA_""","""_0_""")")=%DAT_"^"_HEURE_"^"_COM G S0
FIN Q
REFUS S TB="^[QUI]REFANTET("_RRR_")",NUFA=$N(@TB@(-1)),REF=$N(@TB@(NUFA,-1))
 I (NUFA=-1)!(REF=-1) D POCLEPA^%VVIDEO W $$^%QZCHW("Realisation deja existant ! Stockage refuse.. [RETURN] ") R *RET G S0
 S REF=@TB@(NUFA,REF),DT=$P(REF,"^",1),HR=$P(REF,"^",2),DX=10,DY=6 X XY W $$^%QZCHW("Realisation "),NUFA S DY=DY+3 X XY S NU=-1 F %U=1:1 S NU=$N(^POSENR($I,NU)) Q:NU=-1  X XY W ^POSENR($I,NU) S DY=DY+1
 S DY=DY+1,DT=$S(DT="":"??",1:DT),HR=$S(HR="":"??",1:HR) X XY W $$^%QZCHW("Realisation deja existante, creee le "),DT,$$^%QZCHW(" a "),HR D POCLEPA^%VVIDEO W $$^%QZCHW("Stockage refuse ! [RETURN] ") R *RET G S0

