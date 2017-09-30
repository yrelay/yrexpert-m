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

;%QMCPSF^INT^1^59547,73876^0
QMCPSF(SF,SFI,SFL) 
 
 
 
 
 
 N ADR,ADRES,CONTR,CTR,FEN,LCOUR,MEN,MENU,MES,TEMP,TYP,ENSEM
 N WHOIS2,QUI1,QUI2,WHOIS1,I,OB
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S ENSEM=$$CONCAS^%QZCHAD(TEMP,"ENSEM")
 S MENU=$$CONCAS^%QZCHAD(TEMP,"MENU")
 S WHOIS1=WHOIS
 S @MENU="23^10^79"
 S @MENU@(1)=$$^%QZCHW("Selection")_"^SELEC"
 S @MENU@(1,"COM")=$$^%QZCHW("Copie apres selection des")_" "_SFI_"s"
 S @MENU@(2)=$$^%QZCHW("Tous")_"^TOUS"
 S @MENU@(2,"COM")=$$^%QZCHW("Copie de tous les")_" "_SFI_"s"
ACTU D CLEPAG^%VVIDEO,^%VZCD(0,39,0,4,1,0,$$^%QZCHW("COPIE DE")_" "_$$^%QZCHW(SFI)_"s")
 I ($O(@SFL@(""))="z")!($O(@SFL@(""))="") D ^%VZEAVT($$^%QZCHW("pas de")_" "_SFI_" "_$$^%QZCHW("a copier")) G END
 S WHOIS2=$$WHOIS2(WHOIS,.QUI1,.QUI2)
 I WHOIS2="" K @(TEMP) Q
 D POCLEPA^%VVIDEO
 D ^%VQUIKMN(0,80,22,MENU,.ADR,.CTR) G:(CTR="A")!(CTR="F") END G:ADR'="" @ADR G ACTU
END K @(TEMP) Q
TOUS 
 S OB=$O(@SFL@(""))
 F I=0:0 Q:(OB="")!(OB="z")  S @ENSEM@(OB)=OB,OB=$O(@SFL@(OB))
 D COPIE(SF,SFL,WHOIS1,QUI1,ENSEM,WHOIS2,QUI2)
 G ACTU
 
SELEC 
 I '($D(@SFL)) D ^%VZEAVT($$^%QZCHW("Il n'existe plus de")_" "_SFI) G END
 K @(ENSEM)
 D INIT^%QUCHOIP(SFL,1,"",0,5,80,17),AFF^%QUCHOIP
 D ^%QUCHOYP(ENSEM),END^%QUCHOIP
 I $D(@ENSEM)=0 G END
 D COPIE(SF,SFL,WHOIS1,QUI1,ENSEM,WHOIS2,QUI2)
 G ACTU
 
WHOIS2(WHOIS1,QUI1,QUI2) 
 N CTR,WHOIS2
WHOIS1 D LIRE1^%VREAD(WHOIS_" "_$$^%QZCHW("est le service origine. Service destination ?")_" : ","",0,23,.CTR,.WHOIS2)
 I CTR="A" Q ""
 I WHOIS2="" Q ""
 S QUI1=$$TABIDI^%INCOIN(WHOIS1,"MACHINE")
 S QUI2=$$TABIDI^%INCOIN(WHOIS2,"MACHINE")
 I WHOIS1'=WHOIS2,QUI2=QUI1 D ^%VZEAVT(QUI2_" "_$$^%QZCHW("partition de donnees de")_" "_WHOIS2_" "_$$^%QZCHW("doit etre differente de")_" "_QUI1_" "_$$^%QZCHW("partition de donnees de")_" "_WHOIS1) G WHOIS1
 I QUI2="" D ^%VZEAVT(WHOIS2_" "_$$^%QZCHW("n'existe pas")) G WHOIS1
 Q WHOIS2
 
 
