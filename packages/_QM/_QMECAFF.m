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

;%QMECAFF^INT^1^59547,73878^0
QMECAFF ;
INAF 
 D CREER^%TLBAGF1("EVA",0,3,8,80,80,0,"",1,"")
 S REPNOE="NOEUD.I",LIENOE="TRANSITION"
 Q
REAF 
 D CLEPAG^%VVIDEO,80^%VVIDEO
 D ^%VZCD(0,39,0,2,1,0,"EVALUATION INTERACTIVE")
 D REAF^%TLBAGF1("EVA",0)
 Q
AFFLIG 
 D ADD^%TLBAGF3("EVA",$$^%QZCHW("noeud initial")_"    : "_NOEINI,1)
 D ADD^%TLBAGF3("EVA",$$^%QZCHW("repertoire focus")_" : "_REPFOC,2)
 D ADD^%TLBAGF3("EVA",$$^%QZCHW("individu focus")_"   : "_INDFOC,3)
 Q
ENDAF 
 D TUER^%TLBAGF1("EVA")
 D CLEPAG^%VVIDEO
 Q
 
INIAFF(REPNOE,NOEINI,REPFOC,INDFOC) 
 N VAL,CTR,GLOB,MSG
 S (NOEINI,REPFOC,INDFOC)=""
 D INAF,REAF,AFFLIG
BDNOE 
 S NOEINI=""
 D GET^%TLBAGF3("EVA",$$^%QZCHW("noeud initial")_"    : ",1,.NOEINI,.CTR)
 I (CTR'="")!(NOEINI="") S ABANDON=1 Q
 I NOEINI'="?" G VERNOE
 D INIT^%QUCHOIP($$LISTIND^%QSGEST6(REPNOE),1,"",21,11,59,7)
 D AFF^%QUCHOIP
 S NOEINI=$$UN^%QUCHOIP
 D END^%QUCHOIP
 I NOEINI="" S ABANDON=1 Q
 D AFFLIG
VERNOE 
 I $$IR^%QSGEST5(REPNOE,NOEINI) G BDRET
 D ^%VZEAVT($$^%QZCHW("ce noeud n'existe pas")) G BDNOE
BDRET 
 S REPFOC="",INDFOC=""
 D GET^%TLBAGF3("EVA",$$^%QZCHW("repertoire focus")_" : ",2,.REPFOC,.CTR)
 I CTR'="" S ABANDON=1 Q
 I REPFOC="" G BDNOE
 I REPFOC'="?" G VERET
 D INIT^%QUCHOIP("^[QUI]RQSAUTOR(WHOIS)",1,"",0,11,20,7)
 D AFF^%QUCHOIP
 S REPFOC=$$UN^%QUCHOIP
 D END^%QUCHOIP
 I REPFOC="" S ABANDON=1 Q
 D AFFLIG
VERET 
 S REPFOC=$$NOMINT^%QSF(REPFOC)
 I '($$REP^%QSGEST5(REPFOC)) D ^%VZEAVT($$^%QZCHW("ce repertoire n'existe pas")) G BDRET
 I REPFOC=$$REPETD^%QMECNOE G FINAF
 D LIEN^%QSGEL2(REPFOC,$$NOMINT^%QSF("ETUDE"),"GLOB")
 
 D POCLEPA^%VVIDEO
BDIET 
 S INDFOC=""
 D GET^%TLBAGF3("EVA",$$^%QZCHW("individu focus")_"   : ",3,.INDFOC,.CTR)
 I CTR'="" S ABANDON=1 Q
 I INDFOC="" G BDRET
 I INDFOC'="?" G VERIET
 I $$REPVID^%QSGEST5(REPFOC) D ^%VZEAVT($$^%QZCHW("le repertoire est vide")) G BDIET
 D INIT^%QUCHOIP($$LISTIND^%QSGEST6(REPFOC),1,"",21,11,59,7)
 D AFF^%QUCHOIP
 S INDFOC=$$UN^%QUCHOIP
 D END^%QUCHOIP
 I INDFOC="" G BDIET
 D AFFLIG
VERIET 
 I $$IR^%QSGEST5(REPFOC,INDFOC) G FINAF
 D POCLEPA^%VVIDEO
 I '($$MES^%VZEOUI($$^%QZCHW("cet individu n'existe pas, voulez-vous le creer")_" ?  ","O")) G BDIET
 D POCLEPA^%VVIDEO
 I $$CREER^%QSGEIND(REPFOC,INDFOC,"",1,.MSG) D ^%VZEAVT(MSG) G BDIET
FINAF 
 S DX=0,DY=11 D CLEBAS^%VVIDEO
 Q
 
AFNOTE(XC,YC,LA,HA,REP,IND,ATT,VAL,ORD) 
 N TEMP,I,J,LIGNE
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"NOTE") K @(TEMP)
 D CREER^%TLBAGF1("NOTE",XC,YC,HA,LA,80,0,TEMP,1,VAL)
 D REAF^%TLBAGF1("NOTE",0)
 S J="",I=1
BCTRN 
 S J=$O(^[QUI]QUERYT(REP,IND,ORD,"LIGNE",J))
 I J="" G VISU
 S LIGNE=^[QUI]QUERYT(REP,IND,ORD,"LIGNE",J)
 D SUBST(.LIGNE)
 S @TEMP@(I)=LIGNE
 S I=I+1
 G BCTRN
VISU 
 D REAFF^%QULIMO3(1,1,TEMP,XC,YC,LA,HA)
 D VISU^%QULIMO(XC,YC,LA,HA,TEMP,1)
 K @(TEMP)
 Q
SUBST(LIG) 
 N DEBA,FINA,ATTS,INDS,CAR,FINS,REP,INDIV
BCSUB 
 S DEBA=$F(LIG,"@")
 I DEBA=0 Q
 S (ATTS,INDS,CAR)="",DEBA=DEBA-1,FINA=DEBA
BCATT 
 S FINA=FINA+1 I FINA>$L(LIG) G FRATT
 S CAR=$E(LIG,FINA)
 I (((((CAR'=" ")&(CAR'="^"))&(CAR'="("))&(CAR'=","))&(CAR'=";"))&(CAR'=".") G BCATT
FRATT 
 S ATTS=$E(LIG,DEBA+1,FINA-1)
 I CAR'="(" G LECV
 S FINS=FINA
BCIND 
 S FINS=FINS+1 I FINS>$L(LIG) G FRIND
 S CAR=$E(LIG,FINS)
 I CAR'=")" G BCIND
FRIND 
 I CAR=")" S INDS=$E(LIG,FINA+1,FINS-1),FINA=FINS
LECV 
 S REP=CXT("@","BASE"),INDIV=CXT("@","OBJET")
 I $E(ATTS)="%" S REP=CXT("%","BASE"),INDIV=CXT("%","OBJET")
 S LIG=$E(LIG,1,DEBA-1)_$$^%QSCALIN(REP,INDIV,ATTS,INDS)_$E(LIG,FINA,$L(LIG))
 G BCSUB

