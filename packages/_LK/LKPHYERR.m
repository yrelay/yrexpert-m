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

;LKPHYERR^INT^1^59547,74867^0
LKPHYERR(ER) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N ER2,A,P
 N APP,NODE,DATE,UNIT,PROT,VECT,ROOT,ERRA,TEMP,DATA,PAR,PPRO
 S A=$$CONTEXT^LKZ
 S ER2=$$ADR^%QZNBA16(ER,2)
 K @TEMP@("ERR")
 S A=1 N I F I=0:1:15 D:((ER2\A)#10)=1 TR S A=A*10
 Q ER
TR S P=$$PAR(I)
 S @TEMP@("ERR",P)=$$TXT(I)
 S @TEMP@("NERR",P)=$$NERR(P)+1
 I $D(DEBUG),DEBUG=1 U 0 W !,@TEMP@("ERR",P),"  ",@TEMP@("NERR",P)
 Q
PAR(J) Q $P($T(MSG+J+1),";;",2)
TXT(J) Q $P($T(MSG+J+1),";;",3)
 
 
 
 
 
 
 
 
 
 
ERR(NB) Q:$D(@TEMP@("ERR",NB)) 1 Q 0
 
 
 
 
 
 
 
 
 
 
NERR(NB) Q:$D(@TEMP@("NERR",NB)) @TEMP@("NERR",NB) Q 0
 
 
 
 
 
 
 
 
 
 
ERRMSG(NB) Q:$D(@TEMP@("NERR",NB)) @TEMP@("NERR",NB) Q ""
ERRM(NB) Q:$D(@TABERR@(NB)) @TABERR@(NB) Q ""
 
 
 
ERREUR S ZA=$ZA
 I '((($ZE["TAP")!($ZE["NOTOPEN"))!($ZE["ENDOFFILE")) D ^%VSQUEAK W $$^%QZCHW("Erreur MUMPS : "),$ZE Q 1
 I $ZE["TAP" S @TEMP@("ERR",$ZE)="",@TEMP@("NERR",$ZE)=$$NERR($ZE)+1
 I $ZE["NOTOPEN" S @TEMP@("ERR","NO")=$ZE,@TEMP@("NERR","NO")=$$NERR("NO")+1
 I $ZE["ENDOFFILE" S @TEMP@("ERR","EOF")=$ZE,@TEMP@("NERR","EOF")=$$NERR("NO")+1
 Q 1
 
MSG ;;
0 ;;LE;;" Logical Error - mixed Reads and Writes"
1 ;;RW;;" Rewinding"
2 ;;WP;;" Write Protected"
3 ;;ES;;" Error Summary"
4 ;;DTY;;" Density TE16 - 0: 800 bpi, 1: 1600 bpi"
5 ;;BOT;;" Beginning of Tape"
6 ;;ONL;;" On Line"
7 ;;CDE;;" Controller or Drive Error"
8 ;;BTE;;" Bad Tape error"
9 ;;RLE;;" Record Lenght Error"
10 ;;EOT;;" End of Tape"
11 ;;BGL;;" Bus Grant Late"
12 ;;CRC;;" Parity or CRC Error"
13 ;;TCE;;" Tape Controller Error"
14 ;;TM;;" Tape Mark"
15 ;;TNR;;" Tape Not Ready"
 
TEST S TEMP="^TEMPORAI($J,""LKPHY"")"
 W $$^LKPHYERR(5)
 Q
 S $ZT="ERREUR" W 1/0 Q
 ;

