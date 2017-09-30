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

;%SRTRRES^INT^1^59547,73891^0
SRTRRES ;
 
 
 
 
 N SA
CHS 
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Choisissez une definition de transfert"),0)
 S SA=$$TIT^%PKCHOIX($$ADRS^%SRDESTI,10,3,17,"",0)
 Q:SA=""
 D RES(SA)
 G CHS
 
RES(SA) 
 N %C,%R,AFFIC,GLAF,GLERR,GLGR,GLOK,GLNOK,GR,NUM,PK,X,Y,CTR
 D ^%VZCDB($$^%QZCHW("Transfert du masque")_" "_SA,0)
 
 S GLOK=$$ADROK^%SRBATCH(SA)
 S GLNOK=$$ADRNOK^%SRBATCH(SA)
 S AFFIC=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"INDIV")
 S GLAF=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VAL")
 S GLERR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ERR")
 S GLGR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GROUPE") K @(GLGR)
 D CONS
GROUP 
 K @(AFFIC),@(GLAF),@(GLERR)
 S GR=$$CHGR
 I GR="" K @(GLGR) Q
MEN 
 D ^%VZCDB($$^%QZCHW("Transfert du masque")_" "_SA,0)
 S DX=0,DY=2 D CLEBAS^%VVIDEO
 K Y
MEN1 S %R=21
 S Y="15\HRL\3\transfert\\valeurs.stockees,individus.crees,problemes,destruction,retransfert,impression"
 D ^%PKPOP
 G:(CTR="A")!(CTR="F") GROUP
 G:CTR'="" MEN1
 
 I X=6 G IMPR
 
 I X=1 D VAL^%SRTRAOK G MEN
 
 I X=2 D IND^%SRTRAOK G MEN
 
 I X=3 D VISU^%SRTRNOK G MEN
 
 I X=5 D TRAGR^%SRTRANS(SA,GR) G MEN
 
 D SUPGR^%SRTRSUP(SA,GR)
 I ('($D(@GLOK@(GR))))&('($D(@GLNOK@(GR)))) K @GLGR@(GR) G GROUP
 G MEN
 
IMPR 
 D ^%VZCDB($$^%QZCHW("Impression des resultats du transfert"),0)
MENI K Y
MENI1 S %R=22
 S Y="10\HRL\4\impression\\valeurs.stockees,individus.crees,problemes,tout"
 D ^%PKPOP
 G:(CTR="A")!(CTR="F") MEN
 G:CTR'="" MENI1
 
 I X=1 D IMPVAL^%SRTRAOK G MENI
 
 I X=2 D IMPIND^%SRTRAOK G MENI
 
 I X=3 D IMPVAL^%SRTRNOK G MENI
 
 D ^%SRTRIMP(SA,GR)
 G MEN
 
CHGR() 
 S NUM=$$NUM^%PKCHOIX(GLGR,40,3,17,$$^%QZCHW("date du transfert"),0)
 Q:NUM="" ""
 S GR=""
 F I=0:1 S GR=$O(@GLGR@(GR)) Q:GR=""  I @GLGR@(GR)=NUM Q
 Q GR
 
CONS 
 N %G,G
 S G="" F %G=0:0 S G=$O(@GLOK@(G)) Q:G=""  S @GLGR@(G)=@GLOK@(G)
 S G="" F %G=0:0 S G=$O(@GLNOK@(G)) Q:G=""  S @GLGR@(G)=@GLNOK@(G)
 Q

