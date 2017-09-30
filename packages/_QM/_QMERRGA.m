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

;%QMERRGA^INT^1^59547,73878^0
QMERRGA(ACT,XG,YH,DH,DV,BASE,IND,ATT,VAL,ORD,GLO,AFF) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 Q
 
 
 
 
 
 
 
COPY(WHOIS1,QUI1,BASE1,IND1,ATT1,VAL1,OR1,WHOIS2,QUI2,BASE2,IND2,ATT2,VAL2,OR2,MODE) 
 N ORN1,ORN2
 
 S ORN1=$$QSCALIN^%QMCPZ(WHOIS1,QUI1,BASE1,IND1,"INDICE.NOTE",OR1)
 
 S ORN2=$$ORDRE^%QMCPZ(WHOIS2,QUI2,BASE2,IND2)
 D COPY^%QSNOTE4(QUI1,BASE1,IND1,ATT1,VAL1,ORN1,QUI2,BASE2,IND2,ATT2,VAL2,ORN2,MODE)
 
 I MODE=3 Q
 
 D PA^%QMCPZ(WHOIS2,QUI2,BASE2,IND2,ATT2,VAL2,OR2)
 D PA^%QMCPZ(WHOIS2,QUI2,BASE2,IND2,"INDICE.NOTE",ORN2,OR2)
 Q
 
COPIE(WHOIS1,QUI1,BASE1,IND1,ATT1,WHOIS2,QUI2,BASE2,IND2,ATT2,MODE) 
 N I,TEMP,V1,TYP1,OR1
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"COPIE")
 S V1=$$CONCAS^%QZCHAD(TEMP,"V1")
 K @(TEMP)
 D MVG^%QMCPZ(WHOIS1,QUI1,BASE1,IND1,ATT1,V1,.TYP1)
 S OR1=$O(@V1@(""))
 F I=0:0 Q:OR1=""  D COPY(WHOIS1,QUI1,BASE1,IND1,ATT1,@V1@(OR1),OR1,WHOIS2,QUI2,BASE2,IND2,ATT2,@V1@(OR1),OR1,MODE) S OR1=$O(@V1@(OR1))
 K @(TEMP)
 Q
 
 
 
COPIN(WHOIS1,QUI1,BASE1,IND1,ATT1,WHOIS2,QUI2,BASE2,IND2,ATT2,MODE) 
 Q

