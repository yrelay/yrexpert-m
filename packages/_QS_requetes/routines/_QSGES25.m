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

;%QSGES25^INT^1^59547,73881^0
%QSGES25 ;;07:40 PM  9 Sep 1993; ; 09 Sep 93  5:46 PM
 
 
 
 
 
 
 
 
 
 
 
RECOP(%U7,%CUK1,%CUK2,%OR,AVELIEN) 
 N TEMP,PILE,IPIL,ICOUR,BASE,IND1,IND2,%A,ATT,TYPL,MSG,RESC,OR,V,%V,O,%O,BASED,MODE,REPL
 S MODE=1,REPL=$$LIENI^%QSGEL3
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T") K @(TEMP)
 S PILE=$$CONCAS^%QZCHAD(TEMP,"PI"),IPIL=1
 S @PILE@(IPIL,"B")=%U7,@PILE@(IPIL,"I1")=%CUK1,@PILE@(IPIL,"I2")=%CUK2,@PILE@(IPIL,"O")=%OR
 S ICOUR=""
BCLIND S ICOUR=$O(@PILE@(ICOUR)) G:ICOUR="" FIN
 S BASE=@PILE@(ICOUR,"B"),IND1=@PILE@(ICOUR,"I1"),IND2=@PILE@(ICOUR,"I2"),OR=@PILE@(ICOUR,"O")
 G:$$CREER^%QSGEIND(BASE,IND2,OR,1,.MSG) BCLIND
 S ATT="" F %A=0:0 S ATT=$O(^[QUI]QUERYV(BASE,IND1,ATT)) Q:ATT=""  I ATT'="NOM" D COPIAT
 G BCLIND
 
FIN K @(TEMP) Q
 
COPIAT I $$IR^%QSGEST5("ATTRIBUT",ATT) D COP6 Q
 I '($D(^[QUI]RQSLIEN(BASE,ATT))) D COP0 Q
 S TYPL=$P(^[QUI]RQSLIEN(BASE,ATT),"^")
 
 Q:TYPL=1  D:TYPL=2 COP2
 Q:'(AVELIEN)
 S REPD=$P(^[QUI]RQSLIEN(BASE,ATT),"^",2) Q:REPD=REPL
 
 D @("COP"_TYPL)
 Q
 
 
COP0 S O="" F %O=0:0 S O=$O(^[QUI]QUERYV(BASE,IND1,ATT,O)) Q:O=""  S V=^[QUI]QUERYV(BASE,IND1,ATT,O) D PA^%QSGESTI(BASE,IND2,ATT,V,O)
 Q
 
 
COP2 S BASED=$P(^[QUI]RQSLIEN(BASE,ATT),"^",2)
 S O="" F %O=0:0 S O=$O(^[QUI]QUERYV(BASE,IND1,ATT,O)) Q:O=""  S V=^[QUI]QUERYV(BASE,IND1,ATT,O),IPIL=IPIL+1,@PILE@(IPIL,"B")=BASED,@PILE@(IPIL,"I1")=IND1_","_V,@PILE@(IPIL,"I2")=IND2_","_V,@PILE@(IPIL,"O")=O
 Q
 
 
COP3 
COP4 
COP5 N QUAL,QUALI,LINV
 S QUAL=$$QUAL^%QSGEL2(BASE,ATT),LINV=$$LIENI^%QSGEL2(BASE,REPD,ATT,TYPL),QUALI=$$QUAL^%QSGEL2(REPD,LINV)
 S O=""
COP50 S O=$O(^[QUI]QUERYV(BASE,IND1,ATT,O)) Q:O=""
 S V=^[QUI]QUERYV(BASE,IND1,ATT,O)
 D ADDS^%QSGEST3(BASE,IND2,ATT,REPD,V)
 D:QUAL COPL($$NOML1^%QSGES20(IND1,V,ATT,V),$$NOML1^%QSGES20(IND2,V,ATT,V),ATT)
 D:QUALI COPL($$NOML1^%QSGES20(V,IND1,LINV,IND1),$$NOML1^%QSGES20(V,IND2,LINV,IND2),LINV)
 G COP50
 
 
COPL(ILIEN1,ILIEN2,NOMLIEN) 
 N A,O,%O,V,TAB,LI
 F A="REP.SOURCE","REP.DESTINATION","NUMERO.ORDRE","NOM.LIEN","NOM","DESTINATION."_NOMLIEN,"SOURCE."_NOMLIEN S TAB(A)=""
 S A=""
COPL2 S A=$O(^[QUI]QUERYV(REPL,ILIEN1,A)) Q:A=""
 G:$D(TAB(A)) COPL2
 S O="" F %O=0:0 S O=$O(^[QUI]QUERYV(REPL,ILIEN1,A,O)) Q:O=""  S V=^[QUI]QUERYV(REPL,ILIEN1,A,O) D PA^%QSGESTI(REPL,ILIEN2,A,V,O)
 G COPL2
 
 
 
 
COP6 N TYPE1SP,TYPE2SP,WHOIS1,QUI1,WHOIS2,QUI2,BASE1,BASE2
 S (WHOIS1,WHOIS2)=WHOIS,(QUI1,QUI2)=QUI,(BASE1,BASE2)=BASE
 
 S TYPE1SP=$$TYPEASP^%QMCPZ(WHOIS1,QUI1,BASE1,ATT)
 
 
 I TYPE1SP="TEXTE" G NOTE
 
 I TYPE1SP="CONDITION" D COPIE^%QMEBCDT(WHOIS1,QUI1,BASE1,IND1,ATT,WHOIS2,QUI2,BASE2,IND2,ATT,MODE) G FSP
 
 I TYPE1SP="INDICE.AIDE" D COPIN^%QMERRGA(WHOIS1,QUI1,BASE1,IND1,ATT,WHOIS2,QUI2,BASE2,IND2,ATT,MODE) G FSP
 
 I TYPE1SP="AIDE" D COPIE^%QMERRGA(WHOIS1,QUI1,BASE1,IND1,ATT,WHOIS2,QUI2,BASE2,IND2,ATT,MODE) G FSP
 I TYPE1SP="HISTO" G HISTO
 
 I TYPE1SP="PREDICAT" G COP0
 G COP0
FSP 
 Q
 
NOTE 
 S VAL=$$TEMP^%SGUTIL
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
 ;
 ;

