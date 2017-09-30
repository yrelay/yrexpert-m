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

;%QFSELIS^INT^1^59547,73876^0
GRSELIST(GLOBAL) 
 
 
 
 N I,LI,U,X,Y,AD,CT,OK K ^LISTE($J),^FEN($J),^MEN($J) S OK=0
 D CADRE Q:'($$CNTXT)
 D ^%VZEATT,LILIS,PFEN,AFFICH^%QUAPAGM,MENUI
MENU D ^%VQUIKMN(0,80,23,"^MEN($J)",.AD,.CT) G FIN:CT="A",GO:CT="F",REAF:CT="R",FIN:AD="" D @AD G MENU:'(OK)
FIN K ^LISTE($J),^FEN($J),^MEN($J)
 Q
REAF D REAFI G MENU
 
CNTXT() I $$MODEL^%QSMODEL'["ALP" D ^%VZEAVT("Ce module necessite l'installation du schema de donnees ALPAGE.") Q 0
 Q 1
CADRE D CLEPAG^%VVIDEO S CAG=1 D ^%VZCDB(@CUSTOM1@("TITRE"),0) Q
REAFI D CADRE
RAFFR D AFFICH^%QUAPAGM Q
LILIS 
REPAUT ;;ARC,LOT,RELIQUAT,GROUPE
 S U=$P($T(REPAUT),";;",2) F I=1:1 Q:$P(U,",",I)=""  S:$$NOMINT^%QSF($P(U,",",I))'="" X($$NOMINT^%QSF($P(U,",",I)))=""
 
 S Y=-1 F U=0:0 S Y=$N(X(Y)) Q:Y=-1  S I="" F U=0:0 S I=$$NXTRAVOI^%QSTRUC8("L0","BASE",Y,1,I) Q:I=""  I $$^%QSCALVA("L0",I,"CARD")+0 S ^LISTE($J,I)=""
 Q
PFEN 
 S ^FEN($J,"X")=0,^FEN($J,"Y")=2,^FEN($J,"L")=80,^FEN($J,"H")=20,^FEN($J,"B")="L0",^FEN($J,"A")="^LISTE($J)",^FEN($J,"ATT")=1,^FEN($J,"AFF")="CADRE^GRSELIST"
 S ^FEN($J,"C",1,"T")=$$^%QZCHW("Card."),^FEN($J,"C",1,"L")=6,^FEN($J,"C",1,"C")="CARD",^FEN($J,"C",2,"T")=$$^%QZCHW("Repertoire"),^FEN($J,"C",2,"L")=10,^FEN($J,"C",2,"C")="OBJET"
 S ^FEN($J,"C",3,"T")=$$^%QZCHW("Source"),^FEN($J,"C",3,"L")=12,^FEN($J,"C",3,"C")="SOURCE",^FEN($J,"C",4,"L")=21,^FEN($J,"C",4,"C")="AUTRE",^FEN($J,"C",4,"?")="AFFREQ^%QS0D"
 S ^FEN($J,"C",5,"T")=$$^%QZCHW("Creation"),^FEN($J,"C",5,"L")=8,^FEN($J,"C",5,"C")="DATE.CREATION",^FEN($J,"ECRAN")="REAFI^GRSELIST",^FEN($J,"PADLINE")="POCLEPA^%VVIDEO" D INIT^%QUAPAGM("^FEN($J)")
MENUI 
MENUI2 ;;SELECTIONNER POUR GROUPER|MNSEL,LISTER|MNLIS,+|MNPL,-|MNMS,PAGE|MNPG,REPERE|MNRP
 S I=$P($T(MENUI2),";;",2) F U=1:1 S C=$P(I,",",U) Q:C=""  S ^MEN($J,U)=$$^%QZCHW($P(C,"|",1))_"^"_$P(C,"|",2)
 Q
MNLIS S R=$$^%QS0L D REAFI:R=2,POCLEPA^%VVIDEO:R=1 S OK=0 Q
MNSEL D ENS^%QUAPAGM(GLOBAL) I '($D(@GLOBAL)) S OK=0 Q
 S OK=1 Q
MNMS D MOINS^%QUAPAGM S OK=0 Q
MNPL D PLUS^%QUAPAGM S OK=0 Q
MNPG D PAGE^%QUAPAGM S OK=0 Q
MNRP D REPER^%QUAPAGM S OK=0 Q

