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

;%QS0SUPP^INT^1^59547,73880^0
ZLIGSUPP() 
 
 
 
 
 N ILIS,%I,MSG,LSUPPR,REP
 D ^%QUAPAD($$^%QZCHW("SUPPRESSION DE LISTES"))
 S LSUPPR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LISUPR") K @(LSUPPR)
 D ENS^%QUAPAGM(LSUPPR)
 
 D POCLEPA^%VVIDEO
 I '($D(@LSUPPR)) Q 1
 S REP=$$CONFIRM^%VZEOUI($$^%QZCHW("Voulez vous toujours supprimer cette(ces) liste(s) ?"))
 D POCLEPA^%VVIDEO
 Q:REP'=1 2
 D MSG^%VZEATT($$^%QZCHW("Suppression en cours "))
 S ILIS=""
 F %I=0:0 S ILIS=$O(@LSUPPR@(ILIS)) Q:ILIS=""  D SUPI2(ILIS) W "."
 D INIT2^%QUAPAGM,POCLEPA^%VVIDEO
 K @(LSUPPR) Q 2
 
 
INTDEL(L) N A,R,S
 S S=$$^%QSCALVA("L0",L,"SOURCE"),A=$$^%QSCALVA("L0",L,"ADRESSE")
 G DELET
 
 
SUPI2(L) N DIA
 S DIA=0 G OKSUP
SUPI(L) N DIA
 S DIA=1 G OKSUP
 
OKSUP Q:'($$EX^%QS0(L))
 N A,OLD,OK,R,S
 S S=$$^%QSCALVA("L0",L,"SOURCE"),A=$$^%QSCALVA("L0",L,"ADRESSE")
 I (S="")!(A="") D DEL(L,L_$$^%QZCHW(" Source inconnue ...")) Q:'(OK)  G LATT3
 I S="REQUETES" S R=$$^%QSCALVA("L0",L,"AUTRE") I R="" D DEL(L,L_$$^%QZCHW(" Requete inconnue ...")) Q:'(OK)  G LATT3
 
DELET G GROUP:S="GROUPAGE",COMPL:S="COMPLEMENTAIRE",TRI:S="TRI"
 G DUPL:S="DUPLICATION",REQU:S="REQUETES",VALE:S="VALEURS"
 G CALC:(S="INTERSECTION")!(S="UNION"),LATT:S="LISTE D'ATTRIBUTS",RIEN
REQU D DEL(L,"") Q:'(OK)
 G:'($D(^[QUI]RQS1(R))) LATT2
 S ^[QUI]RQS1(R,"ACTIVATIONS")=^[QUI]RQS1(R,"ACTIVATIONS")-1
 K ^[QUI]RQS1(R,"ACTIVATIONS",L),^[QUI]RQS2(L) G LATT2
CALC G LATT
LATT D DEL(L,"") Q:'(OK)
LATT2 S OLD=$$^%QSCALVA("L0",L,"TRIEE") K @(A)
LATT3 D DEL^%QS0(L)
 I $D(^DERLISTE($I)) K:^DERLISTE($I)=L ^DERLISTE($I)
 Q
GROUP G LATT
TRI G LATT
DUPL G LATT
COMPL G LATT
VALE G LATT
RIEN D DEL(L,L_$$^%QZCHW(" Source : ")_S_$$^%QZCHW(" non prevue ...")) Q:'(OK)  G LATT2
 
DEL(L,M) G:M="" DELETE
 N BID,I
 I '(DIA) S OK=1 Q
DEL0 D POCLEPA^%VVIDEO,^%VSQUEAK W M H 3 D POCLEPA^%VVIDEO
 
 I $$MES^%VZEOUI($$^%QZCHW("Voulez-vous supprimer quand-meme")_" "_L_" ? ","O")'=1 G 1
 G 79
1 S OK=0 Q
6 G 1
13 G 79
78 G 1
79 D POCLEPA^%VVIDEO W $$^%QZCHW(" OK") S OK=1 Q
 
DELETE N I,X I '(DIA) S OK=1 Q
DEL00 D POCLEPA^%VVIDEO
 
 I $$MES^%VZEOUI($$^%QZCHW("Suppression de")_" "_L_". "_$$^%QZCHW("Confirmez-vous")_" ? ","O")'=1 G DEL1
 G DEL79
DEL1 S OK=0 Q
DEL6 G DEL1
DEL13 G DEL79
DEL78 G DEL1
DEL79 D POCLEPA^%VVIDEO W $$^%QZCHW(" OK")
 S OK=1 Q

