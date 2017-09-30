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

;%QMCPOR^INT^1^59547,73876^0
QMCPOR ;
 
 
 N SUP,IO,STOP,WHOIS1,QUI1,WHOIS2,QUI2,DY1,MSG,ECR,MODE
 D CLEPAG^%VVIDEO
 S DY1=10
 S MODE=$$^%QZCHW("recuperation")
 D REAFF^%QMCP4(MODE)
 S REAFF="REAFF^%QMCP4("_MODE_")"
 D SUP^%QMCPOZ1(.SUP,.IO,.STOP,REAFF)
 I STOP Q
 S WHOIS1=WHOIS,QUI1=QUI
 S WHOIS2=$$WHOIS2^%QMCP9(WHOIS1,QUI1,.QUI2,DY1)
 I WHOIS2="" Q
 S ECR=1
 S MSG=$$RECUP(WHOIS2,QUI2,SUP,IO,ECR)
 I MSG'="" D ^%VZEAVT(MSG)
 Q
 
RECUP(WHOIS2,QUI2,SUP,IO,ECR) 
 N ABORT
 
 D KLK^%QMCPOZ(QUI)
 D LOAD^%QMCPOZ(SUP,IO,.ABORT)
 I ABORT'="" Q $$^%QZCHW("impossible de lire votre")_" "_$S(SUP="TAPE":$$^%QZCHW("bande"),1:$$^%QZCHW("fichier")_" : "_IO)
 D STO(WHOIS2,QUI2,ECR)
 D KLK^%QMCPOZ(QUI)
 Q ""
 
 
 
STO(WHOIS2,QUI2,ECR) 
 N CH,TYPE,I,LI,TEMPS,LILIEN,NOTE,COOR,STOP,LISTE,TRT,TRTL
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"STO")
 S LILIEN=$$CONCAS^%QZCHAD(TEMP,"LILIEN")
 S NOTE=$$CONCAS^%QZCHAD(TEMP,"NOTE")
 S COOR=$$CONCAS^%QZCHAD(TEMP,"COOR")
 S LISTE=$$CONCAS^%QZCHAD(TEMP,"LISTE")
 S TRT=$$CONCAS^%QZCHAD(TEMP,"TRT")
 S TRTL=$$CONCAS^%QZCHAD(TEMP,"TRTL")
 K @(TEMP)
 S LI="",CH=""
 F I=0:0 D READLK^%QMCPOZ(QUI,.CH,.LI) W !,CH Q:LI=""  D STO1(WHOIS2,QUI2,CH,.STOP) Q:STOP
 K @(TEMP)
 Q
STO1(WHOIS2,QUI2,CH,STOP) 
 N TYPE,T
 S STOP=0
 S T=$C(9)
 S TYPE=$P(CH,T,1)
 I TYPE="COOR" D COOR(CH,T,COOR) Q
 I TYPE="COORF" Q
 I TYPE="ATT" D ATT(CH,T,LILIEN,WHOIS2,QUI2) Q
 I TYPE="IND" D IND(CH,T,WHOIS2,QUI2) Q
 
 I TYPE="LIENH" D LIENH(CH,T,WHOIS2,QUI2) Q
 I TYPE="LIENR" D LIENR(CH,T,WHOIS2,QUI2) Q
 I TYPE="LILIEN" D LILIEN(CH,T,LILIEN) Q
 
 I TYPE="NOTE" D NOTE(CH,T,NOTE) Q
 I TYPE="NOTEL" D NOTEL(CH,T,NOTE) Q
 I TYPE="NOTEF" D NOTEF(CH,T,NOTE,WHOIS2,QUI2) Q
 
 I TYPE="HISTO" D HISTO(CH,T,NOTE) Q
 I TYPE="HISTOL" D HISTOL(CH,T,NOTE) Q
 I TYPE="HISTOF" D HISTOF(CH,T,NOTE,WHOIS2,QUI2) Q
 
 I TYPE="LISTE" D LISTE(CH,T,LISTE,WHOIS2,QUI2) Q
 I TYPE="LISTI" D LISTI(CH,T,LISTE) Q
 I TYPE="LISTEF" D LISTEF(CH,T,LISTE,WHOIS2,QUI2) Q
 
 I TYPE="TRTCO" D TRTCO^%QMCPOR2(CH,T,TRT,WHOIS2,QUI2) Q
 I TYPE="TRTSO" D TRTCO^%QMCPOR2(CH,T,TRT,WHOIS2,QUI2) Q
 I TYPE="TRTF" D TRTF^%QMCPOR2(CH,T,TRT,WHOIS2,QUI2) Q
 I TYPE="TRTL" D TRTL^%QMCPOR2(CH,T,TRTL) Q
 
 I TYPE="PASSE1" D PASSE1^%QMCPOR2(CH,T,COOR,TRTL,.STOP,WHOIS2,QUI2)
 
 Q
 
COOR(CH,T,COOR) 
 N BASE,IND
 S BASE=$P(CH,T,2),IND=$P(CH,T,3)
 S @COOR@(BASE,IND)=""
 Q
 
