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

;%VREAD^INT^1^59547,74036^0
VVREAD ;;09:58 AM  25 May 1989 ; 03 Nov 92 11:50 AM
 
 
 
 
GET(MSG,NBC,YG,%LGX,%LDX,%YB,%YH,%TAB,TBP,UCONT,CTR,YY1)
 
 N TB,PD,PG,PG0,PD0,PCX,PCY,TYPE,TYPEB,X,Y,X1,DX,DY,PAGE,VISU,ATTENTE,F,ESC
 S ATTENTE=^TOZE($I,"ATTENTE")
 S PAGE=1,VISU=0,NBC=NBC+1 D:VISU=6 MSG(PAGE)
BEG 
 S PCX=(%LGX+1)+($L(MSG)#((%LDX-%LGX)-1))
 S PCY=(%YH+1)+($L(MSG)\((%LDX-%LGX)-1))
 
 I TBP="" S TBP="TB"
 S:($D(@TBP@("DX"))#10)=0 @TBP@("DX")=0
 S:($D(@TBP@("DY"))#10)=0 @TBP@("DY")=23
 S:($D(@TBP@("MSGI"))#10)=0 @TBP@("MSGI")="M"
 S:($D(@TBP@("MSG"))#10)=0 @TBP@("MSG")=""
 D ^%VREADW(MSG_YG,%LGX+1,%YH+1,%LGX,%LDX,%YB,0) S CTR="",DX=(PCX+NBC)-1,DY=PCY X XY U 0
 
 D MFLD1^%VREAD1
 S YY1=YG
 I ^TOZE($I,"NUMLOCK")=0 D APPKP^%VVIDEO
 E  D NUMKP^%VVIDEO
 G LEC^%VREAD1
 
 
 
 
LIRE(MSG,YG,%LGX,%LDX,%YB,%YH,CTR,YY1) 
 D GET(MSG,$L(YG),YG,%LGX,%LDX,%YB,%YH,0,"","UC^%VREAD",.CTR,.YY1)
 Q
 
 
LIRE1(MSG,YG,%LGX,%YH,CTR,YY1) 
 D GET(MSG,$L(YG),YG,%LGX,RM-1,%YH+1,%YH-1,0,"","UC^%VREAD",.CTR,.YY1)
 Q
 
 
 
AFF(MSG,YG,%LGX,%LDX,%YB,%YH) 
 D ^%VREADW(MSG_YG,%LGX+1,%YH+1,%LGX,%LDX,%YB,0)
 W $$XY^%VVIDEO1((%LGX+1)+$L(MSG),%YH+1)
 Q
 
 
 
POSCUR(MSG,YG,%LGX,%LDX,%YB,%YH) 
 W $$XY^%VVIDEO1((%LGX+1)+$L(MSG),%YH+1)
 Q
 
 
UC(BOUT,TYPE,MODE,NL,PAGE,%YB,%YH) 
 I (TYPE="P1")&(PAGE'=1) S TYPE="P2"
 Q
 
 
 
LIRE2(MSG,YG,%LGX,%LDX,%YB,%YH,REAFF,UCONT1,CTR,YY1) 

 ;MSG    : Message / Question
 ;YG     : Valeur prédéfinie
 ;%LGX   : Limite gauche en X
 ;%LDX   : limite droite en X
 ;%YB    : Position $Y
 ;%YH    : position $X
 ;REAFF  : 
 ;UCONT1 :
 ;CTR    : Ctrl en retour
 ;YY1    : Réponse en retour
 
 N I,FIN,REAF,UCONT2
 S UCONT2="FIN="_$$CONCAT^%QZCHAD(UCONT1,".YY1,.REAF")
 S FIN=1
 
 
 S I=0
LLLR Q:$$CMS  S I=1 G LLLR
 Q
CMS() S REAF=0
 D GET(MSG,0,YG,%LGX,%LDX,%YB,%YH,I,"","UC^%VREAD",.CTR,.YY1)
 I CTR="A" S YY1=$$^%QCAZG("YY1") Q 1
 I UCONT1'="" S @(UCONT2) D:REAF&(REAFF'="") @REAFF
 S YG=YY1
 Q FIN
 
MSG(MSG) 
 N DX,DY
 D POCLEPA^%VVIDEO W MSG
 Q


TEST(MODE) 
TEST1 D CLEPAG^%VVIDEO
 S UCONT=""
 S:MODE UCONT="UCONT1^%VREADU"
 S LXG1=30,LXD1=40,MSG="test : ",PLAN=15,PLAF=5
 S PCX1=LXG1+$L(MSG),PCY1=10,INSERT=0,PCY2=$S(MODE=0:PLAN,1:PCY1=3)
 D CARSA^%VVIDEO(LXG1,PCY1,(LXD1-LXG1)+1,(PCY2-PCY1)-1)
 F DY=PCY1,PCY2,PLAN,PLAF F DX=LXG1,LXD1 X XY W "*"
 D GET^%VREAD(MSG,0,"ABCDEFGH",LXG1,LXD1,PCY2,PCY1,INSERT,"",UCONT,.%CTR,.RES)
 D POCLEPA^%VVIDEO W "%CTR=",%CTR,?30,"RES=""",RES,"""" R *X D TOUCH^%INCCLAV(X,.X) Q:X=1
 G TEST1
TEST0 D TEST(0) Q
 D TEST(1) Q
TEST2 D LIRE1("TUTU : ","TATA",10,9,.CTR,.YY1)
 Q
 

