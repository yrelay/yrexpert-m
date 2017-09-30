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

;%QMCP21^INT^1^59547,73876^0
QMCP21 ;
 
 
 
 
TO1(WHOIS1,QUI1,BASE1,IND1,ATT,WHOIS2,QUI2,BASE2,IND2,MODE) 
 N TYPE1,TEMP,VAL
 I ATT="NOM" Q
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TO1")
 S VAL=$$CONCAS^%QZCHAD(TEMP,"VAL")
 K @(TEMP)
 S TYPE1=$$TYPE2^%QMCPZ(WHOIS1,QUI1,BASE1,ATT)
 
 I TYPE1=6 G TOSP
 
 I TYPE1'=0 Q
 
 D MVG^%QMCPZ(WHOIS1,QUI1,BASE1,IND1,ATT,VAL,.TYPE1)
 D MVS^%QMCPOZ(QUI,WHOIS2,QUI2,BASE2,IND2,ATT,VAL,MODE)
 K @(TEMP)
 Q
 
TOSP N TYPE1SP,TYPE2SP
 
 
 S TYPE1SP=$$TYPEASP^%QMCPZ(WHOIS1,QUI1,BASE1,ATT)
 
 S TYPE2SP=$$TYPEASP^%QMCPZ(WHOIS2,QUI2,BASE2,ATT)
 
 I TYPE1SP'=TYPE2SP G FSP
 
 
 I TYPE1SP="TEXTE" G NOTE
 
 I TYPE1SP="CONDITION" D COPIE^%QMEBCDT(WHOIS1,QUI1,BASE1,IND1,ATT,WHOIS2,QUI2,BASE2,IND2,ATT,MODE) G FSP
 
 I TYPE1SP="INDICE.AIDE" D COPIN^%QMERRGA(WHOIS1,QUI1,BASE1,IND1,ATT,WHOIS2,QUI2,BASE2,IND2,ATT,MODE) G FSP
 
 I TYPE1SP="AIDE" D COPIE^%QMERRGA(WHOIS1,QUI1,BASE1,IND1,ATT,WHOIS2,QUI2,BASE2,IND2,ATT,MODE) G FSP
 
 
 I TYPE1SP="HISTO" G HISTO
 I TYPE1SP="PREDICAT" D MVG^%QMCPZ(WHOIS1,QUI1,BASE1,IND1,ATT,VAL,.TYPE1),MVS^%QMCPOZ(QUI,WHOIS2,QUI2,BASE2,IND2,ATT,VAL,MODE)
 
FSP 
 K @(TEMP)
 Q
 
NOTE 
 D MVG^%QMCPZ(WHOIS1,QUI1,BASE1,IND1,ATT,VAL,.TYPE1)
 N OR1,I,OR2
 S OR1=""
 F I=0:0 S OR1=$O(@VAL@(OR1)) Q:OR1=""  D NOTE1
 G FSP
 
NOTE1 S OR2=$$ORDRE^%QMCPZ(WHOIS2,QUI2,BASE2,IND2)
 I MODE=3 D COPY^%QSNOTE4(QUI1,BASE1,IND1,ATT,@VAL@(OR1),OR1,QUI2,BASE2,IND2,ATT,@VAL@(OR1),OR2,MODE,"NOTE") Q
 D PA^%QMCPZ(WHOIS2,QUI2,BASE2,IND2,ATT,@VAL@(OR1),OR2)
 D DUPLN^%QSNOTE(QUI1,BASE1,IND1,OR1,QUI2,BASE2,IND2,OR2)
 Q
 
HISTO 
 D MVG^%QMCPZ(WHOIS1,QUI1,BASE1,IND1,ATT,VAL,.TYPE1)
 N OR1,I,OR2
 S OR1=""
 F I=0:0 S OR1=$O(@VAL@(OR1)) Q:OR1=""  D HISTO1
 G FSP
 
HISTO1 S OR2=$$ORDRH^%QMCPZ(WHOIS2,QUI2,BASE2,IND2)
 I MODE=3 D COPY^%QSNHIS1(QUI1,BASE1,IND1,ATT,@VAL@(OR1),OR1,QUI2,BASE2,IND2,ATT,@VAL@(OR1),OR2,MODE) Q
 D PA^%QMCPZ(WHOIS2,QUI2,BASE2,IND2,ATT,@VAL@(OR1),OR2)
 D DUPL^%QSNHIS1(QUI1,BASE1,IND1,OR1,QUI2,BASE2,IND2,OR2)
 Q

