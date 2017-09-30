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
;! Nomprog     : %TLDIALA                                                     !
;! Module      : TRAITEMENTS sur LISTES                                       !
;! But         : Activer le traitement                                        !
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

;%TLDIALA^INT^1^59547,74028^0
%TLDIALA ;;12:16 PM  9 Nov 1992; ; 10 Nov 92  6:30 PM
 
 
 
 
 
 
RUNACT(SIND) ;activer
 N BID,I,LISTE,MODAF,MODEX,R,TRAIT,TABC,DER,TABISEL,JRN
 S TABISEL=$$TEMP^%SGUTIL
 S R=1
 S (Y1,TRAIT)=$$GET^%TLDIAL2("Traitement : ",.R)
 I Y1="" Q R
 D:(R=2)&(ICI="TLDIALO") REAFF^%QS0DP
 D:ICI="TLMENUG" REAFF^%TLMENUG
 
 ;HL002 D BLD^%VVIDEO,BLK^%VVIDEO,REV^%VVIDEO,POCLEPA^%VVIDEO W " ",$E(Y1_"  ",1,76-$X) D NORM^%VVIDEO W $E($$^%QZCHW("  Choisissez une liste pour le traitement ..."),1,76-$X)
 D BLD^%VVIDEO,BLK^%VVIDEO,REV^%VVIDEO,POCLEPA^%VVIDEO W " ",$E(Y1_"  ",1,76-$X) D NORM^%VVIDEO W $E($$^%QZCHW("  Choisissez une liste pour le traitement ..."),1,76-$X) S ($X,$Y)=0
 S LISTE=$$UN^%QUAPAGM I LISTE="" Q 0
 
 S ^DERLISTE($I)=LISTE
 D L0
 I (BID=1)!(BID=6) G @("ACT"_BID)
 
 D DER
 
 I ($E(DER,1)'="P")&($E(DER,1)'="F") G ACT1
 I '(SIND) G L0B
 
 S CTR=""
 K @(TABISEL)
 
 D SELREP^%QS0LECR(LISTE,2,TABISEL,.CTR,1)
 I CTR="A" Q 2
 I $D(@TABISEL)<10 Q 2
L0B F I="S","V","I" I I=BID G @("ACT"_I)
 F I="S","R" I I=BID G @("ACT"_I)
 
ACT1 S R2=$S(SIND:2,1:1) Q R2
ACT6 G ACT1
ACTI S MODAF=0,MODEX=0 G GOACT
ACTR S MODAF=0,MODEX=0 G GOACT
ACTS S MODAF=1,MODEX=1 G GOACT
ACTV S MODAF=1,MODEX=0
GOACT 
 D POCLEPA^%VVIDEO
 I MODAF=0 D CLEPAG^%VVIDEO S DX=1,DY=1 X XY W $$^%QZCHW("Traitement en cours...")
 I $E(DER,1)="P" G BANAL
 
 D DEBUT^%TLBADEB(TRAIT,LISTE,DER,MODAF,MODEX,"") G FACT
 
BANAL 
 I SIND'=1 S DX=$$ACTIVL^%TLIACTI(TRAIT,LISTE,MODAF,MODEX) G BANAL2
 S RESACT=$$ACTIVS^%TLIACTI(TRAIT,LISTE,MODAF,MODEX,TABISEL)
BANAL2 S PORT=$$TABID^%INCOIN("TABTRA") C PORT
FACT G:SIND RECOM
FIN 
 
 
 S R2=2
 D END^%QUAPAGM,INIT^%QUAPAGM(FEN)
 Q R2
 
RECOM K @(TABISEL)
 
 D SELREP^%QS0LECR(LISTE,2,TABISEL,.CTR,1)
 I CTR="A" G FIN
 I $D(@TABISEL)<10 G FIN
 G GOACT
 
 
L0 D POCLEPA^%VVIDEO
 
 S TABC(1)="REEL",TABC(2)="SIMULATION"
 S BID=$E($$MES^%VZECHO($$^%QZCHW("Traitement en mode "),"TABC"),1)
 I BID'="S" S WHOIS("ETUDE")=0
 I BID="S" D INIETU^%QXPETU($J,"TRAITEMENT",2) S BID="I" D AVANTI^%QXPETU(WHOIS("ETUDE"))
 Q
 
DER S DER="PROCEDURAL" D SESSCOMP^%TLOGCMP Q
 
 
 
 
 
 
 
 
 
JRN 
 ;
 ;
 ;
 ;
 ;
 ;

