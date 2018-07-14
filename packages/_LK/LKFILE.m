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
;! HL001 ! HL     ! 01/01/01 ! Erreur %GTM-E-INVCMD -> $ZT="G ..."            !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;LKFILE^INT^1^59547,74867^0
LKFILE ;
 
 
 
 
 
 
OPEN(APP,NODE,DATE,UNIT,PROT,VECT,LL) 
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
 S MODE="" F I="NEW","READ","WRITE","STEAM" S MODE=MODE_@PVECT@(I)
 I '($$OKP^LKZ(PROT)) D SETERR^LKZ(TABERR,"UP","ES","I")
 
 S ER=$$C
 S ER=$$O
 Q ER
O() S $ZT="G ERREUR^LKPHYERR"
 O:TIMEOUT UNIT:(MODE:@PVECT@("SIZ"):@PVECT@("BLK")) S ZA=$ZA S:0 @TEMP@("ERR","TIMEOUT")=" Time out",T=1
 S $ZT="" Q 0
 
 
 
CLOSE() 
 N APP,NODE,DATE,UNIT,PROT,VECT,ROOT,ERRA,TEMP,DATA,PAR,PPRO
 N ER,ZA
 Q:$$CONTEXT^LKZ 1
 S ER=$$C
 K @(TEMP)
 Q ER
C() S $ZT="G ERREUR^LKPHYERR"
 C UNIT S ZA=$ZA
 S $ZT="" Q 0
 
 
 
READ(DE) N APP,NODE,DATE,UNIT,PROT,VECT,ROOT,ERRA,TEMP,DATA,PAR,PPRO
 N BLOCK,BDE,IBLOCK,ERR
 Q:$$CONTEXT^LKZ 1
 S @("ERR=$$"_@PROTBR@("READ"))
 Q ERR
 
 
 
WRITE() N APP,NODE,DATE,UNIT,PROT,VECT,ROOT,ERRA,TEMP,DATA,PAR,PPRO
 N ERR
 Q:$$CONTEXT^LKZ 1
 S @("ERR=$$"_@PROTBR@("WRITE"))
 Q ERR
 
TEST K ^LK,^TEMPORAI S DEBUG=1 D TEST2
 W !,"OPEN ",$$OPEN("APP","NODE","D",47,"ASCIIST","ASCS^LKPHYVEC")
 W !,"WRITE ",$$WRITE
 W !,"CLOSE ",$$CLOSE
 W !,"OPEN ",$$OPEN("APP","N","D",47,"ASCIIST","ASCS^LKPHYVEC")
 W !,"READ ",$$READ(1)
 W !,"CLOSE ",$$CLOSE
 Q
TEST2 S ROOT="^[QUI]LK(""APP"",""NODE"",""D"")"
 S DATA=$$EX^LKZ(ROOT)_",""DATA"")"
 N I F I=1:1:15 S @DATA@(1,I)="BLOCK "_I_" VOL 1 "
 S @DATA@(1,4)="UHGJHGFUYHGUYTOUYTVUYTUHGJKHGJHGJHJHGJHJHGJHJGJHGJHJGJHJGJHGJHGJHJGJJHGJHGJHGJHGH"
 S @DATA@(1,6)="UHGJHGFUYHGUYTOUYTVUYTUHGJKHGJHGJHJHGJHJHGJHJGJHGJHJGJHJGJHGJHGJHJGJJHGJHGJHGJTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTHGH"
 S @DATA@(1,8)=7576765765876765E15
 Q
 ;
 ;

