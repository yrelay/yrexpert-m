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
;! Nomprog     : %VLIRE                                                       !
;! Module      : VIDE0                                                        !
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

%VLIRE ;
 
 
 
 
 S DF=""
LEC2 N CTR,%TAB
 
 F PR="J","R","F","A","E","P","L","Z","B","H" S @("CTRL"_PR)=""
 S Y1=DF
 S:'($D(RM)) RM=80 D GET^%VLECFL2(Y1,DX,DY,-1,RM,.CTR,.Y1)
 Q:CTR=""
 F PR="J","R","F","A","E","P","L","Z","B","H" I CTR=PR S @("CTRL"_PR)=1 G QUIT
 S CTRLA=1,Y1=""
QUIT Q
 
ADR2(DF) 
 G LEC2
 
 
 
 
 
 
 
 S YG="" X XY S PCX=$X,PCY=$Y
BEG I '($D(SUB)) D CURRENT^%IS,VARSYS^%QCSAP
 N ATT S ATT=^TOZE($I,"ATTENTE")
DEB S Y1="",CTRLJ="",CTRLR="",CTRLF="",CTRLA="",CTRLE="",CTRLP="",CTRLL="",CTRLZ="",CTRLB="",CTRLH=""
 
LEC S X5=$$MORE^%VZATOU(.X1,.X2,.X3,.X4,^TOZE($I,"ATTENTE"),0)
 G:'(X5) CTRLA
 G FIN:X2="RETURN"
 G GOMME:X3="G",DEL:X2="DEL",MFLD:X3="I"
 G FIN:X2="RETURN",CTRLH:X3="H",CTRLB:X3="B",CTRLZ:X3="Z",CTRLR:X3="R",CTRLA:X3="A",CTRLE:X3="E",CTRLF:X3="F",CTRLP:X3="P",CTRLJ:X3="J",CTRLL:X3="L",REFUS:X3'=""
 G:X1="" REFUS
 S LPG=((($Y-PCY)*80)+$X)-PCX,YG=$E(YG,1,LPG)_$C(X1)_$E(YG,LPG+2,599)
 W $C(X1)
 G LEC
DEL I (($X-1)<PCX)&(PCY=$Y) D ^%VSQUEAK G LEC
 S ADX=$X-1,ADY=$Y,DX=((PCX+$L(YG))#80)-1,DY=((PCX+$L(YG))\80)+PCY S:DX<0 DX=79,DY=DY-1 X XY W " " S LPG=(((ADY-PCY)*80)+ADX)-PCX,PD=$E(YG,LPG+2,599),PG=$E(YG,1,LPG),YG=PG_PD,DX=PCX,DY=PCY X XY W YG S DX=ADX,DY=ADY S:ADX<0 DX=79,DY=DY-1 X XY G LEC
REFUS D ^%VSQUEAK G LEC
CTRLA I X1<2 S YG="",CTRLA=1 G END
CTRLF S CTRLF=1
FIN I $$^%QZCHMX(YG)=1 S DX=PCX,DY=PCY X XY G DEB
 
 S Y1=YG
END U 0 K YG,PCX,XG2,XG3,LPG,PCY Q
CTRLH S Y1="",CTRLH=1 G END
CTRLJ S Y1="",CTRLJ=1 G END
CTRLL S Y1="",CTRLL=1 G END
CTRLZ S Y1="",CTRLZ=1 G END
CTRLP S Y1="",CTRLP=1 G END
CTRLE S Y1="",CTRLE=1 G END
CTRLB S Y1="",CTRLB=1 G END
CTRLR S Y1="",CTRLR=1 G END
 
MFLD S ADX=DX,DFLD=DX,FLD=YG
 D ^%VMOD I ABENDFLD=0 G MS
 S DX=ADX X XY F UU=1:1:LFLD W " "
 X XY W YG X XY G LEC
MS S YG=FLD,ADX=$X,ADY=$Y,DX=PCX,DY=PCY X XY W YG S DX=ADX,DY=ADY X XY G LEC
GOMME S ADX=$X,ADY=$Y,LPG=(((ADY-PCY)*80)+ADX)-PCX,LYG=$L(YG)+1,YG=$E(YG,1,LPG) F EE=LPG:1:LYG W " "
 S DX=ADX,DY=ADY X XY G LEC
 
ADR(%VAL,%CTRL) 
 N K,L,ATT,BS,X1,Y1,CTRLA,CTRLF,CTRLH,CTRLJ,CTRLL,CTRLZ,CTRLP,CTRLE,CTRLB,CTRLR,YG,XG2,XG3,PCX,PCY,PD,PG,UU,%XLEC,ADX,ADY,DFLD,FLD,LPG,LYG
 D ^%VLEC S %VAL="" S:$D(Y1) %VAL=Y1
 F K="H","J","L","Z","P","E","B","R" S L="CTRL"_K S:$D(@L)&(@L=1) %CTRL(@L)=1
 Q
 
 
TEST D CLEPAG^%VVIDEO S DX=5,DY=10 X XY W "ESSAI : " S DX=$X D ^%VLEC Q
TEST1 D CLEPAG^%VVIDEO S DX=5,DY=10 X XY W "ESSAI : " S DX=$X D ADR^%VLEC(.VAL,.CTRL) Q

