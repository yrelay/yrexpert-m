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

;%DLCON2^INT^1^59547,73867^0
DLCON2 ;
 
 
 
 
 
EXCONF() 
 N ADCONF
 S ADCONF=$$ADCONF^%DLCON1
 Q $D(@ADCONF)'=0
 
EXUSER() 
 N ADU
 S ADU=$$ADUSER^%DLCON1
 Q $D(@ADU)'=0
 
 
PARAM(P) 
 N ADU
 S ADU=$$ADUSER^%DLCON1
 Q $S($D(@ADU@(P)):@ADU@(P),1:"")
 
 
ART() 
 Q $$PARAM("ART")
GAMME() 
 Q $$PARAM("GAMME")
OP() 
 Q $$PARAM("OP")
 
MACH() 
 Q "POSTE.DE.TRAVAIL"
 
LAN() 
 N L
 S L=$$PARAM("LAN")
 S:L="" L=$$NOMINT^%QSF("LANCEMENT")
 Q L
 
 
RART() 
 Q $$PARAM("RART")
RGAMME() 
 Q $$PARAM("RGAMME")
ROP() 
 Q $$PARAM("ROP")
 
RMACH() 
 Q $$NOMLOG^%QSF("POSTE.DE.TRAVAIL")
 
RLAN() 
 N L
 S L=$$PARAM("RLAN")
 S:L="" L="LANCEMENT"
 Q L
 
 
AG() 
 Q $$PARAM("AG")
GA() 
 Q $$PARAM("GA")
GO() 
 Q $$PARAM("GO")
OG() 
 Q $$PARAM("OG")
LINV() 
 Q $$PARAM("LIENINV")
 
 
DESC() 
 Q $$PARAM("DESC")
NOFICHE() 
 Q $$PARAM("NOFICHE")
 
 
DUFAB() 
 Q "TEMPS.FABRICATION"
 
DELFAB() 
 Q "DUREE.FABRICATION"
 
DATEFIX() 
 Q "DATE.FIXE"
 
DUMONT() 
 N D
 S D=$$PARAM("DUMONT")
 S:D="" D="DUREE.MONTAGE"
 Q D
 
DELNEC() 
 N D
 S D=$$PARAM("DELNEC")
 S:D="" D="DELAI.OBTENU"
 Q D
 
MACHINE() 
 Q "MACHINE"
 
QUANTITE() 
 Q "QUANTITE"
 
CHARGE() 
 Q "CHARGE.PERIODE"
 
CAPACITE() 
 Q "CAPACITE.PERIODE"
 
CHARGAR() 
 Q "CHARGE"
 
REGIME() 
 Q "REGIME.POSTE"
 
FAMILLE() 
 Q "FAMILLE.TECHNOLOGIQUE"
 
DATEJAL() 
 N D
 S D=$$PARAM("DATJAL")
 S:D="" D="DATE.JALON"
 Q D
 
DELAI() 
 N D
 S D=$$PARAM("DELANC")
 S:D="" D="DELAI.DEMANDE"
 Q D
 
DUJAL() 
 N D
 S D=$$PARAM("DUJAL")
 Q:D="" "DUREE.JALON"
 Q D
 
 
STOCK(MODELE,NOFICHE) 
 N ADGR,ADUSER,AG,ART,ART1,ARTI,CH,DAT,DEL,DELANC,DUJAL,GA,GAMME,GAMME1,GO,LAN,LAN1,LINV,OG,OP
 S ADGR=$$ADGR^%DLCON1
 S ADUSER=$$ADUSER^%DLCON1
 S CH=@ADGR@(MODELE,NOFICHE)
 S ART=$P(CH,"^",1),AG=$P(CH,"^",2),GO=$P(CH,"^",3),LAN=$P(CH,"^",4)
 S DEL=$P(CH,"^",5),DAT=$P(CH,"^",6),DELANC=$P(CH,"^",8)
 S LINV=$P(CH,"^",9),DUJAL=$P(CH,"^",7)
 S ARTI=$$NOMINT^%QSF(ART)
 D LIENR^%QSGEL2(AG,.ART1,.GAMME)
 D LIENR^%QSGEL2(GO,.GAMME1,.OP)
 S GA=$$LIENI^%QSGEL4(AG)
 S OG=$$LIENI^%QSGEL4(GO)
 K @(ADUSER)
 S @ADUSER@("NOFICHE")=NOFICHE
 S @ADUSER@("ART")=ARTI
 S @ADUSER@("GAMME")=GAMME
 S @ADUSER@("OP")=OP
 S @ADUSER@("LAN")=$$NOMINT^%QSF(LAN)
 S @ADUSER@("AG")=AG
 S @ADUSER@("GO")=GO
 S @ADUSER@("GA")=GA
 S @ADUSER@("OG")=OG
 S @ADUSER@("DESC")=ART_"/"_AG_"/"_GO_"/"_LAN
 S @ADUSER@("RART")=ART
 S @ADUSER@("RGAMME")=$$NOMLOG^%QSF(GAMME)
 S @ADUSER@("ROP")=$$NOMLOG^%QSF(OP)
 S @ADUSER@("RLAN")=LAN
 S @ADUSER@("LIENINV")=LINV
 S DEL=$S(DEL="":"DELAI.OBTENU",1:DEL)
 S @ADUSER@("DELNEC")=DEL
 S DAT=$S(DAT="":"DATE.JALON",1:DAT)
 S @ADUSER@("DATJAL")=DAT
 S DELANC=$S(DELANC="":"DELAI.DEMANDE",1:DELANC)
 S @ADUSER@("DELANC")=DELANC
 S DUJAL=$S(DUJAL="":"DUREE.JALON",1:DUJAL)
 S @ADUSER@("DUJAL")=DUJAL
 
 D CREA^%QMDAITF(DELANC,LAN,3)
 D CREA^%QMDAITF(DEL,LAN,3)
 D CREA^%QMDAITF(DAT,LAN,3)
 D CREA^%QMDAITF($$DATEFIX,LAN,3)
 
 D CREA^%QMDAITF("DATE.LIMITE.DEBUT",$$NOMLOG^%QSF($$REP^%DLETUDE),3)
 Q