ATT(CH,T,LILIEN,WHOIS2,QUI2) 
 N BASE,IND,ATT,VAL,OR
 N L,IND1,LIEN,IND2,CH1
 S BASE=$P(CH,T,2),IND=$P(CH,T,3),ATT=$P(CH,T,4),VAL=$P(CH,T,5),OR=$P(CH,T,6)
 
 I ($D(@LILIEN@(IND))#10)'=1 D PA^%QMCPZ(WHOIS2,QUI2,BASE,IND,ATT,VAL,OR) Q
 
 
 S CH1=@LILIEN@(IND)
 S IND1=$P(CH1,T,1),LIEN=$P(CH1,T,2),IND2=$P(CH1,T,3)
 S L=$$REFLIEN^%QMCPZ(WHOIS2,QUI2,IND1,LIEN,IND2)
 D PA^%QMCPZ(WHOIS2,QUI2,BASE,L,ATT,VAL,OR)
 Q
 
IND(CH,T,WHOIS2,QUI2) 
 N BASE,IND,OR,LIEN,MSG,A
 S BASE=$P(CH,T,2),IND=$P(CH,T,3),OR=$P(CH,T,4),LIEN=$P(CH,T,5)
 S A=$$CREER1^%QMCPZ(WHOIS2,QUI2,BASE,IND,"",1,.MSG,0)
 Q
 
LIENH(CH,T,WHOIS2,QUI2) 
 N BASE,IND,OR,LIEN,BASEL,INDL
 S BASE=$P(CH,T,2),IND=$P(CH,T,3),OR=$P(CH,T,4),LIEN=$P(CH,T,5),BASEL=$P(CH,T,6),INDL=$P(CH,T,7)
 D ADDO^%QMCPZ(WHOIS2,QUI2,BASE,IND,OR,LIEN,BASEL,INDL)
 Q
 
LIENR(CH,T,WHOIS2,QUI2) 
 N BASE,IND,LIEN,BASEL,INDL
 S BASE=$P(CH,T,2),IND=$P(CH,T,3),LIEN=$P(CH,T,4),BASEL=$P(CH,T,5),INDL=$P(CH,T,6)
 D ADDS^%QMCPZ(WHOIS2,QUI2,BASE,IND,LIEN,BASEL,INDL)
 Q
 
LILIEN(CH,T,LILIEN) 
 N IND1,LIEN,IND2,L
 S IND1=$P(CH,T,2),LIEN=$P(CH,T,3),IND2=$P(CH,T,4),L=$P(CH,T,5)
 S @LILIEN@(L)=$P(CH,T,2,4)
 Q
 
NOTE(CH,T,NOTE) 
 S @NOTE@("NOM")=$P(CH,T,2,6)
 Q
NOTEL(CH,T,NOTE) 
 N LI,TXT
 S LI=$P(CH,T,2),TXT=$P(CH,T,3)
 S @NOTE@("TXT",LI)=TXT
 Q
NOTEF(CH,T,NOTE,WHOIS,QUI) 
 N BASE,IND,ATT,VAL,OR,CH1
 S CH1=@NOTE@("NOM")
 S BASE=$P(CH,T,2),IND=$P(CH,T,3),ATT=$P(CH,T,4),VAL=$P(CH,T,5),OR=$P(CH,T,6)
 D CREN^%QSNOTE3(BASE,IND,ATT,VAL,$$CONCAS^%QZCHAD(NOTE,"TXT"))
 K @(NOTE)
 Q
 
HISTO(CH,T,HIS) 
 S @NOTE@("NHIS")=$P(CH,T,2,5)
 Q
HISTOL(CH,T,NOTE) 
 N N,A,O
 S N=$P(CH,T,2),A=$P(CH,T,3),O=$P(CH,T,4),TXT=$P(CH,T,5)
 S @NOTE@("HIS",N,A,O)=TXT
 Q
HISTOF(CH,T,NOTE,WHOIS,QUI) 
 N BASE,IND,ATT,VAL,OR,CH1
 S CH1=@NOTE@("NHIS")
 S BASE=$P(CH,T,2),IND=$P(CH,T,3),ATT=$P(CH,T,4),VAL=$P(CH,T,5),OR=$P(CH,T,6)
 D CREH^%QSNHIS1(BASE,IND,ATT,VAL,$$CONCAS^%QZCHAD(NOTE,"HIS"))
 K @(NOTE)
 Q
 
LISTE(CH,T,LISTE,WHOIS2,QUI2) 
 N BASE,L,TL,CARD,SOURCE,AUTRE,TYP,ADR,ADRT
 S BASE=$P(CH,T,2),L=$P(CH,T,3),TL=$P(CH,T,4),CARD=$P(CH,T,5),SOURCE=$P(CH,T,6),AUTRE=$P(CH,T,7),TYPE=$P(CH,T,8)
 I L="" Q
 D MAJ^%QMCPZ(WHOIS2,QUI2,L)
 S ADR=$$STO^%QMCPZ(WHOIS2,QUI2,L)
 S ADRT=$$STOTRI^%QMCPZ(WHOIS2,QUI2)
 D CRETYP^%QMCPZ(WHOIS2,QUI2,BASE,L,TL,CARD,SOURCE,ADR,AUTRE,TYPE,ADRT)
 S @LISTE@("LISTE")=L
 S @LISTE@("ADR")=ADR
 S @LISTE@("ADRT")=ADRT
 Q
LISTI(CH,T,LISTE) 
 N OBJET,INDICE
 S OBJET=$P(CH,T,2),INDICE=$P(CH,T,3)
 I (OBJET="")!(INDICE="") Q
 S @LISTE@("OBJET",OBJET)=INDICE
 Q
LISTEF(CH,T,LISTE,WHOIS,QUI) 
 N ADR,ADRT
 S ADR=@LISTE@("ADR")
 S ADRT=@LISTE@("ADRT")
 D GLOCOP^%QCAGLC($$CONCAS^%QZCHAD(LISTE,"OBJET"),ADR)
 D TRI^%QMCP24(ADR,ADRT)
 K @(LISTE)
 Q

