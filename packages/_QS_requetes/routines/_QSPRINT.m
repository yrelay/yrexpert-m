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

;%QSPRINT^INT^1^59547,73883^0
QSPRINT() 
 
 
 
 
 
 
 
 
 N ADR,CTR,MENU,ENSEM,RES
 S ENSEM="^ENSTRT($J)",RES=1
 S MENU=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MENU") K @(MENU)
 S @MENU="23^10^79"
 S @MENU@(1)=$$^%QZCHW("Selection")_"^SELEC"
 S @MENU@(2)=$$^%QZCHW("Toutes")_"^TOUS"
ACTU S DX=0,DY=22 X XY D CLEBAS^%VVIDEO,^%QUAPAD($$^%QZCHW("IMPRESSION DE REQUETES"))
 D ^%VQUIKMN(0,80,22,MENU,.ADR,.CTR) G:(CTR="A")!(CTR="F") END
 G:ADR'="" @ADR G ACTU
 
END D:RES=2 INIT^%QUAPAGM(FEN)
 K @(MENU) Q RES
 
TOUS 
 D IMPRI("^[QUI]RQS1")
 G ACTU
 
SELEC 
 K @(ENSEM)
 D ENS^%QUAPAGM(ENSEM) G:$D(@ENSEM)=0 ACTU
 D IMPRI(ENSEM)
 S RES=2
 G ACTU
 
 
 
IMPRI(LISTE) 
 N %I,%PORT,REQ,F
 S DX=0,DY=22 X XY D CLEBAS^%VVIDEO
 D ^%QUAPAD($$^%QZCHW("IMPRESSION DE REQUETES"))
 S DX=0,DY=22 X XY
 Q:$$MES^%VZEOUI($$^%QZCHW("Confirmez-vous l'impression ? "),"O")'=1
 D POCLEPA^%VVIDEO W $$^%QZCHW("Impression en cours ... ")
 S %PORT=^TABIDENT(WHOIS,"PRINTER") C %PORT O %PORT U %PORT
 W #
 W !,$$^%QZCHW("Le "),$$DATE^%QMDATE,$$^%QZCHW(" a "),$$HEURE^%QMDATE
 S REQ=""
 F %I=0:0 S REQ=$O(@LISTE@(REQ)) Q:(REQ="")!(REQ="z")  D POCLEPA^%VVIDEO,IMPR
 U 0 C %PORT
 D POCLEPA^%VVIDEO W $$^%QZCHW("Impression terminee ... ") H 3
 Q
IMPR 
 W !,!,!,$$^%QZCHW("Requete : "),REQ
 W !,!,!,$$^%QZCHW("Commentaire : ")
 I $D(^[QUI]RQS1(REQ,"COMM")) W ^[QUI]RQS1(REQ,"COMM")
 W !,!,!,$$^%QZCHW("Repertoire : "),^[QUI]RQS1(REQ,"BASE")
 W !,!,$$^%QZCHW("Individus intermediaires : "),!
 F F=1:1 Q:'($D(^[QUI]RQS1(REQ,"VARIABLES",F)))  W !,"   ",^[QUI]RQS1(REQ,"VARIABLES",F)
 W !,!,$$^%QZCHW("Criteres de selection : "),!
 F F=1:1 Q:'($D(^[QUI]RQS1(REQ,"CONTRAINTES",F)))  W !,"   ",^[QUI]RQS1(REQ,"CONTRAINTES",F)
 W #
 Q

