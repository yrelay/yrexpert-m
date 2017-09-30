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

;%ABEV02^INT^1^59547,73864^0
%ABEV02 ;
 
 S DY=3 D CLEBAS^%VVIDEO S PGE=-1,%LI=-1,%TAD="^%ABGUPLE"
 F UU=0:0 S PGE=$N(^TACOMPIL($I,PGE)) Q:PGE=-1  S %LI=-1 F VV=0:0 S %LI=$N(^TACOMPIL($I,PGE,%LI)) Q:%LI=-1  D COMPR
FIN Q
COMPR S PPGG=PGE,LLII=%LI
COMPR2 K B,^GRIL($I),NOM,REF,TAB,%NBDEF,^GRSOL($I) S %NBDEF=0,%NBSOL=1,RGR=^TACOMPIL($I,PPGG,LLII),RG=1
 F TT="NOMG","NORM","IDENT","TYPGR" S @TT=$P(RGR,"^",RG),RG=RG+1
 W !,NOMG,?40,NORM,?60,IDENT,?75,TYPGR
 S QUW=$S(TYPGR="(P)":QUI,1:%UCI),NUGR=^[QUW]REFABAC(NOMG,NORM,IDENT),%NBPAR=^[QUW]PARAGRIL(NUGR)
 S %SCPR=$S($D(^[QUW]GROUGRIL(NUGR)):$P(^[QUW]GROUGRIL(NUGR),"|",3),1:"N") S:%SCPR="" %SCPR="N"
 S PARA=-1
LPARA S PARA=$N(^[QUW]PARAGRIL(NUGR,PARA)) G:PARA=-1 SUIT W !,?10,PARA,?40,"= " S DX=$X,DY=$Y D ^%VLEC G:CTRLA=1 FIN G:CTRLF=1 SUIT S:Y1="" Y1="z" S:(Y1=$$^%QZCHW("TOUS"))!(Y1=$$^%QZCHW("TOUTES")) Y1="z" S ^GRIL($I,^[QUW]PARAGRIL(NUGR,PARA),PARA)=Y1 G LPARA
SUIT D ^%ABEV03 S H2=$P($H,",",2) G OK:OK D POCLEPA^%VVIDEO W $$^%QZCHW("Non evaluable [RETURN] ") R *X D CLEPAG^%VVIDEO G COMPR
OK D ^%ABEV05,CLEPAG^%VVIDEO G COMPR

