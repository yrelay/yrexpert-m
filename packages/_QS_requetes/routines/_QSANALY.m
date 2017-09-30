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

;%QSANALY^INT^1^59547,73880^0
RQSANALY ;
 
 
 
 
 
 
 
 
 
M(T) N SX,SY S SX=DX,SY=DY D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(T) H 3 D POCLEPA^%VVIDEO S DX=SX,DY=SY Q
INIT S PC=0,OK=1,L=$L(T) D LEC Q
LEC S PC=PC+1,C=$S(PC>L:"",1:$E(T,PC,PC)) I C'="@" D BLD^%VVIDEO X XY W C
 D NORM^%VVIDEO S DX=DX+1 G:C=" " LEC Q
LECB S PC=PC+1,C=$S(PC>L:"",1:$E(T,PC,PC)) I C'="@" D BLD^%VVIDEO X XY W C
 D NORM^%VVIDEO S DX=DX+1 Q
L4() 
 N N S N=$$EXP2 Q:'(OK) 0 I C'="@" D KILL^%ANA(N) S OK=0 Q 0
 D LEC Q N
EXP2() 
 N ED,EG,OP S EG=$$EXS Q:'(OK) 0 S OP=$$OP3 I '(OK) D KILL^%ANA(EG) Q 0
 S ED=$$VAL2 I '(OK) D KILL^%ANA(EG),KILL^%ANA(OP) Q 0
 D SET^%ANA(OP,1,EG),SET^%ANA(OP,2,ED) Q OP
OP3() 
 N N,R S R="" I "[]"'[C S OK=0 D M("Operateur [] [[ ]] ou ][ attendu") Q 0
 S R=R_C D LEC I "[]"'[C S OK=0 D M("Operateur [] [[ ]] ou ][ attendu") Q 0
 S R=R_C D LEC S N=$$NEW^%ANA D SET^%ANA(N,"TYPE","COMPARATEUR.TERNAIRE"),SET^%ANA(N,"TEXTE",R) Q N
VAL2() 
 N N,V1,V2 S V1=$$NBR^%QSANAL3 Q:'(OK) 0 I C'="," D KILL^%ANA(V1) S OK=0 D M(""","" attendue entre les deux nombres") Q 0
 D LEC S V2=$$NBR^%QSANAL3 Q:'(OK) 0 S N=$$NEW^%ANA D SET^%ANA(N,"TYPE","COUPLE"),SET^%ANA(N,1,V1),SET^%ANA(N,2,V2) Q N
L3() 
 N N S N=$$EXPP Q:'(OK) 0 I C'="@" D KILL^%ANA(N) S OK=0 Q 0
 D LEC Q N
EXPP() 
 N ED,EG,OP S EG=$$VAR^%QSANAL3 Q:'(OK) 0 S OP=$$PRE Q:'(OK) 0 S ED=$$VAR^%QSANAL3 Q:'(OK) 0 D SET^%ANA(OP,1,EG),SET^%ANA(OP,2,ED) Q OP
PRE() 
 I C'="<" S OK=0 D M("Operateur << attendu") Q 0
 D LEC I C'="<" S OK=0 D M("Operateur << attendu") Q 0
 D LEC N N S N=$$NEW^%ANA D SET^%ANA(N,"TYPE","PRECEDENCE"),SET^%ANA(N,"TEXTE","<<") Q N
L2() 
 N N S N=$$EXP Q:'(OK) 0 I C'="@" D KILL^%ANA(N) S OK=0 Q 0
 D LEC Q N
EXP() 
 N EG,OP,ED S EG=$$EXS Q:'(OK) 0 S OP=$$COM Q:'(OK) 0 S ED=$$EXS Q:'(OK) 0 D SET^%ANA(OP,1,EG),SET^%ANA(OP,2,ED) Q OP
EXS() 
 N N S N=$$OBJ Q:'(OK) 0 S N=$$SEX(N) Q:'(OK) 0 Q N
COM() 
 N R S R="" I C="'" S R=C D LEC
 I "=><[]"'[C S OK=0 D M("Operateur =  '=  >  '>  <  '<  [  '[  ]  ou '] attendu") Q 0
 N N S N=$$NEW^%ANA D SET^%ANA(N,"TYPE","COMPARATEUR.BINAIRE"),SET^%ANA(N,"TEXTE",R_C),LEC Q N
OBJ() 
 Q:((C=".")!(C?1N))!(C="""") $$CST N CH,ID,N S ID=$$ATTR^%TLANALX Q:'(OK) 0 I C'="^" S CH=0 G SO1
 D LEC S CH=$$VAR^%QSANAL3 I '(OK) D KILL^%ANA(ID) Q 0
SO1 S N=$$NEW^%ANA D SET^%ANA(N,"TYPE","OBJET"),SET^%ANA(N,1,ID),SET^%ANA(N,2,CH) Q N
CST() 
 Q:C="""" $$CHA Q $$NBR^%QSANAL3
CHA() 
 I C'="""" S OK=0 D M("Une chaine de caracteres commence par """) Q 0
 D LEC N NI S NI=$$NIM Q:'(OK) 0 I C'="""" D KILL^%ANA(NI) S OK=0 D M("Une chaine de caracteres se termine par """) Q 0
 D LEC Q NI
NIM() 
 N R,N S R="",N=$$NEW^%ANA D SET^%ANA(N,"TYPE","CHAINE")
BN1 G:C="""" FN1 S R=R_C D LECB G BN1
FN1 G:R="" ENIM S (PCH,PCHCOMP)=R D ^%LXABR N SX,SY S R=PCHCOMP,SX=DX,SY=DY D POCLEPA^%VVIDEO W PCH," ---> ",R H 1 D POCLEPA^%VVIDEO S DX=SX,DY=SY
ENIM D SET^%ANA(N,"TEXTE",R),SET^%ANA(N,"LEXIQUE",CONCUR=1) Q N
SEX(SE) 
 N O,OB
SEX1 Q:((("'=><"[C)!("[].]].[[.]["[$E(T,PC,PC+1)))!("[]"[C))!(C?1A) SE
 S O=$$OPE Q:'(OK) 0 S OB=$$OBJ Q:'(OK) 0 D SET^%ANA(O,1,SE),SET^%ANA(O,2,OB) S SE=O G SEX1
OPE() 
 I "+-*/"'[C D M("Operateur + - * ou / attendu") S OK=0 Q 0
 N N S N=$$NEW^%ANA D SET^%ANA(N,"TYPE","OPERATEUR"),SET^%ANA(N,"TEXTE",C),LEC Q N
 
CRIT() Q:$F(T,"<<",0) $$EXPP
 Q:(($F(T,"[]",0)!$F(T,"[[",0))!$F(T,"]]",0))!$F(T,"][",0) $$EXP2
 Q:($E(T,PC,PC)="'")!($E(T,PC,PC+7)="$EXISTE(") $$FONC^%QSANAL2
 Q $$EXP
 
COND() N N S N=$$CRIT Q:'(OK) 0 I C'="@" D KILL^%ANA(N) S OK=0 Q 0
 D LEC Q N

