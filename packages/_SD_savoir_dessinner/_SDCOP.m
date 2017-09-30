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

;%SDCOP^INT^1^59547,73888^0
SDCOP ;
 
 
 
 
 
 
 N ADR,ADRES,CONTR,CTR,FEN,LCOUR,MEN,MENU,MENU2,MES,TEMP,TYP,ENSEM
 N WHOIS2,QUI1,QUI2,WHOIS1,I,OB
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S ENSEM=$$CONCAS^%QZCHAD(TEMP,"ENSEM")
 S MENU=$$CONCAS^%QZCHAD(TEMP,"MENU")
 S MENU2=$$CONCAS^%QZCHAD(TEMP,"MENU2")
 S WHOIS1=WHOIS
 S @MENU="23^10^79"
 S @MENU@(1)=$$^%QZCHW("Selection")_"^SELEC"
 S @MENU@(1,"COM")=$$^%QZCHW("Copie apres selection")
 S @MENU@(2)=$$^%QZCHW("Tous")_"^TOUS"
 S @MENU@(2,"COM")=$$^%QZCHW("Copie de tous les elements")
 S @MENU2="23^10^79"
 S @MENU2@(1)=$$^%QZCHW("Collections")_"^COLLEC"
 S @MENU2@(1,"COM")=$$^%QZCHW("Copie de collections (y compris les objets en faisant partie")
 S @MENU2@(2)=$$^%QZCHW("Objets")_"^OBJET"
 S @MENU2@(2,"COM")=$$^%QZCHW("Copie d'objets")
 S @MENU2@(3)=$$^%QZCHW("fiches.de.conditions")_"^FICHE"
 S @MENU2@(3,"COM")=$$^%QZCHW("Copie de fiches de conditions appliquees aux elements graphiques")
ACTU D CLEPAG^%VVIDEO,^%VZCD(0,39,0,4,1,0,$$^%QZCHW("COPIE DE SAVOIR DESSINER"))
 S WHOIS2=$$WHOIS2^%QMCPSF(WHOIS,.QUI1,.QUI2)
 I WHOIS2="" K @(TEMP) Q
 D POCLEPA^%VVIDEO
ACTU2 D CLEPAG^%VVIDEO,^%VZCD(0,39,0,4,1,0,$$^%QZCHW("COPIE DE SAVOIR DESSINER"))
 D ^%VQUIKMN(0,80,22,MENU2,.ADR,.CTR) G:(CTR="A")!(CTR="F") END G:ADR'="" @ADR G ACTU2
 
COLLEC I ($O(^[QUI]SDCOL(""))="z")!($O(^[QUI]SDCOL(""))="") D ^%VZEAVT($$^%QZCHW("pas de")_" "_$$^%QZCHW("collection")_" "_$$^%QZCHW("a copier")) G ACTU2
 D SELECT("COL",$$^%QZCHW("Selection de collections"),"^[QUI]SDCOL",ENSEM)
 G ACTU2
 
OBJET I ($O(^[QUI]SDOBJ(""))="z")!($O(^[QUI]SDOBJ(""))="") D ^%VZEAVT($$^%QZCHW("pas d'")_" "_$$^%QZCHW("objet")_" "_$$^%QZCHW("a copier")) G ACTU2
 D SELECT("OBJ",$$^%QZCHW("Selection d'objets"),"^[QUI]SDOBJ",ENSEM)
 G ACTU2
 
FICHE I ($O(^[QUI]SDCOND(""))="z")!($O(^[QUI]SDCOND(""))="") D ^%VZEAVT($$^%QZCHW("pas de")_" "_$$^%QZCHW("fiches de conditions")_" "_$$^%QZCHW("a copier")) G ACTU2
 D SELECT("COND",$$^%QZCHW("Selection de fiches de conditions"),"^[QUI]SDCOND",ENSEM)
 G ACTU2
 
END K @(TEMP)
 Q
 
SELECT(SF,TIT,SFL,ENSEM) 
 N PAR1,PAR2,%I1,%I2,LISTEMP
ACTU3 K @(ENSEM)
 D CLEPAG^%VVIDEO,^%VZCD(0,39,0,4,1,0,TIT)
 D ^%VQUIKMN(0,80,22,MENU,.ADR,.CTR) Q:(CTR="A")!(CTR="F")
 G:ADR'="" @ADR
 G ACTU3
 
TOUS 
 S PAR1=""
 I SF'="COND" F %I1=0:0 S PAR1=$O(@SFL@(PAR1)) Q:PAR1=""  S PAR2="" F %I2=0:0 S PAR2=$O(@SFL@(PAR1,PAR2)) Q:PAR2=""  S @ENSEM@(PAR1_"\\"_PAR2)=""
 I SF="COND" F %I1=0:0 S PAR1=$O(@SFL@(PAR1)) Q:PAR1=""  S @ENSEM@(PAR1)=""
 D COPIE(SF,SFL,WHOIS1,QUI1,ENSEM,WHOIS2,QUI2)
 G ACTU3
 
