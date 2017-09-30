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
;! HL002 ! HL     ! 26/07/12 ! Ouvrir $I                                      !
;! HL003 ! HL     ! 26/07/12 ! PB caratères parasites sur terminal-gnome      !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QULIMO2^INT^1^59547,73885^0
QULIMO2 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
MOD 
 N %LDX,%LGX,%U,ABENDFLD,CTRLA,LD,LFLD,PC,WG,RET
;HL002 MOD2 D POS S CTRLA=0,PCX=DX,PCY=DY,PAGE=1 O 0
MOD2 D POS S CTRLA=0,PCX=DX,PCY=DY,PAGE=1 O $I
 S UCONT=$$CONCAT^%QZCHAD("^%QULIMOC",P1C_","""_$$ZSUBST^%QZCHSUB(LI,"""","""""")_""","_XG_","_YH_","_DH_","_DV_","_(DY-1)_",""GLO"","_PAG)
 D GET^%VREAD("",0,YG,PCX-1,(PCX+DH)-3,$$MIN(DY+$$NL^%VREADG(YG,0,PCX-2,(PCX+DH)-4),(YH+DV)-1),DY-1,1,"TAB",UCONT,.CTR,.Y1)
 I ((CTR="A")!(CTR="F"))!(Y1="") S OK=0 Q
 D LLP,POS,SAUV,@COA,CHARG I OK S OK=1,@LI@(P1C)=Y1,@LI@(P1C,"NL")=$$LIGN^%QULIMO6($$SUB^%QULIMO6(Y1,PARAM),DH-3,"") Q
 S YG=Y1 G:PAGE=1 MOD2
 D REAFF^%QULIMO3($$R^%QULIMO3(GLO1,PAG,1),$$L^%QULIMO3(GLO1,PAG,1),LI,XG,YH,DH,((PCY-1)-YH)+2)
 G MOD2
 
EFF Q
POS S DX=XG+2,DY=YC Q
 
IMPR(L) 
 D POCLEPA^%VVIDEO S DX=XG,DY=23 X XY W $$^%QZCHW("Impression en cours")
 D ^%VPRINT(LI)
 D COL^%VZEAVT($$^%QZCHW("Impression terminee "),XG,XG+DH) Q
 
RECOP(S,D) 
 N I,%I
 S @LI@(D)=@LI@(S) S:CP'="" @CP@("COMP",D)=@CP@("COMP",S)
 S I="" F %I=0:0 S I=$O(@LI@(S,I)) Q:I=""  S @LI@(D,I)=@LI@(S,I)
 Q
 
COPIE(ST1,I1,ST2,I2,CP1,CP2) 
 N I,%I
 S @ST2@(I2)=@ST1@(I1) S:(CP1'="")&(CP2'="") @CP2@("COMP",I2)=@CP1@("COMP",I1)
 S I="" F %I=0:0 S I=$O(@ST1@(I1,I)) Q:I=""  S @ST2@(I2,I)=@ST1@(I1,I)
 Q
;HL003 LLP S DX=XG+2,DY=(YH+DV)-1 X XY W " (+),(-)",$S(MODP:",(.)Page,CTRLJ",1:"")," " Q
LLP S DX=XG+2,DY=(YH+DV)-1 X XY W " (+),(-)",$S(MODP:",(.)Page,CTRLJ",1:"")," "  X XY Q
SAUV S SP1C=P1C,SP1=P1,SXG=XG,SXY=XY,SLI=LI,SSX=$X,SSY=$Y Q
CHARG S P1C=SP1C,P1=SP1,XG=SXG,XY=SXY,LI=SLI,$X=SSX,$Y=SSY Q
SAUV2 S SYC=YC,SP2C=P1C,SP2=P1,SXG2=XG,SXY2=XY,SLI2=LI,SSX=$X,SSY=$Y Q
CHARG2 S YC=SYC,P1C=SP2C,P1=SP2,XG=SXG2,XY=SXY2,LI=SLI2,$X=SSX,$Y=SSY Q
MIN(A,B) Q:A<B A Q B
 
 
 
 
 
DEL(A) 
 K @LI@(P1C,A) Q
VAL(A) 
 Q:'($D(@LI@(P1C,A))) "" N %V S %V=@LI@(P1C,A) Q %V
AFF(A,V) 
 S @LI@(P1C,A)=V Q
AFF2(A,V) 
 S @$$CONCAS^%QZCHAD(LI,P1C_","_A)=V Q

