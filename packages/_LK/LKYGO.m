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

;LKYGO^INT^1^59547,74868^0
LKYGO(LISTE,TRI,BASE,DAT) 
 
 
 
 
 
 N O,INDI,TEMP,ROOT,OKECR
 N LLIST,LLIEN,LATRAIT,LREFOBJ,LTRANS,LCHETR,LLIENS2,TENR,TREF,REFTEMP
 S OKECR=$$GET^%SGVAR("ECR")
 I OKECR D POCLEPA^%VVIDEO W $$BLD^%VVIDEO1_$$BLK^%VVIDEO1_$$XY^%VVIDEO1(0,22)_$$^%QZCHW("Un instant ... transfert en cours")_$$NORM^%VVIDEO1
 S ROOT="^[QUI]LK(""TOLAS"",""D"")" K @(ROOT)
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 
 S LATRAIT=$$CONCAS^%QZCHAD(TEMP,"A.TR")
 S LREFOBJ=$$CONCAS^%QZCHAD(TEMP,"REF.OBJ")
 S LLIST=$$CONCAS^%QZCHAD(TEMP,"FILS")
 S LLIEN=$$CONCAS^%QZCHAD(TEMP,"LIENS")
 S LLIEN2=$$CONCAS^%QZCHAD(TEMP,"LIENS2")
 S LTRANS=$$CONCAS^%QZCHAD(TEMP,"TRANS")
 S LCHETR=$$CONCAS^%QZCHAD(TEMP,"CHEMIN.TR")
 S TENR=$$CONCAS^%QZCHAD(TEMP,"TENR")
 S TREF=$$CONCAS^%QZCHAD(TEMP,"TREF")
 S REFTEMP=$$CONCAS^%QZCHAD(TEMP,"REF.TEMP")
 K @(TEMP)
 S (INDI,O)=""
PARC 
 
 I TRI'="OUI" S O=$O(@LISTE@(O)) I O="" G FIN
 
 I TRI="OUI" S INDI=$O(@LISTE@(INDI)) I INDI="" G FIN
 I TRI="OUI" S O=@LISTE@(INDI)
 I OKECR D POCLEPA^%VVIDEO W BASE," ",O
 D OBJET(BASE,O,1,DAT,ROOT)
 K @(TEMP)
 G PARC
FIN D:OKECR POCLEPA^%VVIDEO Q
 
 
OBJET(REP,IND,INIT,DAT,RES) 
 N LIEN,ETAT,L,LL,NBL,NBLL,OR,REPFILS,REPI,RREF,REF,I,L2
 K @(LATRAIT)
 K @(LREFOBJ)
 S @LREFOBJ@(1)=IND
 S @LREFOBJ@(1,"CH")=REP
 S @LREFOBJ@(1,"REP")=$$NOMINT^%QSF(REP)
 S @LATRAIT@(REP,1)=IND
 S L="",I=1
IATRAIT G:'($D(@LATRAIT)) MAJVAL
BATRAIT S L=$O(@LATRAIT@(L))
 G:L="" IATRAIT
 S NBL=$L(L,"~")
 G:NBL=1 CHEM
 S LL=$P(L,"~",1,NBL-1)
 G:'($D(@LCHETR@(LL))) BATRAIT
 
CHEM S LONGL=$L(L)
 S LL=L
 K @(LLIEN)
BCHEM S LL=$O(@DAT@("REP","L",LL))
 G:LL="" REF
 G:LL=L BCHEM
 G:$E(LL,1,LONGL)'=L REF
 S NBLL=$L(LL,"~")
 G:NBLL'=(NBL+1) BCHEM
 S L2=$P(LL,"~",NBLL)
 S @LLIEN@(L2,LL)=""
 G BCHEM
REF S REF=""
 G:'($D(@LLIEN)) FINREF
BREF S REF=$O(@LATRAIT@(L,REF))
 G:REF="" FINREF
 S LL=""
 K @(LLIEN2)
 D GLOCOP^%QCAGLC(LLIEN,LLIEN2)
 S OB=@LREFOBJ@(REF)
 S REPI=@LREFOBJ@(REF,"REP")
BREFL S LL=$O(@LLIEN2@(LL))
 G:LL="" BREF
 G:$E(LL,1,5)="LIEN." INDLI^LKYG2
 G:$E(LL,1,8)="INVERSE." INDLI2^LKYG2
 S REPFILS=$$REPD^%QSGEL2(REPI,LL)
 K @(LLIST)
 D MVG^%QSCALVA(REPI,OB,LL,LLIST,.TYP)
 G:(@LLIST=0)!(TYP=0) BREFL
 S OR=""
