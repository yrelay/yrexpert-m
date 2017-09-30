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

;%SDCDEFI^INT^1^59547,73888^0
%SDCDEFI ;
 
 
 
 
 
 
 
 
FEN 
 
 S GLO=$$CONCAS^%QZCHAD(TEMP,"FENO")
 S LISOB=$$CONCAS^%QZCHAD(TEMP,"OBJETS")
 
 S ADRO=$$CONCAS^%QZCHAD(STO,"OBJ")
 
 S @GLO@("X")=0,@GLO@("Y")=10,@GLO@("L")=79,@GLO@("H")=11,@GLO@("TI")="Objets"
 
 S @GLO@("LI",1,"T")="numero",@GLO@("LI",1,"X")=1,@GLO@("LI",1,"U")="NUM^%SDCDEFI"
 S @GLO@("LI",2,"T")="nom",@GLO@("LI",2,"X")=8,@GLO@("LI",2,"U")="OBJ^%SDCDEFI"
 S @GLO@("LI",3,"T")="version",@GLO@("LI",3,"X")=37,@GLO@("LI",3,"U")="VERS^%SDCDEFI"
 S @GLO@("LI",4,"T")="echelle",@GLO@("LI",4,"X")=54,@GLO@("LI",4,"U")="ECH^%SDCDEFI"
 S @GLO@("LI",5,"T")="angle",@GLO@("LI",5,"X")=62,@GLO@("LI",5,"U")="ANG^%SDCDEFI"
 S @GLO@("LI",6,"T")="X0",@GLO@("LI",6,"X")=68,@GLO@("LI",6,"U")="OROB^%SDCDEFI"
 S @GLO@("LI",7,"T")="Y0",@GLO@("LI",7,"X")=73,@GLO@("LI",7,"U")="OROB^%SDCDEFI"
 
 S @GLO@("A")=LISOB
 I MODOBJ=1 S @GLO@("UCAJ")="AJOBJ^%SDCDEFI",@GLO@("UCSU")="SUOBJ^%SDCDEFI"
 S @GLO@("UCMO")="MOOBJ^%SDCDEFI"
 I MODOBJ=0 S @GLO@("CHI",1)="",@GLO@("CHI",2)="",@GLO@("CHI",3)=""
 
 
 S GLP=$$CONCAS^%QZCHAD(TEMP,"FENP")
 S LISPT=$$CONCAS^%QZCHAD(TEMP,"POINTS")
 
 S ADRP=$$CONCAS^%QZCHAD(STO,"PT")
 
 S @GLP@("X")=36,@GLP@("Y")=2,@GLP@("L")=44,@GLP@("H")=8,@GLP@("TI")="Points"
 
 S @GLP@("LI",1,"T")="numero",@GLP@("LI",1,"X")=1,@GLP@("LI",1,"U")="PNT^%SDCDEFI"
 S @GLP@("LI",2,"T")="abscisse",@GLP@("LI",2,"X")=25,@GLP@("LI",2,"U")="ORPT^%SDCDEFI"
 S @GLP@("LI",3,"T")="ordonnee",@GLP@("LI",3,"X")=34,@GLP@("LI",3,"U")="ORPT^%SDCDEFI"
 
 S @GLP@("CHI",1)=""
 
 S @GLP@("A")=LISPT
 S @GLP@("UCMO")="MOPT^%SDCDEFI"
 Q
 
 
NUM 
 I '($$NUM^%QZNBN(Y1)) S OK=0 Q
 
 S OK='($D(@ADRO@(Y1)))
 Q
OBJ 
 I $$GETLBLAN^%VTLBLAN(Y1)'="?" S OK=$$EXO^%SDOCMS(Y1) Q
 
 S Y1=$$UN^%PKCHOIX("^[QUI]SDOBJ",1,11,9)
 S OK=Y1'="",REAF=1
 Q
VERS 
 N OBJ
 S OBJ=$P(@A@(LC),"^",2)
 I $$GETLBLAN^%VTLBLAN(Y1)'="?" S OK=$$EXI^%SDOCMS(OBJ,Y1) Q
 
 S Y1=$$UN^%PKCHOIX($$CONCAS^%QZCHAD("^[QUI]SDOBJ",OBJ),1,11,9)
 S OK=Y1'="",REAF=1
 Q
ECH 
 I Y1="" S Y1=1
 S OK=$$POS^%QZNBN(Y1)
 Q
