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

;%QMCPZ^INT^1^59547,73877^0
%QMCPZ ;
 
MVG(WH,QUI,BASE,IND,ATT,VAL,TYPE) 
 D MVG^%QSCALVA(BASE,IND,ATT,VAL,.TYPE)
 Q
MVS(WH,QUI,BASE,IND,ATT,VAL) 
 D MVS^%QSCALVA(BASE,IND,ATT,VAL)
 Q
PA(WH,QUI,BASE,IND,ATT,VAL,OR) 
 D PA^%QSGESTI(BASE,IND,ATT,VAL,OR)
 Q
QSCALVA(WH,QUI,BASE,IND,ATT) 
 Q $$^%QSCALVA(BASE,IND,ATT)
QSCALIN(WH,QUI,BASE,IND,ATT,OR) 
 Q $$^%QSCALIN(BASE,IND,ATT,OR)
CREER1(WH,QUI,BASE,IND,ORD,REEL,MSG,LIEN) 
 Q $$CREER1^%QSGEIND(BASE,IND,ORD,REEL,.MSG,LIEN)
CREPER(WH,QUI,BASE,IND,ORD,MSG) 
 Q $$CREPER^%QSGEIND(BASE,IND,ORD,.MSG)
SX(WH,QUI,BASE,IND) 
 D SX^%QSGESTK(BASE,IND)
 Q
OSUP(WH,QUI,BASE,IND,OR,LIEN,BASEL,INDL) 
 D OSUPS^%QSGEST3(BASE,IND,OR,LIEN,BASEL,INDL)
 Q
ADDO(WH,QUI,BASE,IND,OR,LIEN,BASEL,INDL) 
 D ADDO^%QSGEST3(BASE,IND,OR,LIEN,BASEL,INDL)
 Q
ADDS(WH,QUI,BASE,IND,LIEN,BASEL,INDL) 
 D ADDS^%QSGEST3(BASE,IND,LIEN,BASEL,INDL)
 Q
LISTATT1(WH,QUI,BASE,IND) 
 Q $$LISTATT1^%QSGEST6(BASE,IND)
ONE(WH,QUI) 
 Q $$LIENI^%QSGEL3
ONE1(WH,QUI,NOMLOGI) 
 Q $$ONE^%QSGEL3(NOMLOGI)
NOMLOG(WH,QUI,BASE) 
 Q $$NOMLOG^%QSF(BASE)
NOMINT(WH,QUI,BASE) 
 Q $$NOMINT^%QSF(BASE)
NOMEX(WH,QUI,BASED,NOM) 
 Q $$NOMEX^%QSGES10(BASED,NOM)
NOMFILS(WH,QUI,BASE,IND,BASEL,NOMEX) 
 Q $$NOMFILS^%QSGES10(BASE,IND,BASEL,NOMEX)
NOMPERE(WH,QUI,BASE,IND) 
 Q $$NOMPERE^%QSGES10(BASE,IND)
NOMOK(WH,QUI,BASE,IND) 
 Q $$NOMOK^%QSGEIND(BASE,IND)
TYPE(WH,QUI,BASE,ATT) 
 Q $$TYPE^%QSGEST9(BASE,ATT)
TYPE2(WH,QUI,BASE,ATT) 
 Q $$TYPE2^%QSGEST9(BASE,ATT)
 
TYPEASP(WH,QUI,BASE,ATT) 
 Q $$TYPMAJ^%QSGESPE(BASE,ATT)
PEREFILS(WH,QUI,RF,RP,LPF) 
 D PEREFILS^%QSGEL2(RF,.RP,.LPF)
 Q
LIENR(WH,QUI,L,REPS,REPD) 
 D LIENR^%QSGEL2(L,.REPS,.REPD)
 Q
LIENI(WH,QUI,LIEN) 
 Q $$LIENI^%QSGEL4(LIEN)
REPD(WH,QUI,BASE,LIEN) 
 Q $$REPD^%QSGEL2(BASE,LIEN)
REFLIEN(WH,QUI,O1,L,O2) 
 Q $$REFLIEN^%QSGES21(O1,L,O2)
QUAL(WH,QUI,BASE,L) 
 Q $$QUAL^%QSGEL2(BASE,L)
EXILIEN(WH,QUI,L) 
 Q $$EXILIEN^%QSGEL2(L)
TYPEL(WH,QUI,L) 
 Q $$TYPEL^%QSGES90(L)
LIEN(WH,QUI,REP,GLO) 
 D LIEN^%QSGEST9(REP,GLO)
 Q
LIA(WH,QUI,L,LATT) 
 D LIA^%QSGE1(L,LATT)
 Q
REPA(WH,QUI,LREP) 
 D REPA^%QSGEST9(LREP)
 Q
RANG(WH,QUI,R) 
 Q $$RANG^%QSGES17(R)
RPERE(WH,QUI,R) 
 Q $$RPERE^%QSGES17(R)
 
BASE(WH,QUI,LISTE) 
 Q $$BASE^%QSGEST7(LISTE)
ADRLIS(WH,QUI,LISTE) 
 Q $$ADRLIS^%QSGEST7(LISTE)
ADRLT(WH,QUI,LISTE) 
 Q $$ADRLT^%QSGEST7(LISTE)
PREF(WH,QUI,LISTE) 
 Q $$PREF^%QSGEST7(LISTE)
CARD(WH,QUI,LISTE) 
 Q $$CARD^%QSGEST7(LISTE)