PLI S OR=$O(@LLIST@(OR))
 G:OR="" FLI
 S IND=$S(TYP=2:$$NOMFILS^%QSGES10(REPI,OB,REPFILS,@LLIST@(OR)),1:@LLIST@(OR))
 S RREF=REF_"~"_I
 S @LREFOBJ@(RREF)=IND
 S @LREFOBJ@(RREF,"REP")=REPFILS
 S @LREFOBJ@(RREF,"CH")=$O(@LLIEN@(LL,""))
 S @LATRAIT@(@LREFOBJ@(RREF,"CH"),RREF)=""
 S @LTRANS@(L,OB,REF)=""
 S @LTRANS@(L,OB,REF,LL,IND,RREF)=""
 S I=I+1
 G PLI
 
FLI K @LLIEN2@(LL)
 S LL=""
 G BREFL
 
 
FINREF S @LCHETR@(L)=""
 K @LATRAIT@(L)
 G BATRAIT
 
MAJVAL 
 S NOENR=1
 S OB=@LREFOBJ@(1)
 S REF=$O(@LTRANS@(REP,OB,""))
 S @TENR@(NOENR,REP,OB)=$$NOMINT^%QSF(REP)
 S @TREF@(REP,OB,NOENR)=""
 S @LATRAIT@(REP,OB)=""
 S CHEM=""
BCHEMI S CHEM=$O(@LATRAIT@(CHEM))
 G:CHEM="" STOVAL
 S T1=$$CONCAT^%QZCHAD(LTRANS,""""_CHEM_"""")
 S OBJ=""
BOBJ S OBJ=$O(@LATRAIT@(CHEM,OBJ))
 G:OBJ="" BCHEMI
 S REF=$O(@LTRANS@(CHEM,OBJ,""))
 G:REF="" FLIEN
 S T2=$$CONCAT^%QZCHAD(T1,$$CLE(OBJ)_","_$$CLE(REF))
 S L=""
BLIEN S L=$O(@LTRANS@(CHEM,OBJ,REF,L))
 G:L="" FLIEN
 K @(REFTEMP)
 S T5=$$CONCAT^%QZCHAD(TREF,""""_CHEM_""","_$$CLE(OBJ))
 D GLOCOP^%QCAGLC(T5,REFTEMP)
 D TRAITL($$CONCAS^%QZCHAD(T2,L),REFTEMP,CHEM,L,@LREFOBJ@(REF,"REP"))
 D TUERREF(REFTEMP)
 G BLIEN
FLIEN K @LATRAIT@(CHEM,OBJ)
 G BOBJ
 
TRAITL(TTRANS,TREFO,CHEM,LIEN,REP) 
 N OB2,REF2,ENR,LLI,REF,REPI
 S LLI=$S($E(LIEN,1,5)="LIEN.":$P(CHEM,"~",1,$L(CHEM,"~")-1)_"~"_LIEN,$E(LIEN,1,8)="INVERSE.":$P(CHEM,"~",1,$L(CHEM,"~")-1)_"~"_LIEN,1:CHEM_"~"_LIEN)
 S OB2=""
BOTRTL S OB2=$O(@TTRANS@(OB2))
 Q:OB2=""
 S REF=$O(@TTRANS@(OB2,""))
 S REPI=@LREFOBJ@(REF,"REP")
 S @LATRAIT@(LLI,OB2)=""
 S ENR=""
BENR1T S ENR=$O(@TREFO@(ENR))
 G:ENR="" BOTRTL
 D COPENR(ENR,LIEN,OB2)
 S @TREF@(LLI,OB2,NOENR)=""
 S @TENR@(NOENR,LLI,OB2)=REPI
 G BENR1T
 
TUERREF(TREFO) 
 N ENR,CH,OB
 S ENR=""
BTUER1 S ENR=$O(@TREFO@(ENR))
 Q:ENR=""
 S CH=""
BTUER2 S CH=$O(@TENR@(ENR,CH))
 G:CH="" BTUER1
 S OB=""
BTUER3 S OB=$O(@TENR@(ENR,CH,OB))
 G:OB="" BTUER2
 K @TENR@(ENR,CH,OB)
 K @TREF@(CH,OB,ENR)
 G BTUER3
 
COPENR(ENR,LIEN,OB2) 
 N CH,OB
 S NOENR=NOENR+1
 S CH=""
BCOP1 S CH=$O(@TENR@(ENR,CH))
 Q:CH=""
 S OB=""
BCOP2 S OB=$O(@TENR@(ENR,CH,OB))
 G:OB="" BCOP1
 S @TREF@(CH,OB,NOENR)=""
 S @TENR@(NOENR,CH,OB)=@TENR@(ENR,CH,OB)
 G BCOP2
 
CLE(LIB) 
 N VAL
 S VAL=LIB+0
 I VAL=LIB Q LIB
 Q """"_LIB_""""
 
STOVAL D ^LKYGSTO(TENR,DAT)
 Q

