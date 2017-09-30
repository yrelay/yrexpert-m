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

;%QMCPSF2^INT^1^59547,73877^0
QMCPSF2 ;
 
 
 
 
 
 
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
 F J=1:1:7 Q:(OB1="")!(OB1="z")  S VAL1=OB1_"^"_OB1_"^"_$S($$RENEX^%QMCPSF(QUI2,SFL,OB1):$$^%QZCHW("OUI"),1:$$^%QZCHW("NON"))_"^",LVAL1=$L(VAL1) Q:(LVAL+LVAL1)>450  S VAL=VAL_VAL1,LVAL=LVAL+LVAL1,OB1=$O(@ENSEM@(OB1))
 F J=J:1:7 S VAL=VAL_"^^^"
 S @TEXTE@(FICHE)=VAL
 S FICHE=FICHE+1
 Q
REN2 S VAL=@TEXTE@(FICHE)
 F J=1:3:21 S OB1=$P(VAL,"^",J),OB2=$P(VAL,"^",J+1) Q:OB1=""  I OB2'="" S @ENSEM1@(OB1)=OB2
 Q
 
 
ATPR(WHOIS1,QUI1,ENS,WHOIS2,QUI2,XMODE,PASSE) 
 N I,OB1,OB2
 S OB1=$O(@ENS@(""))
 F I=0:0 Q:OB1=""  D ATPR1 S OB1=$O(@ENS@(OB1))
 Q
ATPR1 S OB2=$S(($D(@ENS@(OB1))#10)=1:@ENS@(OB1),1:OB1)
 I ((XMODE'=3)&(QUI1=QUI2))&(OB1=OB2) D MSG^%VZEATT(WHOIS1_" "_OB1_" : "_$$^%QZCHW("on ne copie pas un objet sur lui meme")) H 1 Q
 D MSG^%VZEATT(WHOIS1_" "_OB1_" --> "_WHOIS2_" "_OB2)
 I XMODE'=3 K ^[QUI2]RQSATPR(OB2)
 I OB1'="z" D ADR^%QCAGLC("^["""_QUI1_"""]RQSATPR("_$S((OB1+0)=OB1:OB1,1:""""_OB1_""""),"^["""_QUI2_"""]RQSATPR("_$S((OB2+0)=OB2:OB2,2:""""_OB1_""""))
 Q
 ;

