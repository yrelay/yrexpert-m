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

;%QSANAL3^INT^1^59547,73880^0
RQSANAL3 ;
 
 
 
 
 
INIT S PC=0,OK=1,L=$L(T) D LEC Q
LEC S PC=PC+1,C=$S(PC>L:"",1:$E(T,PC,PC)) I C'="@" D BLD^%VVIDEO X XY W C
 D NORM^%VVIDEO S DX=DX+1 G:C=" " LEC Q
LECB S PC=PC+1,C=$S(PC>L:"",1:$E(T,PC,PC)) I C'="@" D BLD^%VVIDEO X XY W C
 D NORM^%VVIDEO S DX=DX+1 Q
L1() 
 N VI S VI=$$VI Q:'(OK) 0 I C'="@" D KILL^%ANA(VI) S OK=0 Q 0
 D LEC Q VI
VI() 
 N CH,LIV,LIE,N S LIV=$$LIV Q:'(OK) 0 I C'=":" D KILL^%ANA(LIV) S OK=0 Q 0
 D LEC S LIE=$$LIE I '(OK) D KILL^%ANA(LIV) Q 0
 S CH=$$CHE(LIE) I '(OK) D KILL^%ANA(LIV) Q 0
 S N=$$NEW^%ANA D SET^%ANA(N,"TYPE","VARIABLES.INTERMEDIAIRES"),SET^%ANA(N,1,LIV),SET^%ANA(N,2,CH) Q N
LIV() 
 N VA,SV S VA=$$VAR Q:'(OK) 0 S SV=$$SVA(VA) Q:'(OK) 0 Q SV
VAR() 
 N N S N=$$IDF Q:'(OK) 0 D SET^%ANA(N,"TYPE","VARIABLE") Q N
SVA(VA) 
 N N,V
SV1 Q:C=":" VA I C'="," D KILL^%ANA(VA) S OK=0 D M($$^%QZCHW(""","" attendue")) Q 0
 D LEC S V=$$VAR I '(OK) D KILL^%ANA(VA) Q 0
 S N=$$NEW^%ANA D SET^%ANA(N,"TYPE","LISTE.VARIABLES"),SET^%ANA(N,1,VA),SET^%ANA(N,2,V) S VA=N G SV1
CHE(CH) 
 N LI,N
CH1 Q:"@+-*/=<>[]'"[C CH I C'="^" D KILL^%ANA(CH) S OK=0 D M($$^%QZCHW("^ attendu")) Q 0
 D LEC S LI=$$LIE I '(OK) D KILL^%ANA(CH) Q 0
 S N=$$NEW^%ANA D SET^%ANA(N,"TYPE","CHEMIN"),SET^%ANA(N,1,LI),SET^%ANA(N,2,CH) S CH=N G CH1
LIE() 
 N ID,IN,N S ID=$$ATTR^%TLANALX Q:'(OK) 0 S IN=$$IND I '(OK) D KILL^%ANA(ID) Q 0
 S N=$$NEW^%ANA D SET^%ANA(N,"TYPE","LIEN"),SET^%ANA(N,1,ID),SET^%ANA(N,2,IN) Q N
IND() 
 Q:"^+-*/=><[]'@"[C 0 I C'="(" S OK=0 D M($$^%QZCHW("( attendue")) Q 0
 N VA D LEC S VA=$$VAL Q:'(OK) 0 I C'=")" D KILL^%ANA(VA) S OK=0 D M(") attendue") Q 0
 D LEC Q VA
VAL() 
 Q:"0123456789."[C $$NBR Q:""""[C $$VALI S OK=0 Q 0
VALI() 
 I C'="""" S OK=0 D M($$^%QZCHW(""" attendue")) Q 0
 D LEC N N S N=$$NIM^%QSANALY Q:'(OK) 0 I C'="""" D KILL^%ANA(N) S OK=0 D M($$^%QZCHW(""" attendue")) Q 0
 D LEC Q N
IDF() 
 I C'?1A S OK=0 D M($$^%QZCHW("Une lettre S.V.P.")) Q 0
 N N,R S R=C D LEC
B1 G:(C'?1A)&(C'?1N) FB1 S R=R_C D LEC G B1
FB1 S N=$$NEW^%ANA D SET^%ANA(N,"TYPE","IDF"),SET^%ANA(N,"TEXTE",R) Q N
LEX() 
 Q:C="$" $$FONC^%QSANAL4 I C'?1A S OK=0 D M($$^%QZCHW("Une lettre S.V.P")) Q 0
 N BID,LEX,I,N,R,SDX,SDY S R=C D LEC
B2 G:(C'?1A)&(C'?1N) FB2 S R=R_C D LEC G B2
FB2 I C="." S R=R_C D LEC G B2
 S SDX=DX,SDY=DY,(PCH,PCHCOMP)=R D ^%LXABR I CONCUR=1 S LEX=1 G SB2
 G @("FB2"_(CONCUR'=0))
FB20 D POCLEPA^%VVIDEO,^%VSQUEAK W R,$$^%QZCHW(" est inconnu au lexique") H 1
FB20S D POCLEPA^%VVIDEO I $$MES^%VZEOUI($$^%QZCHW("Est-ce une constante ? : "),"O")=1 G FB279
FB278 S LEX=1 G SB2
FB279 S LEX=0 G SB2
FB21 D POCLEPA^%VVIDEO,^%VSQUEAK W R," est ambigu au lexique" H 1 D POCLEPA^%VVIDEO S OK=0 Q 0
SB2 S R=PCHCOMP D POCLEPA^%VVIDEO W PCH," ---> ",$S(LEX:"",1:""""),R,$S(LEX:"",1:"""") H 1 D POCLEPA^%VVIDEO S DX=SDX,DY=SDY
 S N=$$NEW^%ANA D SET^%ANA(N,"TYPE",$S(LEX:"IDF",1:"CHAINE")),SET^%ANA(N,"LEXIQUE",LEX),SET^%ANA(N,"TEXTE",R) Q N
NBR() 
 N N1,N2 G:C'="." SE D LEC S N1=$$ENT Q:'(OK) 0 D SET^%ANA(N1,"TEXTE","."_$$RED^%ANA(N1,"TEXTE")) Q N1
SE S N1=$$ENT Q:'(OK) 0 Q:C'="." N1
 D LEC S N2=$$ENT I '(OK) D KILL^%ANA(N1) Q 0
 D SET^%ANA(N1,"TEXTE",$$RED^%ANA(N1,"TEXTE")_"."_$$RED^%ANA(N2,"TEXTE"))
 D KILL^%ANA(N2) Q N1
ENT() I C'?1N S OK=0 D M($$^%QZCHW("un nombre S.V.P.")) Q 0
 N N,R S R=C D LEC
I1 G:C'?1N FI1 S R=R_C D LEC G I1
FI1 S N=$$NEW^%ANA D SET^%ANA(N,"TYPE","NOMBRE"),SET^%ANA(N,"TEXTE",R) Q N
M(T) N SX,SY S SX=DX,SY=DY D POCLEPA^%VVIDEO,^%VSQUEAK W T H 3 D POCLEPA^%VVIDEO S DX=SX,DY=SY Q

