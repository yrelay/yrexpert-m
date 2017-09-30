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

;LKPHY^INT^1^59547,74867^0
LKPHY ;
 
 
 
 
OPEN(APP,NODE,DATE,UNIT,PROT,VECT,EXTERNE) 
 N TEMP,PPAR,MODE,I,VECTI,TIMEOUT,T,ZA,ER
 S VECTI=$P(VECT,"^",1),TIMEOUT=20
 
 S T=0
 
 
 
 S ROOT="^[QUI]LK("""_APP_""","""_NODE_""","""_DATE_""")"
 S ERRA=$$EX^LKZ(ROOT)_",""ERR"")"
 S TEMP="^TEMPORAI($J,""LKPHY"")"
 S DATA=$$EX^LKZ(ROOT)_",""DATA"")"
 S PAR=$$EX^LKZ(TEMP)_",""PAR"")"
 S TABERR=$$EX^LKZ(TEMP)_",""TABERR"")"
 S ADRTABER="LKP^LKPERR"
 S ADRPROT=PROT_"^LKPHYPRO"
 S PROTBR=$$EX^LKZ(TEMP)_",""PROTBR"")"
 K @(TEMP)
 I VECTI="" D SETERR^LKZ(TABERR,"VIM","ES","I")
 F I="ROOT","APP","NODE","DATE","UNIT","PROT","VECT","VECTI" S @PAR@(I)=@I
 S PVECT=$$EX^LKZ(TEMP)_",""PVECT"")"
 
 
 
 D ^LKTXT(@PAR@("VECT"),PVECT)
 
 D ^LKTXT(ADRPROT,PROTBR)
 
 D ^LKTXT(ADRTABER,TABERR)
 
 
 
 I EXTERNE'="" K @(PVECT) D GLOCOP^%QCAGLC(EXTERNE,PVECT)
 S MODE="" F I="CAR","ENR","LBL" S MODE=MODE_@PVECT@(I)
 I '($$OKP^LKZ(PROT)) D SETERR^LKZ(TABERR,"UP","ES","I")
 S ER=$$C
 S ER=$$O
 Q $$^LKPHYERR(ZA)+ER
 
O() S $ZT="ERREUR^LKPHYERR"
 O:TIMEOUT UNIT:(MODE:@PVECT@("SIZ"):@PVECT@("BLK")) S ZA=$ZA S:0 @TEMP@("ERR","TIMEOUT")=" Time out",T=1
 S $ZT=""
 Q 0
 
 
 
 
CLOSE() 
 N APP,NODE,DATE,UNIT,PROT,VECT,ROOT,ERRA,TEMP,DATA,PAR,PPRO,ER,ZA
 Q:$$CONTEXT^LKZ 1
 S ER=$$C
 S ER=ER+$$^LKPHYERR(ZA)
 K @(TEMP)
 Q ER
 
C() S $ZT="ERREUR^LKPHYERR"
 C UNIT S ZA=$ZA
 S $ZT="" Q 0
 
 
 
 
READ(DE) N APP,NODE,DATE,UNIT,PROT,VECT,ROOT,ERRA,TEMP,DATA,PAR,PPRO
 N BLOCK,BDE,IBLOCK,ERR
 Q:$$CONTEXT^LKZ 1
 S @("ERR=$$"_@PROTBR@("READ")_"("_DE_")")
 Q ERR
 
 
 
 
WRITE() N APP,NODE,DATE,UNIT,PROT,VECT,ROOT,ERRA,TEMP,DATA,PAR,PPRO,ERR
 Q:$$CONTEXT^LKZ 1
 S @("ERR=$$"_@PROTBR@("WRITE"))
 Q ERR
 
 
REWIND() N APP,NODE,DATE,UNIT,PROT,VECT,ROOT,ERRA,TEMP,DATA,PAR,PPRO,ZA,ER
 Q:$$CONTEXT^LKZ 1
 S ER=$$R
 Q ER+$$^LKPHYERR(ZA)
 
R() S $ZT="ERREUR^LKPHYERR"
 U UNIT W *-5 S ZA=$ZA U 0
 S $ZT="" Q 0
 
 
 
 
TM() N APP,NODE,DATE,UNIT,PROT,VECT,ROOT,ERRA,TEMP,DATA,PAR,PPRO,ZA,ERR
 Q:$$CONTEXT^LKZ 1
 D T
 S ERR=$$T
 Q ERR+$$^LKPHYERR(ZA)
 
T() S $ZT="ERREUR^LKPHYERR"
 U UNIT W *-3 S ZA=$ZA U 0
 S $ZT="" Q 0
 
 
 
 
EOF() N APP,NODE,DATE,UNIT,PROT,VECT,ROOT,ERRA,TEMP,DATA,PAR,PPRO,ZA,ERR
 Q:$$CONTEXT^LKZ 1
 D E
 S ERR=$$E
 Q ERR+$$^LKPHYERR(ZA)
 
E() S $ZT="ERREUR^LKPHYERR"
 U UNIT W *-9 S ZA=$ZA U 0
 S $ZT="" Q 0
 
 
TEST K ^LK,^TEMPORAI S DEBUG=1 D TEST2
 W !,"OPEN ",$$OPEN("APP","NODE","D",47,"ASCIIST","ASCS^LKPHYVEC","")
 W !,"REWIND",$$REWIND
 W !,"WRITE ",$$WRITE
 W !,"REWIND ",$$REWIND
 W !,"CLOSE ",$$CLOSE
 B
 G TEST3
SMALL D TEST2
 U 0 W !,"OPEN ",$$OPEN("APP","NODE","D",47,"ASCIIST","ASCS^LKPHYVEC","")
 U 0 W !,"REWIND",$$REWIND
 U 0 W !,"WRITE ",$$WRITE
 U 0 W !,"REWIND ",$$REWIND B
 U 0 W !,"CLOSE ",$$CLOSE
 B
TEST3 S A="TOTO.DAT"
 W !,"OPEN ",$$OPEN("APP","N","D",A,"ASCIIST","ASCS^LKPHYVEC","")
 W !,"REWIND",$$REWIND B
 W !,"READ ",$$READ(1)
 W !,"REWIND ",$$REWIND B
 W !,"CLOSE ",$$CLOSE
 Q
TEST2 S ROOT="^[QUI]LK(""APP"",""NODE"",""D"")"
 S DATA=$$EX^LKZ(ROOT)_",""DATA"")"
 K @(DATA)
 N I F I=1:1:15 S @DATA@(1,I)="NOM"_I_"   ATT1   ATT3"
 N K S K=1
 Q
MORE(I) 
 N P
 F P=1:1:2 S @DATA@(1,K)="VAL"_P_"     VALEUR"_K,K=K+1
 Q