COPIE(SF,SFL,WHOIS1,QUI1,ENSEM,WHOIS2,QUI2) 
 N TEMP,ENSEM1,OK,XMODE,PASSE
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"COPIE") K @(TEMP)
 S ENSEM1=$$CONCAS^%QZCHAD(TEMP,"ENSEM1")
 S OK=$$RENOM^%QMCPSF2(SF,SFL,WHOIS1,QUI1,ENSEM,WHOIS2,QUI2,ENSEM1)
 I '(OK) Q
 S XMODE=1,PASSE=0
 
 I SF="RQS" D RQS^%QMCPSF1(WHOIS1,QUI1,ENSEM1,WHOIS2,QUI2,XMODE,PASSE) G FCOP
 
 I SF="TTL" D TTL^%QMCPSF1(WHOIS1,QUI1,ENSEM1,WHOIS2,QUI2,XMODE,PASSE) G FCOP
 
 I SF="EDF" D EDF^%QMCPSF1(WHOIS1,QUI1,ENSEM1,WHOIS2,QUI2,XMODE,PASSE) G FCOP
 
 I SF="EDM" D EDM^%QMCPSF1(WHOIS1,QUI1,ENSEM1,WHOIS2,QUI2,XMODE,PASSE) G FCOP
 
 I SF="QSET" D QSETAT^%QMCPSF1(WHOIS1,QUI1,ENSEM1,WHOIS2,QUI2,XMODE,PASSE) G FCOP
 
 I SF="ABA" D ABA^%QMCPSF1(WHOIS1,QUI1,ENSEM1,WHOIS2,QUI2,XMODE,PASSE) G FCOP
 
 I SF="QAX" D QAX^%QMCPSF1(WHOIS1,QUI1,ENSEM1,WHOIS2,QUI2,XMODE,PASSE) G FCOP
 
 I SF="JAL" D JAL^%QMCPSF1(WHOIS1,QUI1,ENSEM1,WHOIS2,QUI2,XMODE,PASSE) G FCOP
 
 I SF="SCX" D SCX^%QMCPSF1(WHOIS1,QUI1,ENSEM1,WHOIS2,QUI2,XMODE,PASSE) G FCOP
 
 I SF="ATPR" D ATPR^%QMCPSF2(WHOIS1,QUI1,ENSEM1,WHOIS2,QUI2,XMODE,PASSE) G FCOP
 
 I SF="LEX" D LEX^%QMCPSF1(WHOIS1,QUI1,ENSEM1,WHOIS2,QUI2,XMODE,PASSE)
 G FCOP
FCOP K @(TEMP) Q
 
RQS D QMCPSF("RQS",$$^%QZCHW("requete"),"^[QUI]RQS1") Q
TTL 
 
 
 D QMCPSF("TTL",$$^%QZCHW("traitement"),"^[QUI]TTL")
 Q
EDF D QMCPSF("EDF",$$^%QZCHW("format"),"^[QUI]EDFORMAT") Q
EDM D QMCPSF("EDM",$$^%QZCHW("modele de texte"),"^[QUI]EDMOD") Q
QSET D QMCPSF("QSET",$$^%QZCHW("etat"),"^[QUI]QSETAT") Q
ABA D QMCPSF("ABA",$$^%QZCHW("abaque"),"^[QUI]STRUCT") Q
QAX D QMCPSF("QAX",$$^%QZCHW("code de synonymie"),"^[QUI]ZSYNONY") Q
LEX D QMCPSF("LEX",$$^%QZCHW("mot"),"^[QUI]TOLEX") Q
SCX D QMCPSF("SCX",$$^%QZCHW("domaine"),"^[QUI]SCOMDOM") Q
ATPR D QMCPSF("ATPR",$$^%QZCHW("attribut predefini"),"^[QUI]RQSATPR") Q
JAL N LCHOIX,FAM,%FAM
 S LCHOIX=$$TEMP^%QZCHAD("UNION","JALON")
 K @(LCHOIX)
 S FAM=""
 F %FAM=0:0 S FAM=$O(^[QUI]ADLJ(FAM)) Q:FAM=""  S @LCHOIX@(FAM)=""
 F %FAM=0:0 S FAM=$O(^[QUI]CDLJ(FAM)) Q:FAM=""  S @LCHOIX@(FAM)=""
 D QMCPSF("JAL",$$^%QZCHW("regles de jalonnement"),LCHOIX)
 K @(LCHOIX)
 Q
 
RENEX(QUI,SFL,OB1) 
 Q $D(@SFL@(OB1))>0
UC N A,B
 S A=0
 I RESUL(ICC-1)="" S (REFUSE,STOPUC)=1 Q
 I RESUL(ICC)="" S (RESUL(ICC),TAB(ICC))=RESUL(ICC-1),A=1
 S B=$$RENEX(QUI2,SFL,RESUL(ICC))
 I B D ^%VZEAVT(RESUL(ICC)_" "_$$^%QZCHW("existe deja pour l'utilisateur destination")) S (RESUL(ICC+1),TAB(ICC+1))=$$^%QZCHW("OUI") D ^%VAFIGRI,^%VAFISCR Q
 I '(B) S (RESUL(ICC+1),TAB(ICC+1))=$$^%QZCHW("NON") D ^%VAFIGRI,^%VAFISCR Q
 I A D ^%VAFFICH
 Q

