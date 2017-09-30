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
;! HL002 ! HL     ! 20/07/12 ! PB saut de ligne sur terminal-gnome            !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%TLBAMAP^INT^1^59547,74028^0
%TLBAMAP() 
 
 N TABC,LISTE,TRT,DEROUL,R,MODAF,ETUDE,CTR,SIND,MODEX,DISMOD
 S R=1,SIND=0
 S ARMAP=0
 D SET^%SGVAR("MAP",1)
CHETD 
 D CHOIX^%TLBAETD(.ETUDE,.CTR)
 I CTR>3 S R=2,CTR=CTR-3
 I CTR=1 S ARMAP=1 G FINMAP
 I CTR'=3 G ACT
 S DX=0,DY=22 D CLEBAS^%VVIDEO K TABC
 S TABC(1)="DU CONTEXTE LOCAL A L'ETUDE",TABC(2)="DE TOUTES LES DONNEES PRODUITES"
 S MODAF=$$MES^%VZECHO($$^%QZCHW("restauration"),"TABC")
 I (MODAF'["CONTEXTE")&(MODAF'["DONNEES") G CHETD
 I MODAF["CONTEXTE" S MODEX=4
 I MODAF["DONNEES" S MODEX=3
 S (TRT,LISTE,DEROUL)="",MODAF=2 G SUITGO
ACT 
 
 S DISMOD=0
 S TRT=$$GET^%TLDIAL2($$^%QZCHW("traitement")_" : ",.DISMOD)
 S:DISMOD R=2
 I TRT="" S ARMAP=1 G FINMAP
SACT I '($$OKANA^%TLGEST(TRT)) D ^%VZEAVT($$^%QZCHW("traitement incorrect, veuillez le reanalyser")) S ARMAP=1 G FINMAP
 I (R=2)&(ICI'["TLMENUG") D REAFF^%QS0DP S R=1
 I ICI["TLMENUG" D REAFF^%TLMENUG S R=1
 
 ;HL002 D BLD^%VVIDEO,BLK^%VVIDEO,REV^%VVIDEO,POCLEPA^%VVIDEO W " ",$E(TRT_"  ",1,76-$X) D NORM^%VVIDEO W $E($$^%QZCHW("  Choisissez une liste pour le traitement ..."),1,76-$X)
 D BLD^%VVIDEO,BLK^%VVIDEO,REV^%VVIDEO,POCLEPA^%VVIDEO W " ",$E(TRT_"  ",1,76-$X) D NORM^%VVIDEO W $E($$^%QZCHW("  Choisissez une liste pour le traitement ..."),1,76-$X) S ($X,$Y)=0
 S LISTE=$$UN^%QUAPAGM I LISTE="" S ARMAP=1 G FINMAP
 
 D POCLEPA^%VVIDEO
 K TABC
 S TABC(1)="VISIBLE",TABC(2)="INVISIBLE"
 S MODAF=$$MES^%VZECHO($$^%QZCHW("traitement en mode")_" ","TABC")
 I (MODAF'="VISIBLE")&(MODAF'="INVISIBLE") S ARMAP=1 G FINMAP
 I MODAF="VISIBLE" S MODAF=2
 I MODAF="INVISIBLE" S MODAF=3
 S MODEX=2
 
 I '($$OKR^%INCOIN("BAPAGE")) S DEROUL="PROCEDURAL" G SUITGO
 D POCLEPA^%VVIDEO
 K TABC S TABC(1)="PROCEDURAL",TABC(2)="FAIBLEMENT PROCEDURAL",TABC(3)="ARBRE.RECUSATION"
 S DEROUL=$$MES^%VZECHO($$^%QZCHW("deroulement")_" : ","TABC")
 I ((DEROUL'="PROCEDURAL")&(DEROUL'="FAIBLEMENT PROCEDURAL"))&(DEROUL'="ARBRE.RECUSATION") S ARMAP=1 G FINMAP
SUITGO 
 D DEBUT^%TLBADEB(TRT,LISTE,DEROUL,MODAF,MODEX,ETUDE)
 S PORT=$$TABID^%INCOIN("TABTRA") C PORT
 S R=2
FINMAP 
 I R>0 D POCLEPA^%VVIDEO
 D DEP^%SGVAR("MAP")
 Q R