SOURCE(WH,QUI,LISTE) 
 Q $$SOURCE^%QSGEST7(LISTE)
AUTRE(WH,QUI,LISTE) 
 Q $$AUTRE^%QSGEST7(LISTE)
TYP(WH,QUI,LISTE) 
 Q $$TYP^%QSGEST7(LISTE)
NOM(WH,QUI,PREF) 
 Q $$NOM^%QSGES11(PREF)
STO(WH,QUI,LISTE) 
 Q $$STO^%QSGES11(LISTE)
STOTRI(WH,QUI) 
 Q $$STOTRI^%QSGES11
CRETYP(WH,QUI,R,L,TL,CARD,SOURCE,ADR,AUTRE,TYP,TRI) 
 D CRETYP^%QSGES11(R,L,TL,CARD,SOURCE,ADR,AUTRE,TYP,TRI)
 Q
DEL(WH,QUI,LISTE) 
 D DEL^%QSGES11(LISTE)
 Q
TRI(WH,QUI,LISTE,ADRLT) 
 D TRI^%QSGES11(LISTE,.ADRLT)
 Q
LISTA(WH,QUI,LISTE,LISTATT) 
 D LISTA^%QSGE1(LISTE,LISTATT)
 Q
IR(WH,QUI,BASE,IND) 
 Q $$IR^%QSGEST5(BASE,IND)
SEL(WH,QUI,LBASE,TITRE) 
 Q $$SEL^%QS0SEL1(LBASE,TITRE)
 
MAJ(WH,QUI,NOM) 
 D MAJ^%QCAPOP(NOM)
 Q
 
EX(WH,QUI,LILA) 
 Q $$EX^%QMLILA(LILA)
LIST(WH,QUI,LILA) 
 Q $$LIST^%QMLILA(LILA)
 
M(WH,QUI,MOT) 
 Q $$M^%QAX(MOT)
S(WH,QUI,MOT) 
 Q $$S^%QAX(MOT)
COD(WH,QUI) 
 Q $$COD^%QAX
INS(WH,QUI,COD,MOT,SYN) 
 D INS(COD,MOT,SYN)
 Q
SUP(WH,QUI,COD,MOT,SYN) 
 D SUP(COD,MOT,SYN)
 Q
 
ORDRE(WH,QUI,BASE,IND) 
 Q $$ORDRE^%QSNOTE(WH,BASE,IND)
ORDRH(WH,QUI,BASE,IND) 
 Q $$ORDRE^%QSNHIST(WH,BASE,IND)
 
 
 
KREQ(WH,QUI,RQ) 
 D SUPPRIME^%QSINTER(RQ,0)
 Q
 
KTRT(WH,QUI,TRT) 
 D SUPP^%TLINTER(TRT)
 Q
EXTRT(WH,QUI,TRT) 
 Q $$EXISTE^%TLGEST(TRT)
CREERTRT(WH,QUI,TRT,COMM,ACTI,ANAL) 
 Q $$CREER^%TLINTER(TRT,COMM,ACTI,ANAL)
 Q
GOODANA(WH,QUI,TRT) 
 Q $$OKANA^%TLGEST(TRT)
 
KEDF(WH,QUI,EDF) 
 D SUPP^%EDFGEST(EDF)
 Q
CREERTL(WH,QUI,TRT) 
 D CREER^%TLGEST(TRT)
 Q
 
KEDM(WH,QUI,EDM) 
 D SUPP^%EDDGEST(EDM)
 Q
 
KETAT(WH,QUI,ETAT) 
 D SUP^%QSETINI(ETAT)
 Q
 
ADR() Q "^["""_QUI_"""]RQSGLO(""QMCP4"")"
ADR1(COPIE) 
 Q "^["""_QUI_"""]RQSGLO(""QMCP4"","""_COPIE_""")"
ADRTX(COPIE) 
 Q "^["""_QUI_"""]RQSGLO(""QMCP4"","""_COPIE_""",""TEXTE"")"
ADRSTO(COPIE) 
 Q "^["""_QUI_"""]RQSGLO(""QMCP4"","""_COPIE_""",""STO"")"
ADRSTR(COPIE) 
 Q "^["""_QUI_"""]RQSGLO(""QMCP4"","""_COPIE_""",""STRUCT"")"
ADRANA(COPIE) 
 Q "^["""_QUI_"""]RQSGLO(""QMCP4"","""_COPIE_""",""OKANA"")"
 
SETANA(COPIE,OK) 
 N ADR
 S ADR=$$ADRANA(COPIE)
 S @ADR=OK
 Q
OKANA(COPIE) 
 N ADR
 S ADR=$$ADRANA(COPIE)
 I ($D(@ADR)#10)=0 Q 0
 S ADR=@ADR Q ADR
 
EXCOP(COPIE) 
 N ADR
 S ADR=$$ADRSTR(COPIE)
 I ($D(@ADR)#10)=0 Q 0
 Q 1
 
AFFERR(ERR,MODE) N P
 D REAFF^%QMCP4(MODE)
 S P=1
 D CARSA^%VVIDEO(0,2,80,20)
 D REAFF^%QULIMO3(1,1,ERR,0,2,80,20)
 D VISU^%QULIMO(0,2,80,20,ERR,.P)
 Q
NXTRIA(WH,QUI,REP,IND,ATT) 
 Q $$NXTRIA^%QSTRUC8(REP,IND,ATT)

