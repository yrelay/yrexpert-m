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

;%QMCP24^INT^1^59547,73876^0
QMCP24 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
COPY(WHOIS1,QUI1,LISTE1,WHOIS2,QUI2,LISTE2,BASE2,TYPE2,MODE) 
 N PREF1,CARD1,SOURCE1,ADR1,AUTRE1,TRI1,BASE1,TYPE1,LISTATT1,ATT1
 N PREF2,CARD2,SOURCE2,ADR2,AUTRE2,TRI2,T,TEMP,I
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"COPY")
 S LISTATT1=$$CONCAS^%QZCHAD(TEMP,"LISTATT1")
 K @(TEMP)
 S T=$C(9)
 S PREF1=$$PREF^%QMCPZ(WHOIS1,QUI1,LISTE1)
 
 I PREF1="" D FIN Q
 S PREF2=PREF1
 
 I LISTE2="" S LISTE2=$$NOM^%QMCPZ(WHOIS2,QUI2,PREF2)
 
 I LISTE2'="" D:MODE'=3 MAJ^%QMCPZ(WHOIS2,QUI2,LISTE2) S PREF2=$E(LISTE2,1,3)
 
 S BASE1=$$BASE^%QMCPZ(WHOIS1,QUI1,LISTE1)
 I BASE2="" S BASE2=BASE1
 S TYPE1=$$TYP^%QMCPZ(WHOIS1,QUI1,LISTE1)
 I TYPE2="" S TYPE2=TYPE1
 I BASE2="" S TYPE2="INDIVIDU"
 S CARD1=$$CARD^%QMCPZ(WHOIS1,QUI1,LISTE1)
 S CARD2=CARD1
 S SOURCE2=$$SOURCE^%QMCPZ(WHOIS1,QUI1,LISTE1)
 S AUTRE2=$$AUTRE^%QMCPZ(WHOIS1,QUI1,LISTE1)
 S ADR1=$$ADRLIS^%QMCPZ(WHOIS1,QUI1,LISTE1)
 S TRI1=$$ADRLT^%QMCPZ(WHOIS1,QUI1,LISTE1)
 I (TRI1="")!(TRI1=0) D TRI^%QMCPZ(WHOIS1,QUI1,LISTE1)
 
 I MODE'=3 S ADR2=$$STO^%QMCPZ(WHOIS2,QUI2,LISTE2)
 I MODE'=3 S TRI2=$$STOTRI^%QMCPZ(WHOIS2,QUI2)
 I MODE=3 S (ADR2,TRI2)=""
 
 I MODE'=3 D SX^%QMCPZ(WHOIS2,QUI2,"L0",LISTE2)
 
 D CRETYP^%QMCPOZ(QUI,WHOIS2,QUI2,BASE2,LISTE2,PREF2,CARD2,SOURCE2,ADR2,AUTRE2,TYPE2,TRI2,MODE)
 I MODE=1 D MODE1
 I MODE=3 D MODE3
 
 D LISTA^%QMCPZ(WHOIS1,QUI1,LISTE1,LISTATT1)
 S ATT1=$O(@LISTATT1@(""))
 F I=0:0 Q:ATT1=""  D TO1^%QMCP21(WHOIS1,QUI1,"L0",LISTE1,ATT1,WHOIS2,QUI2,"L0",LISTE2,MODE) S ATT1=$O(@LISTATT1@(ATT1))
 D STOLK^%QMCPOZ(QUI,"LISTEF")
 D FIN
 Q
FIN K @(TEMP) Q
MODE1 D GLOCOP^%QCAGLC(ADR1,$$ZSUBST^%QZCHSUB(ADR2,"QUI","QUI2"))
 D GLOCOP^%QCAGLC(TRI1,$$ZSUBST^%QZCHSUB(TRI2,"QUI","QUI2"))
 Q
MODE3 N I,OB
 S OB=$O(@ADR1@(""))
 F I=0:0 Q:OB=""  D MODE31 S OB=$O(@ADR1@(OB))
 Q
MODE31 D STOLK^%QMCPOZ(QUI,"LISTI"_T_OB_T_@ADR1@(OB))
 W !,LISTE1," ",OB," ",@ADR1@(OB)
 Q
 
 
TRI(ADR,ADRT) 
 I (ADR="")!(ADRT="") Q
 S IND=""
 F I=1:1 S IND=$O(@ADR@(IND)) Q:IND=""  S @ADRT@(@ADR@(IND))=IND
 Q

