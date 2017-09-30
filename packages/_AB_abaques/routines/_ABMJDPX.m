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

;%ABMJDPX^INT^1^59547,73864^0
%ABMJDPX ;
 
 I '($D(DPNUM)) S %PCH=^[QUW]OCGRIL(NOMG) D ^%QZNBN1 S DPNUM=$S(ISNUM=1:1,1:0)
 I '($D(^[QUW]OCGRIL(NOMG,%NORM,"zzNEXPOSI"))) S ^[QUW]OCGRIL(NOMG,%NORM,"zzNEXPOSI")=DP_"^"_PX G FIN
 S APOS=^[QUW]OCGRIL(NOMG,%NORM,"zzNEXPOSI"),ADP=$P(APOS,"^",1),APX=$P(APOS,"^",2),DPI=^[QUW]OCGRIL(NOMG),DPC=$S(DPNUM=0:$P(DP,DPI,2),1:DP),ADPC=$S(DPNUM=0:$P(ADP,DPI,2),1:ADP)
 I DPC>ADPC S ^[QUW]OCGRIL(NOMG,%NORM,"zzNEXPOSI")=DP_"^"_PX G FIN
 D POSX S NPX=$S(APX>SPX:APX,1:SPX),^[QUW]OCGRIL(NOMG,%NORM,"zzNEXPOSI")=ADP_"^"_NPX
FIN Q
POSX S PPX=PX-9,ZON=(PPX\(ESPC+1))+1,CASE=PPX#(ESPC+1),SPX=$S(CASE=1:PX,1:(PX-LCHP)-1) Q