SELEC 
 N LISTSEL
 S LISTSEL=$$CONCAS^%QZCHAD(TEMP,"SELEL")
 K @(LISTSEL)
 S PAR1=""
 I SF'="COND" F %I1=0:0 S PAR1=$O(@SFL@(PAR1)) Q:PAR1=""  S PAR2="" F %I2=0:0 S PAR2=$O(@SFL@(PAR1,PAR2)) Q:PAR2=""  S @LISTSEL@(PAR1_"\\"_PAR2)=""
 I SF="COND" F %I1=0:0 S PAR1=$O(@SFL@(PAR1)) Q:PAR1=""  S @LISTSEL@(PAR1)=""
 D INIT^%QUCHOIP(LISTSEL,1,"",0,5,80,17),AFF^%QUCHOIP
 D ^%QUCHOYP(ENSEM),END^%QUCHOIP
 K @(LISTSEL)
 D COPIE(SF,SFL,WHOIS1,QUI1,ENSEM,WHOIS2,QUI2)
 G ACTU3
 
 
COPIE(SF,SFL,WHOIS1,QUI1,ENSEM,WHOIS2,QUI2) 
 N TEMP,ENSEM1,OK,XMODE,PASSE,I,OB1,OB2
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"COPIE") K @(TEMP)
 S ENSEM1=$$CONCAS^%QZCHAD(TEMP,"ENSEM1")
 S OK=$$RENOM(SF,SFL,WHOIS1,QUI1,ENSEM,WHOIS2,QUI2,ENSEM1)
 I '(OK) Q
 S XMODE=1,PASSE=0
 S OB1=""
BCOP1 S OB1=$O(@ENSEM1@(OB1))
 G:OB1="" COPF
 S OB2=$S(($D(@ENSEM1@(OB1))#10)=1:@ENSEM1@(OB1),1:OB1)
 I (QUI1=QUI2)&(OB1=OB2) D MSG^%VZEATT(WHOIS1_" "_OB1_" : "_$$^%QZCHW("on ne copie pas un objet sur lui meme")) H 1 G BCOP1
 D MSG^%VZEATT(WHOIS1_" "_OB1_" --> "_WHOIS2_" "_OB2)
 S A=$P(OB1,"\\"),B=$P(OB1,"\\",2)
 S C=$P(OB2,"\\"),D=$P(OB2,"\\",2)
 I SF="COL" D COL^%SDCOP2(WHOIS1,QUI1,A,B,WHOIS2,QUI2,C,D) G BCOP1
 I SF="OBJ" D OBJ^%SDCOP2(WHOIS1,QUI1,A,B,WHOIS2,QUI2,C,D,1) G BCOP1
 D COND^%SDCOP2(WHOIS1,QUI1,A,WHOIS2,QUI2,C) G BCOP1
 G BCOP1
 
COPF K @(TEMP)
 Q
 
 
RENOM(SF,SFL,WHOIS1,QUI1,ENSEM,WHOIS2,QUI2,ENSEM1) 
 N TEMP,TEXTE,I,OB1,FICHE,VAL,J,OB2,VAL1,LVAL,LVAL1
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"RENOM")
 S TEXTE="^"_"QMCPSF"
 K @(TEMP),@(TEXTE)
 S FICHE=1
 
 S OB1=$O(@ENSEM@(""))
 F I=1:1 Q:(OB1="")!(OB1="z")  D REN1
 D CLEPAG^%VVIDEO,^%VCMS("QMCPSF")
 
 S FICHE=$O(@TEXTE@(""))
 F I=0:0 Q:FICHE=""  D REN2 S FICHE=$O(@TEXTE@(FICHE))
 Q:$D(@ENSEM1)=0 0
 D POCLEPA^%VVIDEO
 I $$MES^%VZEOUI($$^%QZCHW("confirmez vous la copie ?"),"N")=1 Q 1
 Q 0
 
REN1 S VAL="",LVAL=0
 F J=1:1:7 Q:(OB1="")!(OB1="z")  S VAL1=OB1_"^"_OB1_"^"_$S($$RENEX(QUI2,SFL,OB1):$$^%QZCHW("OUI"),1:$$^%QZCHW("NON"))_"^",LVAL1=$L(VAL1) Q:(LVAL+LVAL1)>450  S VAL=VAL_VAL1,LVAL=LVAL+LVAL1,OB1=$O(@ENSEM@(OB1))
 F J=J:1:7 S VAL=VAL_"^^^"
 S @TEXTE@(FICHE)=VAL
 S FICHE=FICHE+1
 Q
 
REN2 S VAL=@TEXTE@(FICHE)
 F J=1:3:21 S OB1=$P(VAL,"^",J),OB2=$P(VAL,"^",J+1) Q:OB1=""  I OB2'="" S @ENSEM1@(OB1)=OB2
 Q
 
RENEX(QUI,SFL,OB1) 
 N A,B
 S A=$P(OB1,"\\"),B=$P(OB1,"\\",2)
 Q:(A="")!(B="") 0
 Q $D(@SFL@(A,B))>0
 
UC N A,B
 S A=0
 I RESUL(ICC-1)="" S (REFUSE,STOPUC)=1 Q
 I RESUL(ICC)="" S (RESUL(ICC),TAB(ICC))=RESUL(ICC-1),A=1
 S B=$$RENEX(QUI2,SFL,RESUL(ICC))
 I B D ^%VZEAVT(RESUL(ICC)_" "_$$^%QZCHW("existe deja pour l'utilisateur destination")) S (RESUL(ICC+1),TAB(ICC+1))=$$^%QZCHW("OUI") D ^%VAFIGRI,^%VAFISCR Q
 I '(B) S (RESUL(ICC+1),TAB(ICC+1))=$$^%QZCHW("NON") D ^%VAFIGRI,^%VAFISCR Q
 I A D ^%VAFFICH
 Q

