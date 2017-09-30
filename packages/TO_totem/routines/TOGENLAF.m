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

;TOGENLAF^INT^1^59547,74872^0
TOGENLAF ;
 
 D CLEPAG^%VVIDEO S DXG=0,DXD=79,DYH=0,DYB=4,GRAPH=0,MSG=$$^%QZCHW("REGENERATION DES GAMMES ISSUES DES SCHEMAS DE LAMINAGE A FROID") D TO4^%VZCD K DXD,DXG,DYH,DYB,GRAPH,MSG S DX=0,DY=7 X XY
 S GAM="GALz" F UU=1:1 S GAM=$N(^[QUI]PHAS(GAM)) Q:GAM=-1  Q:$E(GAM,1,3)'="GAM"  D KILL
 K ^[QUI]ANTETUDE("LAF"),^[QUI]REFANTET("LAF") S NOMG="GAMLAC",%ALL=-1
LALL S %ALL=$N(^[QUI]OCGRIL(NOMG,%ALL)) G:%ALL=-1 FIN S %ETAT=-1
LETAT S %ETAT=$N(^[QUI]OCGRIL(NOMG,%ALL,%ETAT)) G:%ETAT=-1 LALL S %LARG=-1
LLARG S %LARG=$N(^[QUI]OCGRIL(NOMG,%ALL,%ETAT,%LARG)) G:%LARG=-1 LETAT S DP=-1
LDP S DP=$N(^[QUI]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DP)) G:DP=-1 LLARG
 G:'($D(^[QUI]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DP,8,10))) LDP
 S C=^[QUI]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DP,8,10) K ^GRPH($I) S YEC=8
LYEC S YEC=$N(^[QUI]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DP,YEC)) G:YEC=-1 SUIT S XEC=-1
LXE S XEC=$N(^[QUI]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DP,YEC,XEC)) G:XEC=-1 LYEC
 S ^GRPH($I,XEC,YEC)=^[QUI]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DP,YEC,XEC) G LXE
SUIT W "." S QUW=QUI,CBLANC="" D ^TOWGETPH G LDP
FIN Q
KILL F IT="SECT","CONS","PHAS","DUREE","COUT","RAISON","DIM","TVPAR","AUTOPLAF" S TAB="^[QUI]"_IT_"(GAM)" K @(TAB)
 K IT,TAB Q

