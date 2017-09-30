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

;%LNKETU2^INT^1^59547,73870^0
CFETUD2 ;
 
 
 
 
 
 
 
SUP(NOM) 
 N %I,ADR,ETU,I
 S ETU=$$REP^%LNKETU
 I $$^%QSCALVA(ETU,NOM,"TYPE.ETUDE")'="CONFIGURATEUR" Q
 D MSG^%VZEATT($$^%QZCHW("Suppression en cours"))
 
 
 
 D SX^%QSGESTK(ETU,NOM),POCLEPA^%VVIDEO
 Q
 
 
 
CREER(NOM,COMM,RREF,IREF,LIEN,LIND,SF,ECH1,ECH2,TRANS) 
 N ETU
 D MSG^%VZEATT($$^%QZCHW("Sauvegarde de l'etude"))
 S ETU=$$REP^%LNKETU
 D PA("NOM",NOM)
 D PA("COMMENTAIRE",COMM)
 D PA("TYPE.ETUDE","CONFIGURATEUR")
 D PA("REPERTOIRE",RREF)
 D PA("INDIVIDU",IREF)
 D PA("LIEN.NOMENCLATURE",LIEN)
 D PA("LISTE.INDIVIDU",LIND)
 D PA("POCHE",SF)
 D PA("LISTE.ECHANGE.1",ECH1)
 D PA("LISTE.ECHANGE.2",ECH2)
 D PA("TRANSFERT.NOMENCLATURE",TRANS)
 D PA("DATE.CREATION",$$TEMPS^%QMDATE)
 Q
PA(ATR,VAL) 
 I VAL="" D PSV^%QSGESTI(ETU,NOM,ATR)
 D PA^%QSGESTI(ETU,NOM,ATR,VAL,1)
 Q
 
 
LOAD(NOM,RESUL) 
 N ETU,ADR
 S ETU=$$REP^%LNKETU
 S RESUL(1)=$$AT("NOM")
 S RESUL(2)=$$AT("COMMENTAIRE")
 S RESUL(3)=$$AT("REPERTOIRE")
 S RESUL(4)=$$AT("INDIVIDU")
 S RESUL(5)=$$AT("LIEN.NOMENCLATURE")
 S RESUL(6)=$$AT("LISTE.INDIVIDU")
 S RESUL(7)=$$AT("POCHE")
 S RESUL(8)=$$AT("LISTE.ECHANGE.1")
 S RESUL(9)=$$AT("LISTE.ECHANGE.2")
 S RESUL(10)=$$AT("TRANSFERT.NOMENCLATURE")
 Q
AT(ATR) 
 Q $$^%QSCALVA(ETU,NOM,ATR)
 
HELP(YY1) 
 N TEMP,LETU,NL,ETU,COL,CARD
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"HELP") K @(TEMP)
 S COL=$$CONCAS^%QZCHAD(TEMP,"COL")
 S LETU=$$CONCAS^%QZCHAD(TEMP,"LETU")
 S ETU=$$REP^%LNKETU
 
 D ^%VZEATT
 D ^%QSGES13(ETU,"TYPE.ETUDE","CONFIGURATEUR",1,LETU)
 S NL=$$NOM^%QSGES11("TMP")
 D COPY^%QSGES11(NL,ETU,.CARD,LETU)
 D CREER^%QSGES11(ETU,NL,"TMP",CARD,"SELCFX","","")
 
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
 
 S @COL@("C",1,"T")=$$^%QZCHW("Repertoire"),@COL@("C",1,"L")=15,@COL@("C",1,"C")="REPERTOIRE"
 S @COL@("C",2,"T")=$$^%QZCHW("Individu"),@COL@("C",2,"L")=15,@COL@("C",2,"C")="INDIVIDU"
 S @COL@("C",3,"T")=$$^%QZCHW("poche"),@COL@("C",3,"L")=15,@COL@("C",3,"C")="POCHE"
 S @COL@("C",4,"T")=$$^%QZCHW("lien nomencl"),@COL@("C",4,"L")=15,@COL@("C",4,"C")="LIEN.NOMENCLATURE"
 S @COL@("C",5,"T")=$$^%QZCHW("nomenc"),@COL@("C",5,"L")=6,@COL@("C",5,"C")="TRANSFERT.NOMENCLATURE"
 S @COL@("C",6,"T")=$$^%QZCHW("commentaire"),@COL@("C",6,"L")=15,@COL@("C",6,"C")="COMMENTAIRE"
 Q
 
AFF 
 D CLEPAG^%VVIDEO,AFF2,AFFICH^%QUAPAGM Q
AFF2 
 D ^%VZCD(0,39,0,2,1,0,NL_" ("_CARD_" "_$$NOMLOG^%QSF(ETU)_"s)") Q

