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

;%QMCP25^INT^1^59547,73876^0
QMCP25(PILE,STRUCT,WHOIS1,QUI1,BASE1,IND1,WHOIS2,QUI2,BASE2,IND2,MODE) 
 
 
 
 
 
 
 
 I '($D(@STRUCT@("SPECIAL",BASE1,"ATTLIEN"))!$D(@STRUCT@("SPECIAL","*","ATTLIEN"))) Q
 
 N TEMP,LATTLIEN,ATTLIEN,I,VAL,TYPE1,TYPE1SP,TYPE2SP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"QMCP25")
 S LATTLIEN=$$CONCAS^%QZCHAD(TEMP,"LATTLIEN")
 S VAL=$$CONCAS^%QZCHAD(TEMP,"VAL")
 K @(TEMP)
 D ATTLIEN^%QSGESPE(LATTLIEN)
 S ATTLIEN=$O(@LATTLIEN@(""))
 F I=0:0 Q:ATTLIEN=""  D T1 S ATTLIEN=$O(@LATTLIEN@(ATTLIEN))
 K @(TEMP)
 Q
T1 K @(VAL)
 D MVG^%QMCPZ(WHOIS1,QUI1,BASE1,IND1,ATTLIEN,VAL,.TYPE1)
 I @VAL=0 Q
 
 I '($D(@LATTLIEN@(ATTLIEN,BASE1))!$D(@LATTLIEN@(ATTLIEN,"*"))) K @(VAL) Q
 
 S TYPE1SP=$$TYPEASP^%QMCPZ(WHOIS1,QUI1,BASE1,ATTLIEN)
 S TYPE2SP=$$TYPEASP^%QMCPZ(WHOIS1,QUI2,BASE2,ATTLIEN)
 I TYPE1SP'=TYPE2SP K @(VAL) Q
 
 
 I TYPE1SP="REGLE" D COPUSH^%QMERREG(PILE,WHOIS1,QUI1,BASE1,IND1,ATTLIEN,VAL,WHOIS2,QUI2,BASE2,IND2,ATTLIEN,MODE) K @(VAL) Q
 K @(VAL)
 Q

