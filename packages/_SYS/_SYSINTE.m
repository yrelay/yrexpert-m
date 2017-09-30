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

;%SYSINTE^INT^1^59547,73892^0
SYSINTE ;
 
 
 
 
 
 
 
 N TEMP,MENU,ADR,CTR
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Transfert de donnees en clientele"),0),^%VZEATT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S MENU=$$CONCAS^%QZCHAD(TEMP,"MENU")
 S ENS=$$CONCAS^%QZCHAD(TEMP,"ENS")
 S @MENU@(1)=$$^%QZCHW("Traitements")_"^"_"TRT"
 S @MENU@(2)=$$^%QZCHW("Modeles")_"^"_"MOD"
 S @MENU@(3)=$$^%QZCHW("Formats")_"^"_"FOR"
ACT 
 S DX=0,DY=6 D CLEBAS^%VVIDEO
 D ^%VQUIKMN(20,79,6,MENU,.ADR,.CTR)
 I CTR="A" K @(TEMP) Q
 I CTR="F" D LISTRT(ENS),GLOB^%SYSINTD(ENS) K @(TEMP) Q
 G @ADR
 
TRT 
 D SAI("^[QUI]TTL",$$CONCAS^%QZCHAD(ENS,"TTL"))
 G ACT
 
MOD 
 D SAI("^[QUI]EDMOD",$$CONCAS^%QZCHAD(ENS,"EDMOD"))
 G ACT
 
FOR 
 D SAI("^[QUI]EDFORMAT",$$CONCAS^%QZCHAD(ENS,"EDFORMAT"))
 G ACT
 
SAI(GLO,ENS) 
 D INIT^%QUCHOIP(GLO,1,"",0,8,80,14)
 D AFF^%QUCHOIP
 D ^%QUCHOYP(ENS)
 D END^%QUCHOIP
 Q
 
LISTRT(ENS) 
 
 N TRT,GLO,%T,X0,X1,X2,%U
 S GLO=$$CONCAS^%QZCHAD(ENS,"TTL")
 Q:'($D(@GLO))
 S X0="ZR  ZI ""tlLIST ;;"" X X1"
 S X2="ZS @(""tlLIST"")"
 S X1="S TRT="""" F %U=0:0 S TRT=$O(@GLO@(TRT)) S %=(TRT="""") X:% X2 Q:%  W !,TRT S LI="" ;;""_TRT ZI LI"
 X X0
 Q

