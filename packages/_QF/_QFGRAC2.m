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

;%QFGRAC2^INT^1^59547,73875^0
QFGRAC2 ;
 
 
 
 
 
 
 
 
 
 
ZOOMIN(LLISTEN,ZOOM,FZOOM,CFEN) 
 N MSG,AB
 I $$CARD^%QSGEST7(LLISTEN)=0 D ^%VZEAVT($$^%QZCHW("aucun groupe")) Q
 D ZOOMIN1 I AB Q
 S @MENG@(5)=$$^%QZCHW("Sortie.zoom")_"^"_"ZOOM",@MENG@(6,"COM")=$$^%QZCHW("Sortie du zoom")
 D AFFI1^%QFGRECR,USE^%QUAPAGM(CFEN("G"))
 Q
ZOOMIN1 
 S ZOOM=$$UN^%QUAPAGM I ZOOM="" S AB=1 Q
 D AZOOM^%QFGRECR(ZOOM,FZOOM,.MSG)
 I MSG'="" D ^%VZEAVT(MSG) S AB=1 Q
 S CFEN("I")="QFGRZOOM"
 D OPEN^%QUAPAGM(FZOOM,CFEN("I"))
 S AB=0
 Q
ZOOMOUT(CFEN,ZOOM) 
 S CFEN("I")="QFGRIND"
 S ZOOM=""
 S @MENG@(5)=$$^%QZCHW("Zoom")_"^"_"ZOOM",@MENG@(6,"COM")=$$^%QZCHW("Visualisation de tous les elements d'un groupe")
 D AFFI1^%QFGRECR,USE^%QUAPAGM(CFEN("G"))
 Q
 
 
 
 
 
 
 
 
AFFGR(LLISTEN,FGR,CFEN,GROAFF) 
 N INDCOUR,GR,NL,GL,CARD
 S GR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLO") K @(GR)
CAF D USE^%QUAPAGM(CFEN("I"))
 S INDCOUR=$$UN^%QUAPAGM Q:INDCOUR="" 0
 I '($D(@GROAFF@(INDCOUR))) D ^%VZEAVT($$^%QZCHW("Cet individu n'est affecte dans aucun groupe")) G CAF
 S GL=$$CONCAT^%QZCHAD(GROAFF,""""_INDCOUR_"""")
 
 S NL=$$NOM^%QSGES11("TMP")
 D ^%VZEATT,CRETYPV^%QSGES11("L0",NL,"TMP","TEMPORAIRE","","")
 D COPY^%QSGES11(NL,"",.CARD,GL),TRK^%QSGES11(NL)
 
 D ALGRIN^%QFGRECR(NL,GR,FGR,.MSG)
 D OPEN^%QUAPAGM(GR,"QFGRIGR"),REA^%QFGRDEC("QFGRIGR",0)
 
 D DEL^%QSGES11(NL)
 K @(GR) Q 1

