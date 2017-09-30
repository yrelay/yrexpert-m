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

;%QARBCON^INT^1^59547,73874^0
ARBCONS(ARB,EVAL,SEPAR,SELEC,ORI) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N %E,ELEM,NOEUD,RES,ROU,TAB,VAL
 N MESURER S MESURER=1
 S TAB=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB") K @(TAB)
 
 S @ARB@("ORI")=ORI
 K @ARB@("OPTIMUM")
 S VAL=""
 D:MESURER DEB^%SGMESU("QARB: evaluation")
 I EVAL'="" S ROU="$$"_EVAL_"("""_ARB_""","""_ORI_""","""_ORI_""","_$$S1^%QZCHAD(TAB)_")",@("VAL="_ROU)
 D:MESURER FIN^%SGMESU("QARB: evaluation")
 D CRNO(ARB,ORI,ORI,VAL)
 S NOEUD=ORI
 
SEP 
 I $D(@ARB@("OPTIMUM")) K @(TAB) Q
 D:MESURER DEB^%SGMESU("QARB: separation")
 S ROU="$$"_SEPAR_"("""_ARB_""","""_NOEUD_""","_$$S1^%QZCHAD(TAB)_")"
 S @("RES="_ROU)
 D:MESURER FIN^%SGMESU("QARB: separation")
 
 K @ARB@("EXT",NOEUD)
 
 I $D(@ARB@("OPTIMUM")) K @(TAB) Q
 S ELEM=""
BCLE S VAL="",ELEM=$O(@TAB@("STO","ELEM",ELEM)) G:ELEM="" BCLEF
 D:MESURER DEB^%SGMESU("QARB: evaluation")
 S:EVAL'="" ROU="$$"_EVAL_"("""_ARB_""","""_ELEM_""","""_NOEUD_""","_$$S1^%QZCHAD(TAB)_")",@("VAL="_ROU) D CRNO(ARB,NOEUD,ELEM,VAL)
 D:MESURER FIN^%SGMESU("QARB: evaluation")
 G BCLE
BCLEF 
 K @TAB@("STO","ELEM")
 D GLOCOP^%QCAGLC($$CONCAS^%QZCHAD(TAB,"STO"),ARB)
 G:'($D(^TXPMODE($J,"arbo"))) SSS G:^TXPMODE($J,"arbo")'=1 SSS
 S GLOUC=$$INIGLOUC^%TXPVISU
 I '($D(firstaff)) S firstaff=1
 S STRAFFI=$$INIT^%QULELV($$CONCAS^%QZCHAD(ARB,"ARB"),$$CONCAS^%QZCHAD(ARB,"ARB"),12,3,GLOUC,"test",0,0)
 I firstaff D AFF^%QULELV(STRAFFI) S firstaff=0
SSS 
 K @TAB@("STO")
 
 I $D(@ARB@("OPTIMUM")) K @(TAB) Q
 D:MESURER DEB^%SGMESU("QARB: selection")
 S ROU="$$"_SELEC_"("""_ARB_""")",@("RES="_ROU)
 D:MESURER FIN^%SGMESU("QARB: selection")
 
 I RES="" K @(TAB) U 0 W !,"echec" Q
 S NOEUD=RES,A=ARB
 G:'($D(^TXPMODE($J,"arbo"))) SEP G:^TXPMODE($J,"arbo")'=1 SEP
 D ELEM^%QULELV(STRAFFI,NOEUD,$$PERE(ARB,NOEUD))
 
 G SEP
 
CRNO(ARB,PERE,FILS,VAL) 
 
 I PERE'=FILS S @ARB@("ARB",PERE,FILS)="",@ARB@("INV",FILS)=PERE
 I PERE=FILS S @ARB@("INV",FILS)=""
 S @ARB@("VAL",FILS)=VAL
 I VAL'="" S @ARB@("LIS",VAL,FILS)=""
 S @ARB@("EXT",FILS)=""
 Q
 
 
 
VAL(A,N) 
 I '($D(@A@("VAL",N))) Q ""
 Q @A@("VAL",N)
PERE(A,N) 
 I '($D(@A@("INV",N))) Q ""
 Q @A@("INV",N)
EXT(A,N) 
 Q $D(@A@("EXT",N))
 
 
TEST D ARBCONS("^TST","EVAL^%QARBCON","SEPAR^%QARBCON","SELEC^%QARBCON",1)
 Q
 
EVAL(A,S,P,T) N V
 W !,"Valeur de ",S," fils de ",P," : " R V
 Q V
SEPAR(A,S,T) N F1,F2
 W !,"separation en deux fils"
 S F1=S_".1",F2=S_".2"
 S @T@("STO","ELEM",F1)="",@T@("STO","ELEM",F2)=""
 S @T@("STO","FRERE",F1)=F2,@T@("STO","FRERE",F2)=F1
 Q 1
SELEC(A) N S
sel 
 W !,"Nom du noeud a eclater : " R S
 I '($D(@A@("EXT",S))) W !," ",S," n est pas une extremite",!,!,! R *x G sel
 Q S

