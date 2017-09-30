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

;%QSGRAPH^INT^1^59547,73882^0
%QSGRAPH ;
 
 
 
 
 N B,%B,BASE,BASI,LBASE,OBJ,REP
 I '($D(^[QUI]RQSAUTOR(WHOIS))) D ^%VZEAVT($$^%QZCHW("Veuillez contacter YXP, vous ne pouvez choisir un repertoire ")) W $$^%QZCHW("Merci") H 1 D POCLEPA^%VVIDEO Q
 S B=-1 F %B=0:0 S B=$N(^[QUI]RQSAUTOR(WHOIS,B)) Q:B=-1  S:B'="z" LBASE(0,B)=""
DEBUT D CLEPAG^%VVIDEO,CAD,INIT^%QUCHOIP("LBASE(0)",1,"",0,3,20,7)
L0 D AFF^%QUCHOIP
 S BASE=$$UN^%QUCHOIP G:BASE="" FIN S BASI=$$NOMINT^%QSF(BASE)
 I $$REPVID^%QSGEST5(BASI) D ^%VZEAVT($$^%QZCHW("Ensemble vide ")) G L0
 S TEST=$D(^[QUI]CPTEUR("HIST"))
 S LISTE="TEMP"_$S(TEST:^[QUI]CPTEUR("HIST")+1,1:1)
 S ^[QUI]CPTEUR("HIST")=$S(TEST:^[QUI]CPTEUR("HIST")+1,1:1)
 D PA^%QSGESTI("L0",LISTE,"ADRESSE",$$LISTIND^%QSGEST6(BASI),1)
 D PA^%QSGESTI("L0",LISTE,"CARD",$$CARD^%QSGEST5(BASI),1)
 D PA^%QSGESTI("L0",LISTE,"OBJET",BASE,1)
L1 
 S %AJM="A",CMS=0,SCR="HISTOPAR",NOMTAB="" D ^%VACTISC(SCR)
 S TEST=1 F I=1:1:^%SCRE(SCR) S TEST=TEST&(RESUL(I)'="")
 G:TEST=0 L0
 S RESUL(3)=$S(RESUL(3)="O":1,1:0)
 S:'($D(INTERV)) INTERV=""
 D ^ZHIHISTO(LISTE,RESUL(1),RESUL(2),RESUL(3),INTERV)
 D DEL^%QS0(LISTE)
 G DEBUT
FIN D END^%QUCHOIP Q
CAD S DXG=0,DXD=39,DYH=0,DYB=2,GRAPH=1
 S MSG=$$^%QZCHW("GESTION GRAPHIQUE DES INDIVIDUS") D 4^%VZCD Q

