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

;%SCOETU2^INT^1^59547,73888^0
SCOETU2 ;
 
 
 
 
 
 
 
SUP(NOM) 
 N %I,ADR,ETU,I
 S ETU=$$REP^%SCOETUD
 I $$^%QSCALVA(ETU,NOM,"TYPE.ETUDE")'="SAVOIR-COMPARER" Q
 D MSG^%VZEATT($$^%QZCHW("Suppression en cours"))
 
 
 
 D SX^%QSGESTK(ETU,NOM),POCLEPA^%VVIDEO
 Q
 
 
 
CREER(NOM,COMM,RREF,IREF,RCIB,LCIB,DOM,TO,ARPREM,IGNORE,OBLIG) 
 N ETU
 D MSG^%VZEATT($$^%QZCHW("Sauvegarde de l'etude"))
 S ETU=$$REP^%SCOETUD
 D PA("NOM",NOM)
 D PA("COMMENTAIRE",COMM)
 D PA("TYPE.ETUDE","SAVOIR-COMPARER")
 D PA("REPERTOIRE.REFERENCE",RREF)
 D PA("INDIVIDU.REFERENCE",IREF)
 D PA("REPERTOIRE.CIBLE",RCIB)
 D PA("LISTE.CIBLE",LCIB)
 D PA("TAUX.ACCORD",TO)
 D PA("DOMAINE",DOM)
 D PA("ARRET.SUR.PREMIER.INDIVIDU",ARPREM)
 I '($$^%QSCALVA(ETU,NOM,"DATE.CREATION")) D PA("DATE.CREATION",$$TEMPS^%QMDATE) Q
 D PA("DATE.MODIFICATION",$$TEMPS^%QMDATE) Q
 Q
PA(ATR,VAL) 
 I VAL="" D PSV^%QSGESTI(ETU,NOM,ATR)
 D PA^%QSGESTI(ETU,NOM,ATR,VAL,1)
 Q
 
 
LOAD(NOM,RESUL) 
 N ETU,ADR
 S ETU=$$REP^%SCOETUD
 S RESUL(1)=$$AT("NOM")
 S RESUL(2)=$$AT("COMMENTAIRE")
 S RESUL(3)=$$AT("REPERTOIRE.REFERENCE")
 S RESUL(4)=$$AT("INDIVIDU.REFERENCE")
 S RESUL(5)=$$AT("REPERTOIRE.CIBLE")
 S RESUL(6)=$$AT("LISTE.CIBLE")
 S RESUL(7)=$$AT("DOMAINE")
 S RESUL(8)=$$AT("TAUX.ACCORD")
 S RESUL(9)=$$AT("ARRET.SUR.PREMIER.INDIVIDU")
 Q
AT(ATR) 
 Q $$^%QSCALVA(ETU,NOM,ATR)
 
HELP(YY1) 
 N TEMP,LETU,NL,ETU,COL,CARD
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"HELP") K @(TEMP)
 S COL=$$CONCAS^%QZCHAD(TEMP,"COL")
 S LETU=$$CONCAS^%QZCHAD(TEMP,"LETU")
 S ETU=$$REP^%SCOETUD
 
 D ^%VZEATT
 D ^%QSGES13(ETU,"TYPE.ETUDE","SAVOIR-COMPARER",1,LETU)
 S NL=$$NOM^%QSGES11("TMP")
 D COPY^%QSGES11(NL,ETU,.CARD,LETU)
 D CREER^%QSGES11(ETU,NL,"TMP",CARD,"SELSCX","","")
 
 D COL(COL)
 D INIT^%QUAPAGM(COL),AFF
 
 S YY1=$$UN^%QUAPAGM
 D END^%QUAPAGM
 D DEL^%QSGES11(NL)
 K @(TEMP)
 I YY1="" Q 0
 Q 1
COL(COL) 
 S @COL@("X")=0,@COL@("Y")=3,@COL@("L")=79,@COL@("H")=20
 
 S @COL@("LIS")=NL,@COL@("B")=ETU,@COL@("A")=$$ADRLIS^%QSGEST7(NL)
 S @COL@("ATT")=1,@COL@("LR")=13
 S @COL@("AFF")="AFF2^%DLETUD2",@COL@("ECRAN")="AFF^%DLETUD2",@COL@("PADLINE")="POCLEPA^%VVIDEO"
 
 S @COL@("C",1,"T")=$$^%QZCHW("Rep.reference"),@COL@("C",1,"L")=15,@COL@("C",1,"C")="REPERTOIRE.REFERENCE"
 S @COL@("C",2,"T")=$$^%QZCHW("Ind.reference"),@COL@("C",2,"L")=15,@COL@("C",2,"C")="INDIVIDU.REFERENCE"
 S @COL@("C",3,"T")=$$^%QZCHW("Rep.cible"),@COL@("C",3,"L")=15,@COL@("C",3,"C")="REPERTOIRE.CIBLE"
 S @COL@("C",4,"T")=$$^%QZCHW("Liste cible"),@COL@("C",4,"L")=11,@COL@("C",4,"C")="LISTE.CIBLE"
 S @COL@("C",5,"T")=$$^%QZCHW("Domaine"),@COL@("C",5,"L")=15,@COL@("C",5,"C")="DOMAINE"
 S @COL@("C",6,"T")=$$^%QZCHW("Taux"),@COL@("C",6,"L")=4,@COL@("C",6,"C")="TAUX.ACCORD"
 S @COL@("C",7,"T")=$$^%QZCHW("Arret 1er"),@COL@("C",7,"L")=9,@COL@("C",7,"C")="ARRET.SUR.PREMIER.INDIVIDU"
 Q
 
AFF 
 D CLEPAG^%VVIDEO,AFF2,AFFICH^%QUAPAGM Q
AFF2 
 D ^%VZCD(0,39,0,2,1,0,NL_" ("_CARD_" "_$$NOMLOG^%QSF(ETU)_"s)") Q

