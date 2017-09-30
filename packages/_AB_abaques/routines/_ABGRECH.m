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

;%ABGRECH^INT^1^59547,73864^0
%ABGRECH ;PS;05:58 PM  15 Jan 1996
 S DY=3 D CLEBAS^%VVIDEO S PGE=-1,%LI=-1,%TAD="^%ABGUPLE"
 F UU=0:0 S PGE=$N(^TACOMPIL($I,PGE)) Q:PGE=-1  S %LI=-1 F VV=0:0 S %LI=$N(^TACOMPIL($I,PGE,%LI)) Q:%LI=-1  D COMPR
FIN Q
COMPR S PPGG=PGE,LLII=%LI
COMPR2 K B,^GRIL($I),NOM,REF,TAB,%NBDEF,^GRSOL($I) S %NBDEF=0,%NBSOL=1,RGR=^TACOMPIL($I,PPGG,LLII),RG=1
 F TT="NOMG","NORM","IDENT","TYPGR" S @TT=$P(RGR,"^",RG),RG=RG+1
 W !,NOMG,?40,NORM,?60,IDENT,?75,TYPGR S QUW=$S(TYPGR="(P)":QUI,1:%UCI) I '($D(^[QUW]REFABAC(NOMG,NORM,IDENT))) D ^%VZEAVT($$^%QZCHW("Il faut d'abord faire une comprehension de l'Abaque...")) G FIN
 S QUW=$S(TYPGR="(P)":QUI,1:%UCI),NUGR=^[QUW]REFABAC(NOMG,NORM,IDENT),%NBPAR=^[QUW]PARAGRIL(NUGR)
 S %SCPR=$S($D(^[QUW]GROUGRIL(NUGR)):$P(^[QUW]GROUGRIL(NUGR),"|",3),1:"N") S:%SCPR="" %SCPR="N"
 S PARA=-1 K ^VPAR($I) F UU=0:1 S PARA=$N(^[QUW]PARAGRIL(NUGR,PARA)) Q:PARA=-1  S ^VPAR($I,PARA)=""
 D CTR^%QUSAIS("^VPAR($I)",0,6,78,UU+4,.C) G FIN:C="A",SUIT:C="F",COMPR2
SUIT S PARA="" F UU=0:0 S PARA=$O(^VPAR($I,PARA)) Q:PARA=""  S Y1=^VPAR($I,PARA) S:(Y1=$$^%QZCHW("TOUS"))!(Y1=$$^%QZCHW("TOUTES")) Y1="   " S ^GRIL($I,PARA)=Y1,^VPAR($I,PARA)=Y1
 S %REFD=NUGR,PARA=-1 F %U=1:1 S PARA=$N(^VPAR($I,PARA)) Q:PARA=-1  S Y1=^VPAR($I,PARA) S:Y1="" Y1="   " S %REFD=%REFD_","""_Y1_""""
 I $D(@("^[QUI]ABDEJEV("_%REFD_")")),$D(@("^[QUI]ABDEJEV("_%REFD_",""TYPSOL"")")) S VAB=@("^[QUI]ABDEJEV("_%REFD_")") G:VAB["?" NONOK S TAB="^[QUW]GRUPLET("_@("^[QUI]ABDEJEV("_%REFD_")")_")" D OK2^%ABGRIOK G OK2
 S ACCEPT=0,NOMTREE="^[QUW]GRUPLET(NUGR" D ^%QCAGTU5
 S:STOP'=1 ACCEPT=0
 I ACCEPT=1 S @("^[QUI]ABDEJEV("_%REFD_",""TYPSOL"")")=1 G OK
 I '($D(^GRSOL($I))) G NONOK
 S %NBDEF=$N(^GRSOL($I,-1)),%NBSOL=$N(^GRSOL($I,%NBDEF,-1)),@("^[QUI]ABDEJEV("_%REFD_")")=^GRSOL($I,%NBDEF,%NBSOL),@("^[QUI]ABDEJEV("_%REFD_",""TYPSOL"")")=2,TAB="^[QUW]GRUPLET("_^GRSOL($I,%NBDEF,%NBSOL)_")" D OK2^%ABGRIOK G OK2
NONOK S @("^[QUI]ABDEJEV("_%REFD_")")="?" D POCLEPA^%VVIDEO W $$^%QZCHW("Non evaluable [RETURN] ") R *REP D CLEPAG^%VVIDEO G COMPR2
OK D ^%ABGRIOK
OK2 G:NOMG'["PRELEVEMENT" COMPR2
BUL S DX=0,DY=5 X XY W $$^%QZCHW("Voulez-vous l'impression d'un bulletin (O/N) ? ")
 R *REP D TOUCHE^%INCCLAV(REP,.REP)
 S REP=$C(REP) I (REP'=$$^%QZCHW("O"))&(REP'=$$^%QZCHW("N")) D CLEPAG^%VVIDEO G BUL
 I REP=$$^%QZCHW("N") D CLEPAG^%VVIDEO G COMPR2
 D ^%ABGRBUL,CLEPAG^%VVIDEO G COMPR2

