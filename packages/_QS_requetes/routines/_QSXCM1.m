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

;%QSXCM1^INT^1^59547,73883^0
%QSXCM1 ;
 
 
 
 
 
 
 
 
 
 
 
 
PARAM(SCR,RESUL) 
 N CMS,NOMTAB,ABENDSCR,TEST
 N %AJM,%A,%B,%DIFL,%IGR,%LIXD,%LIXG,%LIYB,%LIYH,%MC,%U,%V,%VINV
 N %W,%X,%Y,ADX,ADY,AFF,A,AX,AY,C,CH,CP,CTRLA,CTRLB,CTRLC,CTRLD,CTRLE
 N CTRLF,CTRLG,CTRLH,CTRLI,CTRLJ,CTRLK,T1,T2,T3,T4,T5,T6,T7,T8
 N D,DEP,ECR,ESCMV,IC,ICC,I,IK,IL,IV,LGC,LIB,LL,LPG,LXD,LXG,MOD
 N NVLEG,ODX,ODY,PCX,PCY,PD,PG,PL,PS,PX,PY,REFUSE,REP,REVID,SCR1,STOPUC
 N TAB,TBMOV,I,TREETUD,UCONT,UYI,VID,VLEG,Z,UYT,XX,Y1,YY
 D CLEPAG^%VVIDEO
 S %AJM="A",CMS=0,NOMTAB="" D ^%VACTISC(SCR)
 S TEST=1 F I=1:1:^%SCRE(SCR) S TEST=TEST&($$^%QCAZG("RESUL(I)")'="")
 Q:TEST=0 1
 Q 0
FIN Q 1
INT(PAR) 
 N RESUL
 I $$PARAM("QSXDEF",.RESUL) Q
 K @(PAR)
 S @PAR@("CLIEN")=RESUL(2)
 S @PAR@("CATTR")=RESUL(3)
 S @PAR@("ULIEN")=RESUL(4)
 S @PAR@("ULIENL")=RESUL(5)
 S @PAR@("NOM")=RESUL(6)
 S @PAR@("NOML")=RESUL(7)
 S @PAR@("ORPHELIN")=RESUL(8)
 S @PAR@("ORPHELINL")=RESUL(9)
 Q
DEF(PAR) 
 K @(PAR)
 S @PAR@("CLIEN")=1
 S @PAR@("CATTR")=0
 S @PAR@("ULIEN")=1
 S @PAR@("ULIENL")=0
 S @PAR@("NOM")=1
 S @PAR@("NOML")=0
 S @PAR@("ORPHELIN")=0
 S @PAR@("ORPHELINL")=0
 Q
GO(PAR,STO) 
 N VISU
 S VISU=0
 D CLEPAG^%VVIDEO,ON^%VZEATT
 I '($D(@PAR)) D DEF(PAR)
 K @(STO)
 
 D:@PAR@("CATTR")!@PAR@("CLIEN") QSXCB^%QSXCB(@PAR@("CLIEN"),@PAR@("CATTR"),STO,VISU)
 
 D:@PAR@("ULIEN") QSXLI^%QSXLI($$CONCAS^%QZCHAD(STO,"ULIEN"),@PAR@("ULIENL"))
 
 D:@PAR@("NOM") QSXNOM^%QSXNOM($$CONCAS^%QZCHAD(STO,"NOM"),@PAR@("NOML"))
 
 D:@PAR@("ORPHELIN") QSXE1^%QSXE1($$CONCAS^%QZCHAD(STO,"ORPHELIN"),@PAR@("ORPHELINL"))
 D OFF^%VZEATT
 Q
 
IMP(STO) 
 N TEMP,IMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S IMP=$$CONCAS^%QZCHAD(TEMP,"IMP")
 D CLEPAG^%VVIDEO,ON^%VZEATT
 
 
 D ^%QSXCC(STO,"LIEN",IMP),PAGE(IMP)
 
 D ^%QSXCC(STO,"ATT",IMP),PAGE(IMP)
 
 D IMP^%QSXLI($$CONCAS^%QZCHAD(STO,"ULIEN"),IMP),PAGE(IMP)
 
 D IMP^%QSXNOM($$CONCAS^%QZCHAD(STO,"NOM"),IMP),PAGE(IMP)
 
 D IMP^%QSXE1($$CONCAS^%QZCHAD(STO,"ORPHELIN"),IMP),PAGE(IMP)
 
 D MORE(IMP)
 
 D AFF^%QSXCC(IMP)
 K @(TEMP)
 Q
 
MORE(IMP) 
 N I
 F I=$ZP(@IMP@(""))+1:1:30 S @IMP@(I)=""
 Q
 
PAGE(IMP) 
 N I,TRAIT,J
 S TRAIT=""
 F I=1:1:80 S TRAIT=TRAIT_"-"
 S J=$ZP(@IMP@(""))
 F I=J+1:1:J+3 S @IMP@(I)=""
 S I=I+1,@IMP@(I)=TRAIT
 S J=I
 F I=J:1:J+2 S @IMP@(I)=""
 Q

