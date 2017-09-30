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

;TOGETAR2^INT^1^59547,74872^0
 ;
TOGETAR2 
 
 K ^TACOMPIL($I),^COMPILVU($I)
QUES S %NARTI=1 D CLEPAG^%VVIDEO,POCLEPA^%VVIDEO W $$^%QZCHW("* tous, ART* : ART plus ses composants,(RETURN)pour fin liste")
 S DXG=0,DXD=38,DYH=0,DYB=4,GRAPH=1,MSG=TIT,BIG=1 D TO4^%VZCD S DX=10,DY=6 X XY S PPX=DX,PPY=DY
QUES2 S DX=6 X XY S AX=$X,AY=$Y D ^%VLEC G:CTRLA=1 FIN G FIN:Y1="",ALL:Y1="*" S STAR=$E(Y1,$L(Y1))="*" S:STAR Y1=$E(Y1,1,$L(Y1)-1) D ^%LXMOT(Y1,AX,AY,.%OK,.%F) W:STAR "*" G NONUN:'(%OK)
 S PCHCOMP=%F S:'($D(^COMPILVU($I,PCHCOMP))) ^TACOMPIL($I,%NARTI)=PCHCOMP,^COMPILVU($I,PCHCOMP)=1,%NARTI=%NARTI+1 S DY=DY+1,DX=PPX D:STAR TRAITM G QUES2
NONUN W " ??? " S DY=DY+1 G QUES2
FIN Q
TRAITM K ^SAISIMU($I) S (YART,ARTI)=PCHCOMP
 N (ARTI,QUI,%NARTI,SUB) D VARSYS^%QCSAP S YA=ARTI D ^TO3ARTHE S NOMTREE="^ARBTHEO($I,ARTI",ADR="TRAIT2^TOGETART" D ^%QCAGTU1
 G FIN2
TRAIT2 I '($D(^COMPILVU($I,@NOM))) S ^TACOMPIL($I,%NARTI)=@NOM,^COMPILVU($I,@NOM)=1,%NARTI=%NARTI+1
FIN2 Q
ALL W $$^%QZCHW(" Tout") K ^COMPILVU($I),^TACOMPIL($I) S %NU=1,%TAB=$P($T(TAB),";;",2)
 F %UU=1:1 S %TB=$P(%TAB,"/",%UU) Q:%TB=""  S %A=-1,%TB="^[QUI]"_%TB F %VV=1:1 S %A=$N(@%TB@(%A)) Q:%A=-1  I %A'="z",'($D(^COMPILVU($I,%A))) S ^COMPILVU($I,%A)=1,^TACOMPIL($I,%NU)=%A,%NU=%NU+1
 S ^[QUI]CARDINAL($$^%QZCHW("ARTICLE"))=%NU-1 K %A,%NU,%TAB,%TB,%UU,%VV,DXG,DXD,DYH,DYB,MSG,GRAPH,TIT
FALL Q
TAB ;;EXPLICI/IMPLICI/NOMENC/PHASE/FORMULE/OUTCONS/MATIERE/SELMAT/MACSEL/ESSABAC/IMPMAC/IMPMAT

