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

;%QWANA^INT^1^59547,73886^0
QWANA ;
 
 
 
 
 
COND(VALC,GCOMP,ORIGINE,ETA,ROUTAFF) 
 N CHAINE,COMPVU,NBPAR,ICOUR,PCR,TEMP,PTV,PARLVL,TYPANA
 N KTL,KAU,KST,KEA,KUP,KSE,KTP,KUO,KUE,KUR,CODERR
 D INITK
 S TYPANA=$S(ORIGINE="META":"META",1:"EXPLOG")
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"COND") K @(TEMP)
 S PTVAT=$$CONCAS^%QZCHAD(TEMP,"PTV"),PARLVL=0
 S (COMPVU,NBPAR,ICOUR,PCR)=0
 S VALC=$$GETLBLAN^%VTLBLAN(VALC)
 S CHAINE=VALC
 S PCR=0,@ETA=0
 F I=0:0 Q:$E(VALC)'=" "  S VALC=$E(VALC,2,$L(VALC)),PCR=PCR+1
 S PCAR=$E(VALC)
 I PCAR="&" S @ETA=1 D BLD(PCR) S VALC=$E(VALC,2,$L(VALC)),PCR=PCR+1
 S EXP=""
 S RES=$$EXPR2^%QWANA1(VALC,GCOMP,ROUTAFF)
 S:RES @GCOMP@("E")=EXP,VALC=CHAINE
 I ('(RES))&(CODERR'=0),TRACEANA D ^%VZEAVT($$AFFMES^%QWANA3(CODERR)) Q 0
 I PARLVL'=0,TRACEANA D ^%VZEAVT($$^%QZCHW("Probleme de parenthesage")) Q 0
 Q (RES&(COMPVU=1))&(PARLVL=0)
 
 
AFFEC(VALC,GCOMP,ROUTAFF) 
 N CHAINE,NBPAR,ICOUR,PCR,TYPANA,BRCHE,TEMP,PTVAT,PARLVL
 N KTL,KAU,KST,KEA,KUP,KSE,KTP,KUO,KUE,KUR,CODERR
 D INITK
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"COND") K @(TEMP)
 S PTVAT=$$CONCAS^%QZCHAD(TEMP,"PTV"),PARLVL=0
 S (NBPAR,ICOUR,PCR)=0
 S VALC=$$GETLBLAN^%VTLBLAN(VALC)
 S TYPANA="EXPSIMP",CHAINE=VALC
 F I=0:0 Q:$E(VALC)'=" "  S VALC=$E(VALC,2,$L(VALC)),PCR=PCR+1
 S PCAR=$E(VALC)
 I ($A(PCAR)<$A("A"))!($A(PCAR)>$A("Z")) Q 0
 
 
 S MOT=$$LIREATT^%QWANA3
 
 I $$LEX^%QWANA3(ROUTAFF,.MOT)=0 Q 0
 S FINAFF=PCR+$L(MOT) F PCR=PCR:1:FINAFF D BLD(PCR)
 S @GCOMP@(MOT)=""
 S BRCHE=$$CONCAS^%QZCHAD(GCOMP,MOT)
 F I=0:0 Q:$E(VALC)'=" "  S VALC=$E(VALC,2,$L(VALC)),PCR=PCR+1
 S PCAR=$E(VALC)
 I PCAR'="(" S @BRCHE@("O")=1 G AF2
 
 S EXP="",VALC=$E(VALC,2,$L(VALC))
 S RES=$$EXPR2^%QWANA1(VALC,BRCHE,ROUTAFF)
 I RES!(CODERR'=KUP) S VALC=CHAINE Q 0
 S @BRCHE@("O")=EXP
 S PCAR=$E(VALC)
AF2 Q:PCAR'="=" 0
 S PCR=PCR+1 D BLD(PCR)
 S VALC=$E(VALC,2,$L(VALC))
 S EXP=""
 S RES=$$EXPR2^%QWANA1(VALC,BRCHE,ROUTAFF)
 I ('(RES))&(CODERR'=0),TRACEANA D ^%VZEAVT($$AFFMES^%QWANA3(CODERR))
 S REFUSE=('(RES))!(PARLVL'=0)
 I RES S VALC=CHAINE
 S @BRCHE@("E")=EXP
 Q '(REFUSE)
 
 
EXPR(VAL,GCOMP,ROUTAFF) 
 N CHAINE,NBPAR,ICOUR,PCR,TYPANA,EXP,TEMP,PTVAT,PARLVL
 N KTL,KAU,KST,KEA,KUP,KSE,KTP,KUO,KUE,KUR,CODERR
 D INITK
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"COND") K @(TEMP)
 S PTVAT=$$CONCAS^%QZCHAD(TEMP,"PTV"),PARLVL=0
 S (ICOUR,PCR)=0
 S TYPANA="EXPSIMP"
 S CHAINE=VAL
 S EXP=""
 S RES=$$EXPR2^%QWANA1(VAL,GCOMP,ROUTAFF)
 S REFUSE=('(RES))!(PARLVL'=0)
 S:'(REFUSE) @GCOMP@("E")=EXP
 Q '(REFUSE)
 
 
VERBE(VAL,GCOMP) 
 I VAL="$SATURER" S @GCOMP="RETRY" Q 1
 I VAL="$SAUVER.RECUSER" S @GCOMP="SAVRETRY" Q 1
 I VAL="$ABANDONNER" S @GCOMP="STOP" Q 1
 I VAL="$SAUVER.ABANDONNER" S @GCOMP="SAVSTOP" Q 1
 I VAL="$CONTINUER" S @GCOMP="CONT" Q 1
 I VAL="$SAUVER.CONTINUER" S @GCOMP="SAVCONT" Q 1
 I VAL="$INTERAGIR" S @GCOMP="DIALO" Q 1
 I TRACEANA D ^%VZEAVT($$^%QZCHW("Action inconnue"))
 Q 0
 
INITK 
 N I,J
 S CODERR=0
 S I=1 F J="KTL","KAU","KST","KEA","KUP","KSE","KTP","KUO","KUE","KUR" S @J=I,I=I+1
 Q
 
 
 
 
INIT(X,Y,TR) S SYNTX=X,SYNTY=Y,MAXM=250,LRG=80,TRACEANA=TR Q
 
BLD(P) 
 N LI,C,PAFF
 Q:'(TRACEANA)
 S C=$E(CHAINE,P,P),PAFF=(SYNTX+P)-1
 S LI=PAFF\LRG,DX=PAFF-(LI*LRG),DY=SYNTY+LI X XY D:SUB'="C-IBM PC" BLD^%VVIDEO D:SUB="C-IBM PC" UDL^%VVIDEO X XY W C D NORM^%VVIDEO Q
 
 
TEST 
 D CLEPAG^%VVIDEO
 S DX=5,DY=10 X XY R C Q:C=""
 D INIT(5,10,1)
 S OK=$$EXPR(C,"R","")
 I OK S DX=5,DY=20 X XY W R("E") R C
 G TEST

