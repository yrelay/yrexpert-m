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

;%QSGES11^INT^1^59547,73881^0
QSGES11(R,L,TL,CARD,SOURCE,ADR) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 D CREER(R,L,TL,CARD,SOURCE,ADR,SOURCE)
 Q
CREER(R,L,TL,CARD,SOURCE,ADR,AUTRE) 
 I ADR="" S ADR="^[QUI]RQS2("""_L_""",""OBJET"")"
 I SOURCE="" S SOURCE="REQUETES COMPILEES"
 D CRETYP(R,L,TL,CARD,SOURCE,ADR,AUTRE,$S(R'="":"",1:"VALEUR"),"")
 Q
 
CRETYPV(R,L,TL,SOURCE,AUTRE,TYP) 
 D CRETYP(R,L,TL,0,SOURCE,$$STO(L),AUTRE,TYP,$$STOTRI)
 Q
CRETYP(R,L,TL,CARD,SOURCE,ADR,AUTRE,TYP,TRI) 
 N I K I
 S I("TRIABLE",1)=$S(TRI="":"NON",1:"OUI"),I("ADRESSE",1)=ADR
 I TRI'="" S I("TRIEE",1)=TRI
 S TYP=$S(TYP="":"INDIVIDU",1:TYP),I("TYPE.OBJET",1)=TYP
 I TYP="INDIVIDU" S I("BASE",1)=R
 E  S I("OBJET",1)=TYP
 S I("SOURCE",1)=SOURCE
 S I("CARD",1)=CARD,I("AUTRE",1)=AUTRE
 I (ADR="^[QUI]RQS2(""")_L_""",""OBJET"")" S ^[QUI]RQS2(L,"BASE")=R,^[QUI]RQS2(L,"REQUETE")=SOURCE,^[QUI]RQS2(L,"CARD")=CARD
 D ADD^%QS0(L,"I")
 Q
 
 
CREERTRT(R,L,TL,CARD,SOURCE,ADR,AUTRE) 
 N I
 S I("TRIABLE",1)="NON",I("ADRESSE",1)=ADR,I("TYPE.OBJET",1)="INDIVIDU",I("BASE",1)=R,I("SOURCE",1)=SOURCE,I("CARD",1)=CARD,I("AUTRE",1)=AUTRE
 D ADD^%QS0(L,"I")
 Q
 
 
 
NOM(TL) Q $$GEN^%QCAPOP(TL)
STO(L) Q "^[QUI]RQS2("""_L_""",""OBJET"")"
STOTRI() Q "^[QUI]ZLIGTRIE("""_$$NOM("TRI")_""")"
DEL(L) D DEL^%QS0(L) Q
 
COPIE(BA,CARD,ADRS,ADRD) 
 N IND S IND=$O(@ADRS@(""))
 F CARD=0:1 Q:IND=""  S @ADRD@("OBJET",IND)="",IND=$O(@ADRS@(IND))
 S @ADRD@("BASE")=BA
 S @ADRD@("CARD")=CARD Q
 
COPY(L,BA,CARD,ADRS) 
 N ADRD S ADRD=$$CONCAS^%QZCHAD("^[QUI]RQS2",L)
 D COPIE(BA,.CARD,ADRS,ADRD) Q
 
STOCK(L,IND) 
 N ADR,ADRLT,INDICE,A
 S ADR=$$ADRLIS^%QSGEST7(L) Q:ADR=""
 I IND="" Q
 I $$EXI(L,IND) Q
 S ADRLT=$$ADRLT^%QSGEST7(L)
 S INDICE=""
 
 S A=$O(@ADR@(""))
 I A'="",@ADR@(A)="" D TRK(L) S ADRLT=""
 I ADRLT'="",ADRLT'=0 S INDICE=$ZP(@ADRLT@(""))+1,@ADRLT@(INDICE)=IND
 S @ADR@(IND)=INDICE
 D PA^%QSGESTI("L0",L,"CARD",$$CARD^%QSGEST7(L)+1)
 Q
 
ELIMI(L,IND) 
 N ADR,ADRLT,INDICE
 S ADR=$$ADRLIS^%QSGEST7(L) Q:ADR=""
 I IND="" Q
 I '($$EXI(L,IND)) Q
 S INDICE=@ADR@(IND)
 S ADRLT=$$ADRLT^%QSGEST7(L)
 K @ADR@(IND)
 I INDICE'="",(ADRLT'="")&(ADRLT'=0) K @ADRLT@(INDICE)
 D PA^%QSGESTI("L0",L,"CARD",$$CARD^%QSGEST7(L)-1)
 
 I INDICE="" D TRK(L)
 Q
 
EXI(L,IND) 
 N ADR
 S ADR=$$ADRLIS^%QSGEST7(L)
 Q:(ADR="")!(ADR=0) 0
 I IND="" Q 0
 Q $D(@ADR@(IND))>0
 
TRK(L) 
 N TRI
 I '($$EX^%QSGEST7(L)) Q
 D PSV^%QSGESTI("L0",L,"TRIABLE")
 S TRI=$$^%QSCALVA("L0",L,"TRIEE")
 D PSV^%QSGESTI("L0",L,"TRIEE")
 Q:TRI=""
 K @(TRI) Q
 
CARD(L) 
 N I,IND
 S IND=$O(@L@(""))
 F I=0:1 Q:IND=""  S IND=$O(@L@(IND))
 Q I
 
CARDL(L,CARD) 
 N ADR
 S CARD=0,ADR=$$ADRLIS^%QSGEST7(L) Q:ADR=""
 S CARD=$$CARD^%QCALIST(ADR)
 D PA^%QSGESTI("L0",L,"CARD",CARD,1)
 Q
 
TRI(L,ADRT) 
 N ADR,I,IND
 S ADR=$$ADRLIS^%QSGEST7(L) Q:ADR=""
 S ADRT=$$STOTRI,IND=""
 F I=1:1 S IND=$O(@ADR@(IND)) Q:IND=""  S @ADRT@(I)=IND,@ADR@(IND)=I
 D PA^%QSGESTI("L0",L,"TRIABLE","OUI",1),PA^%QSGESTI("L0",L,"TRIEE",ADRT,1)
 Q