ANG 
 I Y1="" S Y1=0
 S OK=$$ANG^%QZNBN(Y1)
 Q
OROB 
 I Y1="" S Y1=0
 
 
 S OK=$$NUM^%QZNBN(Y1)
 Q
 
SUOBJ 
 N N
 S N=$P(@A@(LC),"^",1)
 K @ADRO@(N)
 S OK=1,(INIGLO,INIGLP)=1
 Q
 
AJOBJ 
 N N,CO
 S OK=1
 S CO=@A@(LC),N=$P(CO,"^",1)
 D MAJ(CO,N)
 S (INIGLO,INIGLP)=1
 Q
 
MAJ(CO,N) 
 S @ADRO@(N,"R",$P(CO,"^",2),$P(CO,"^",3))=""
 S @ADRO@(N,"ECH")=$P(CO,"^",4),@ADRO@(N,"ANG")=$P(CO,"^",5)
 S @ADRO@(N,"X")=$P(CO,"^",6),@ADRO@(N,"Y")=$P(CO,"^",7)
 Q
 
MOOBJ 
 N N,CX
 D SUOBJ
 S N=$P(@A@(LC),"^",1) I COL=1 S N=Y1
 S CX=@A@(LC),$P(CX,"^",COL)=Y1
 D MAJ(CX,N)
 Q
 
 
NOM 
 I '($$NUM^%QZNBN(Y1)) S OK=0 Q
 
 S OK='($D(@ADRP@(Y1)))
 Q
ORPT 
 I Y1="" S Y1=0
 I $$GETLBLAN^%VTLBLAN(Y1)'="?" S OK=$$ENT^%QZNBN(Y1) Q
 
 S OK=0,REAF=1,Y1=$P(@A@(LC),"^",1)
 S Y1=$$UN^%PKCHOIX($$CONCAT^%QZCHAD(PTOBJ,$S($$NUM^%QZNBN(Y1):Y1,1:""""_Y1_"""")),38,3,7)
 Q
 
MOPT 
 N N,CO
 S OK=1
 
 S CO=@A@(LC),N=$P(CO,"^",1)
 S @ADRP@(N,"X")=$S(COL=2:Y1,1:$P(CO,"^",2))
 S @ADRP@(N,"Y")=$S(COL=3:Y1,1:$P(CO,"^",3))
 S INIGLP=1
 Q
 
 
INOB 
 I INIGLO=0 Q
 
 K @(LISOB)
 N I,NOBJ,OBJ,VO
 S NOBJ=""
 F I=1:1 S NOBJ=$O(@ADRO@(NOBJ)) Q:NOBJ=""  D VAL
 S INIGLO=0
 Q
VAL 
 S OBJ=$O(@ADRO@(NOBJ,"R","")),VO=$O(@ADRO@(NOBJ,"R",OBJ,""))
 S @LISOB@(I)=NOBJ_"^"_OBJ_"^"_VO_"^"_@ADRO@(NOBJ,"ECH")_"^"_@ADRO@(NOBJ,"ANG")_"^"_@ADRO@(NOBJ,"X")_"^"_@ADRO@(NOBJ,"Y")
 Q
 
 
INPT 
 I INIGLP=0 Q
 N ADR,I,NOBJ,NPT,OBJ,VO,XP,YP,TAB
 
 K @(LISPT)
 
 S TAB=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB") K @(TAB)
 S PTOBJ=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"PTOBJ") K @(PTOBJ)
 S INIGLP=0
 
 S NOBJ="",I=0
INPO S NOBJ=$O(@ADRO@(NOBJ))
 I NOBJ="" K @(TAB) Q
 
 S OBJ=$O(@ADRO@(NOBJ,"R","")),VO=$O(@ADRO@(NOBJ,"R",OBJ,""))
 
 S ADR=$$CONCAS^%QZCHAD($$DEF^%SDOCMS(OBJ,VO),"PT")
 
 S NPT=""
INPP S NPT=$O(@ADR@(NPT))
 I NPT="" G INPO
 S @PTOBJ@(NPT,$E(OBJ,1,40))=""
 I $D(@TAB@(NPT)) G INPP
 S XP=$S($D(@ADRP@(NPT,"X")):@ADRP@(NPT,"X"),1:"")
 S YP=$S($D(@ADRP@(NPT,"Y")):@ADRP@(NPT,"Y"),1:"")
 
 S I=I+1,@LISPT@(I)=NPT_"^"_XP_"^"_YP
 S @TAB@(NPT)=""
 G INPP

