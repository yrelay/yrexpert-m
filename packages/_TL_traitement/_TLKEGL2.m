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

;%TLKEGL2^INT^1^59547,74029^0
TLKEGL2 ;
 
SEL(GL,ENS) 
 D INIT^%QUCHOIP(GL,1,"",0,5,80,17),AFF^%QUCHOIP
 D ^%QUCHOYP(ENS)
 D END^%QUCHOIP
 Q
 
SELTRT(GL,ENS) 
 D AIDE2^%TLDIAL4("CAS D'EMPLOI","N",0,ENS)
 Q
 N FEN S FEN=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LISTE.TRT") K @(FEN)
 S @FEN@("X")=0,@FEN@("Y")=5,@FEN@("L")=80,@FEN@("H")=17
 S @FEN@("B")="TRAITEMENT",@FEN@("A")=$$LISTIND^%QSGEST6("TRAITEMENT")
 S @FEN@("ATT")=1
 S @FEN@("PADLINE")="POCLEPA^%VVIDEO"
 S @FEN@("C",1,"T")=$$^%QZCHW("Commentaire"),@FEN@("C",1,"L")=30,@FEN@("C",1,"C")="ENTETE"
 S @FEN@("C",2,"T")=$$^%QZCHW("Date.modif"),@FEN@("C",2,"L")=10,@FEN@("C",2,"C")="DATE.DERNIERE.MODIFICATION"
 S @FEN@("C",3,"T")=$$^%QZCHW("Regles"),@FEN@("C",3,"L")=6,@FEN@("C",3,"C")="NOMBRE.DE.REGLES"
 S @FEN@("C",4,"T")=$$^%QZCHW("Analyse.correcte"),@FEN@("C",4,"L")=10,@FEN@("C",4,"C")="ANALYSE.CORRECTE"
 D INIT^%QUAPAGM(FEN),AFFICH^%QUAPAGM
 D ENS^%QUAPAGM(ENS),END^%QUAPAGM
 Q
 
NETALL(GL) 
 K @(GL)
 Q
 
NET(GL,TR) 
 
 N AT,MD,LI,RP,NF,I,I2,I3,I1,GLA,GLT,GLAA,GLAF,GLTA,GLTF
 S GLA=$$CONCAS^%QZCHAD(GL,"ATTRIBUT"),GLT=$$CONCAS^%QZCHAD(GL,"TRAITEMENT")
 S GLAA=$$CONCAS^%QZCHAD(GLA,"ATTR"),GLAF=$$CONCAS^%QZCHAD(GLA,"FONC")
 S GLTA=$$CONCAS^%QZCHAD(GLT,"ATTR"),GLTF=$$CONCAS^%QZCHAD(GLT,"FONC")
 S AT=""
 F I=1:1 S AT=$O(@GLTA@(TR,AT)) Q:AT=""  S RP="" F I1=1:1 S RP=$O(@GLTA@(TR,AT,RP)) Q:RP=""  S LI="" F I2=1:1 S LI=$O(@GLTA@(TR,AT,RP,LI)) Q:LI=""  S MD="" F I3=1:1 S MD=$O(@GLTA@(TR,AT,RP,LI,MD)) Q:MD=""  D KILL(GLAA,AT,RP,TR,LI,MD)
 S AT=""
 F I=1:1 S AT=$O(@GLTF@(TR,AT)) Q:AT=""  S RP="" F I1=1:1 S RP=$O(@GLTF@(TR,AT,RP)) Q:RP=""  S LI="" F I2=1:1 S LI=$O(@GLTF@(TR,AT,RP,LI)) Q:LI=""  S MD="" F I3=1:1 S MD=$O(@GLTF@(TR,AT,RP,LI,MD)) Q:MD=""  D KILL(GLAF,AT,RP,TR,LI,MD)
 K @GLTA@(TR),@GLTF@(TR)
 Q
 
KILL(GL,A,R,T,L,M) 
 K @GL@(A,R,T,L,M)
 Q

