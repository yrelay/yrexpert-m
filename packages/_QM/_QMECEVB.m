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

;%QMECEVB^INT^1^59547,73878^0
QMCEVA ;
 N REPNOE,NOEINI,NOEUD,NIVEAU,NIVPRE,RESULT,ABANDON,LISVID,DERN
 N INDETD,REPETD,LISETD,TEMPO,ORIG,TABC,BA,OBJ,CXT,PILE,TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S PILE=$$CONCAS^%QZCHAD(TEMP,"PILE")
DEBUT 
 K @(PILE) S ABANDON=0
 
 D INIAFF(.REPNOE,.NOEINI,.REPETD,.INDETD)
 I ABANDON D ENDAF Q
 
 D INIT^%QMECNOE(REPETD,INDETD,.LISETD)
 
 
 
 
 
 D INIRES^%QMECTRA(NOEINI)
 S NIVEAU=0,NIVPRE=0,RESULT=0,NOEUD=NOEINI
BCLNOE 
 S LISVID=0
 I NIVEAU<NIVPRE G SELECT
 D EXPL^%QMECNOE(NOEUD,.ABANDON,.RESULT,LISETD)
 S @PILE@(NIVEAU)=NOEUD,NIVEAU=NIVEAU+1
 I '(ABANDON) D INLISR^%QMECTRA(NIVEAU,NOEUD,.LISVID)
SELECT 
 S NIVPRE=NIVEAU,DERN=1
 I LISVID S RESULT=1 G EPILO
 I ('(RESULT))&('(ABANDON)) D CDSVR^%QMECTRA(NIVEAU,.NOEUD,.DERN)
EPILO 
 I '(DERN) G FINBNO
 S NIVEAU=NIVEAU-1,NOEUD=@PILE@(NIVEAU)
FINBNO 
 I NIVEAU'=0 G BCLNOE
 
 K TABC
 S TABC(1)="INDIVIDU COURANT",TABC(2)="VARIABLES LOCALES"
BCLACC 
 D POCLEPA^%VVIDEO
 S CHOIX=$$^%VZECHO("TABC")
 I (CHOIX=1)!(CHOIX=6) G FACC
 I (CHOIX'["COURANT")&(CHOIX'["LOCALES") D ^%VSQUEAK G BCLACC
 I CHOIX["COURANT" S BA=CXT("@","BASE"),OBJ=CXT("@","OBJET")
 I CHOIX["LOCALES" S BA=CXT("%","BASE"),OBJ=CXT("%","OBJET")
 D MODE^%QSATTRI(OBJ,BA,0,11,80,12,0)
 G BCLACC
FACC 
 K @(PILE)
 D FIN^%QMECNOE(LISETD)
 D ENDAF
 G DEBUT
 
INIAFF(REPNOE,NOEINI,REPETD,INDETD) 
 N VAL,CTR,ACREER
 S REPNOE="NOEUD.I",ACREER=0
 D CLEPAG^%VVIDEO
 D ^%VZCD(0,39,0,2,1,0,"EVALUATION INTERACTIVE")
 D CREER^%TLBAGF1("EVA",0,3,8,80,80,0,"",1,"")
 D REAF^%TLBAGF1("EVA",0)
BDNOE 
 S NOEINI=""
 D GET^%TLBAGF3("EVA",$$^%QZCHW("noeud initial")_"      : ",1,.NOEINI,.CTR)
 I (CTR'="")!(NOEINI="") S ABANDON=1 Q
 I NOEINI'="?" G VERNOE
 D INIT^%QUCHOIP($$LISTIND^%QSGEST6(REPNOE),1,"",21,11,59,7)
 D AFF^%QUCHOIP
 S NOEINI=$$UN^%QUCHOIP
 D END^%QUCHOIP
 I NOEINI="" S ABANDON=1 Q
 D ADD^%TLBAGF3("EVA",$$^%QZCHW("noeud initial")_"      : "_NOEINI,1)
VERNOE 
 I $$IR^%QSGEST5(REPNOE,NOEINI) G BDRET
 D ^%VZEAVT($$^%QZCHW("ce noeud n'existe pas")) G BDNOE
BDRET 
 S REPETD="",INDETD=""
 D GET^%TLBAGF3("EVA",$$^%QZCHW("repertoire d'etude")_" : ",2,.REPETD,.CTR)
 I CTR'="" S ABANDON=1 Q
 I REPETD="" S REPETD="ETUDE",INDETD=$$GEN^%QCAPOP("ETD"),ACREER=1 G VERET
 I REPETD'="?" G VERET
 D INIT^%QUCHOIP("^RQSAUTOR(WHOIS)",1,"",0,11,20,7)
 D AFF^%QUCHOIP
 S REPETD=$$UN^%QUCHOIP
 D END^%QUCHOIP
 I REPETD="" S ABANDON=1 Q
 D ADD^%TLBAGF3("EVA",$$^%QZCHW("repertoire d'etude")_" : "_REPETD,2)
VERET 
 S REPETD=$$NOMINT^%QSF(REPETD)
 I '($$REP^%QSGEST5(REPETD)) D ^%VZEAVT($$^%QZCHW("ce repertoire n'existe pas")) G BDRET
BDIET 
 I ACREER G ACREER
 S INDETD=""
 D GET^%TLBAGF3("EVA",$$^%QZCHW("individu d'etude")_"   : ",3,.INDETD,.CTR)
 I CTR'="" S ABANDON=1 Q
 I INDETD'="?" G VERIET
 I $$REPVID^%QSGEST5(REPETD) D ^%VZEAVT($$^%QZCHW("le repertoire est vide")) G BDIET
 D INIT^%QUCHOIP($$LISTIND^%QSGEST6(REPETD),1,"",21,11,59,7)
 D AFF^%QUCHOIP
 S INDETD=$$UN^%QUCHOIP
 D END^%QUCHOIP
 I INDETD="" G BDIET
 D ADD^%TLBAGF3("EVA",$$^%QZCHW("individu d'etude")_"   : "_INDETD,3)
VERIET 
 I $$IR^%QSGEST5(REPETD,INDETD) G FINAF
 D POCLEPA^%VVIDEO
 I '($$MES^%VZEOUI($$^%QZCHW("cet individu n'existe pas, voulez-vous le creer")_" ? ","O")) G BDIET
ACREER 
 D PA^%QSGESTI(REPETD,INDETD,"NOM",INDETD,1)
FINAF 
 S DX=0,DY=11 D CLEBAS^%VVIDEO
 Q
ENDAF 
 D TUER^%TLBAGF1("EVA")
 D CLEPAG^%VVIDEO
 Q

