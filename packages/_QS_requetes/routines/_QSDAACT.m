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

;%QSDAACT^INT^1^59547,73881^0
%QSDAACT(BASE,OBJ,FC,OK) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N GFOCA,IFC,%I,%U,%V,FC2,FC2S,COMP,P1,P2,VAL1,VAL2,IO,IOC,IND1,IND2,OK2
 N FIN,FCS,VAL,F1,F2,OPL,ATRETDA,FCA,RETEV
 S ATREDTA="FIN^%QSDAACT"
 G DEB
 
FIN Q
 
DEB S GFOCA=$$ADR,FCS=FC
 S IFC=""
BDEB S IFC=$O(@GFOCA@(IFC))
 G:IFC="" BDEBF
 S FC2=@GFOCA@(IFC)
 I (FC2'["&")&(FC2'["!") S FCA=FC2,RETEV="BDEB0" G EVAL
BDEB0 G:(FC2'["!")&(FC2'["&") BDEB
 S OPL=$S(FC2["&":"&",1:"!"),F1=$P(FC2,OPL,1),F1=$E(F1,2,$L(F1)),F2=$P(FC2,OPL,2),F2=$E(F2,1,$L(F2)-1)
 S FCA=F1,RETEV="BDEB1"
 G EVAL
BDEB1 S FCA=F2,RETEV="BDEB"
 G EVAL
 
BDEBF S @("OK="_FC)
 G @ATRETDA
 
EVAL S COMP=""
 I FCA["=" S COMP="="
 I FCA["<" S COMP="<"
 I FCA[">" S COMP=">"
 I FCA["'=" S COMP="'="
 I FCA["'<" S COMP="'<"
 I FCA["'>" S COMP="'>"
 
 I COMP="" S FC=$$ZSUBST^%QZCHSUB(FC,FCA,"(0)") G @RETEV
 S P1=$P(FCA,COMP,1),P2=$P(FCA,COMP,2)
 S P1=$E(P1,2,$L(P1)),P2=$E(P2,1,$L(P2)-1)
 S FCAS=FCA
VAL1 
 
 I '($D(^TATINDB($J,P1))) S VAL1=$$ZSUBST^%QZCHSUB(P1,"""",""),IND1="" S:$$DAT(P2,BASE) VAL1=$$INTF2^%QMDAUC(BASE,P2,VAL1) G SVAL1
 S IOC=$$INDOCC(FCS,FCA,P1)
 S IND1="",FIN=0
 F %U=0:0 Q:FIN=1  S IND1=$O(^TATINDB($J,P1,IND1)) Q:IND1=""  S IO="" F %V=0:0 S IO=$O(^TATINDB($J,P1,IND1,IO)) Q:IO=""  I IO=IOC S FIN=1 Q
 
 I IND1'=0 S VAL1=$O(^[QUI]QUERY3(BASE,OBJ,IND1,P1,"")) G SVAL1
 
 S VAL1=""
BVAL1 S VAL1=$$NXTRIAV^%QSTRUC8(BASE,OBJ,P1,VAL1)
 I VAL1="" S OK2=0 G SUBST
SVAL1 
 S VAL=""""_$$ZSUBST^%QZCHSUB(VAL1,"""","""""")_""""
 
 S:('($$DAT(P1,BASE)))&('($$DAT(P2,BASE))) FCA=$$ZSUBST^%QZCHSUB(FCA,P1,VAL)
VAL2 
 
 I '($D(^TATINDB($J,P2))) S VAL2=$$ZSUBST^%QZCHSUB(P2,"""",""),IND2="" S:$$DAT(P1,BASE) VAL2=$$INTF2^%QMDAUC(BASE,P1,VAL2) G SVAL2
 S IOC=$$INDOCC(FCS,FCA,P2)
 S IND2="",FIN=0
 F %U=0:0 Q:FIN=1  S IND2=$O(^TATINDB($J,P2,IND2)) Q:IND2=""  S IO="" F %V=0:0 S IO=$O(^TATINDB($J,P2,IND2,IO)) Q:IO=""  I IO=IOC S FIN=1 Q
 
 I IND2'=0 S VAL2=$$^%QSCALIN(BASE,OBJ,P2,IND2) G SVAL2
 
 S VAL2=""
BVAL2 S VAL2=$$NXTRIAV^%QSTRUC8(BASE,OBJ,P2,VAL2)
 G:(VAL2="")&(IND1=0) BVAL1
 I VAL2="" S OK2=0 G SUBST
SVAL2 
 S VAL=""""_$$ZSUBST^%QZCHSUB(VAL2,"""","""""")_""""
 
 S:('($$DAT(P2,BASE)))&('($$DAT(P1,BASE))) FCA=$$ZSUBST^%QZCHSUB(FCA,P2,VAL)
 I $$DAT(P1,BASE)!$$DAT(P2,BASE) G VALS
 S @("OK2="_FCA) G FINV
VALS 
 S OK2=$$CDATE^%QSDAPRM(VAL1,VAL2,COMP)
FINV I OK2=1 G SUBST
 G:IND2=0 BVAL2
 G:IND1=0 BVAL1
SUBST 
 
 S FC=$$ZSUBST^%QZCHSUB(FC,FCAS,"("_OK2_")")
 G @RETEV
 
DAT(AT,BASE) 
 N ATS
 I '($D(^TATINDB($J,AT))) Q 0
 S ATS=AT_"/"_$$NOMLOG^%QSF(BASE)
 I $$TYPE^%QSGESPE(ATS)="DATE" Q 1
 Q 0
 
INDOCC(FOCA,FCA,AT) 
 
 
 N POS,POSD,POSF,I,IOC,%I,P,TPOS
 S POS=$F(FOCA,FCA,0)
 
 Q:POS=0 0
 S POSF=POS-1,POSD=POS-$L(FCA)
 
 S I=0,IOC=0
 F %I=1:1 S P=$F(FOCA,AT,I) Q:P=0  S:'($D(TPOS(P))) IOC=IOC+1,TPOS(P)=IOC S I=I+$L(AT)
 S POS=""
 F %I=1:1 S POS=$O(TPOS(POS)) Q:POS=""  I (POS'<POSD)&(POS'>POSF) S IOC=TPOS(POS) Q
 Q IOC
 
ADR() 
 Q "^[QUI]RQSGLO(""QSDA"",$J,""FOCA"")"

