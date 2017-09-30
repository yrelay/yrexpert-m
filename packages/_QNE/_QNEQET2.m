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

;%QNEQET2^INT^1^59547,73879^0
QNEQET2 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CREER(NOM,COMM,REP,GAMME,L,CYC,DMULT,CATT,INSEP,INCOMP,TAL,TAG,LAG,LAI) 
 N ETU
 D MSG^%VZEATT($$^%QZCHW("Sauvegarde de l'etude"))
 S ETU=$$REP^%QNEQETU
 D PA("NOM",NOM)
 D PA("COMMENTAIRE",COMM)
 D PA("TYPE.ETUDE","EQUILIBRAGE")
 I REP="" S REP="GAMME"
 D PA("REPERTOIRE.GAMME",REP)
 D PA("NOM.GAMME",GAMME)
 D PA("LISTE.OPERATIONS.GAMME",L)
 D PA("CYCLE",CYC)
 D PA("EFFECTIF.MAX.PAR.POSTE",DMULT)
 D PA("ATTRIBUT.CAPACITE",CATT)
 D PA("LISTE.GROUPES.INSEPARABLES",INSEP)
 D PA("LISTE.GROUPES.INCOMPATIBLES",INCOMP)
 D PA("TRAITEMENT.ACCEPTATION.LOCAL",TAL)
 D PA("TRAITEMENT.ACCEPTATION.GLOBAL",TAG)
 D PA("LISTE.ATTRIBUTS.GROUPES",LAG)
 D PA("LISTE.ATTRIBUTS.INDIVIDUS",LAI)
 D PA("DATE.CREATION",$$TEMPS^%QMDATE)
 D PA("NOMBRE.OPERATIONS.GAMME",$$CARD^%QSGEST7(L))
 D OFF^%VZEATT
 Q
PA(ATR,VAL) 
 I VAL="" D PSV^%QSGESTI(ETU,NOM,ATR)
 D PA^%QSGESTI(ETU,NOM,ATR,VAL,1)
 Q
 
 
LOAD(NOM,RESUL) 
 N ETU
 S ETU=$$REP^%QNEQETU
 S RESUL(1)=$$AT("NOM")
 S RESUL(2)=$$AT("COMMENTAIRE")
 S RESUL(3)=$$AT("REPERTOIRE.GAMME")
 I RESUL(3)="" S RESUL(3)="GAMME" D PA("REPERTOIRE.GAMME",RESUL(3))
 S RESUL(4)=$$AT("NOM.GAMME")
 S RESUL(5)=$$AT("LISTE.OPERATIONS.GAMME")
 S RESUL(6)=$$AT1("CYCLE",1)
 S RESUL(7)=$$AT1("ATTRIBUT.CAPACITE",1)
 S RESUL(8)=$$AT("EFFECTIF.MAX.PAR.POSTE")
 S RESUL(9)=$$AT("LISTE.GROUPES.INSEPARABLES")
 S RESUL(10)=$$AT("LISTE.GROUPES.INCOMPATIBLES")
 S RESUL(11)=$$AT("TRAITEMENT.ACCEPTATION.LOCAL")
 S RESUL(12)=$$AT("TRAITEMENT.ACCEPTATION.GLOBAL")
 S RESUL(13)=$$AT("LISTE.ATTRIBUTS.GROUPES")
 S RESUL(14)=$$AT("LISTE.ATTRIBUTS.INDIVIDUS")
 Q
AT(ATR) 
 Q $$^%QSCALVA(ETU,NOM,ATR)
AT1(AT,INDICE) 
 Q $$^%QSCALIN(ETU,NOM,AT,INDICE)
 
 
HELP(YY1,MODE) 
 
 
 
 N TEMP,LETU,NL,ETU,COL,CARD
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"HELP") K @(TEMP)
 S COL=$$CONCAS^%QZCHAD(TEMP,"COL")
 S LETU=$$CONCAS^%QZCHAD(TEMP,"LETU")
 S ETU=$$REP^%QNEQETU
 
 D ^%VZEATT
 D ^%QSGES13(ETU,"TYPE.ETUDE","EQUILIBRAGE",1,LETU)
 S NL=$$NOM^%QSGES11("TMP")
 D COPY^%QSGES11(NL,ETU,.CARD,LETU)
 D CREER^%QSGES11(ETU,NL,"TMP",CARD,"SELEQL","","")
 
 D COL(COL)
 D INIT^%QUAPAGM(COL),AFF
 
 I MODE=0 S YY1=$$UN^%QUAPAGM
 I MODE=1 D ENS^%QUAPAGM(YY1)
 D END^%QUAPAGM
 D DEL^%QSGES11(NL)
 D FIN
 I MODE=0,YY1="" Q 0
 Q 1
FIN K @(TEMP) Q
COL(COL) 
 S @COL@("X")=0,@COL@("Y")=3,@COL@("L")=79,@COL@("H")=20
 
 S @COL@("LIS")=NL,@COL@("B")=ETU,@COL@("A")=$$ADRLIS^%QSGEST7(NL)
 S @COL@("ATT")=1,@COL@("LR")=13
 S @COL@("AFF")="AFF2^%QNEQET2",@COL@("ECRAN")="AFF^%QNEQET2",@COL@("PADLINE")="POCLEPA^%VVIDEO"
 
 S @COL@("C",1,"T")=$$^%QZCHW("Gamme"),@COL@("C",1,"L")=15,@COL@("C",1,"C")="NOM.GAMME"
 S @COL@("C",2,"T")=$$^%QZCHW("Attribut.capacite"),@COL@("C",2,"L")=15,@COL@("C",2,"C")="ATTRIBUT.CAPACITE"
 S @COL@("C",3,"T")=$$^%QZCHW("Commentaire"),@COL@("C",3,"L")=15,@COL@("C",3,"C")="COMMENTAIRE"
 S @COL@("C",4,"T")=$$^%QZCHW("Nb.indiv"),@COL@("C",4,"L")=6,@COL@("C",4,"C")="NOMBRE.OPERATIONS.GAMME"
 S @COL@("C",5,"T")=$$^%QZCHW("Cycle"),@COL@("C",5,"L")=6,@COL@("C",5,"C")="CYCLE"
 S @COL@("C",6,"T")=$$^%QZCHW("Liste.entree"),@COL@("C",6,"L")=12,@COL@("C",6,"C")="LISTE.OPERATIONS.GAMME"
 S @COL@("C",7,"T")=$$^%QZCHW("Liste.incompatibles"),@COL@("C",7,"L")=12,@COL@("C",7,"C")="LISTE.GROUPES.INCOMPATIBLES"
 S @COL@("C",8,"T")=$$^%QZCHW("Liste.inseparables"),@COL@("C",8,"L")=12,@COL@("C",8,"C")="LISTE.GROUPES.INSEPARABLES"
 S @COL@("C",9,"T")=$$^%QZCHW("Trt.accept.local"),@COL@("C",9,"L")=15,@COL@("C",9,"C")="TRAITEMENT.ACCEPTATION.LOCAL"
 S @COL@("C",10,"T")=$$^%QZCHW("Trt.accept.global"),@COL@("C",10,"L")=15,@COL@("C",10,"C")="TRAITEMENT.ACCEPTATION.GLOBAL"
 Q
 
AFF 
 D CLEPAG^%VVIDEO,AFF2,AFFICH^%QUAPAGM Q
AFF2 
 D ^%VZCD(0,39,0,2,1,0,NL_" ("_CARD_" "_$$NOMLOG^%QSF(ETU)_"s)") Q

