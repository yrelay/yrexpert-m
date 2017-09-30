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

;TOREAUS8^INT^1^59547,74874^0
TOREAUS8 ;
 
 S %FL=0,C="",OODY=$Y
LEC S C="" D ^%VZECUR S (OODY,PY)=$Y G:(X1=1)!(X1=6) FIN G:X1=7 GOMME S:C="" PX=$X,PY=OODY G:X1=127 LEC G:(C="")&('($D(^POSENR($I,PAGE,PY)))) LEC W:X1'=13 $C(X1)
 S PAR=$P(^POSENR($I,PAGE,PY),"^",1),ADTR="MFLD",YG=^VALPAR($I,USI,PAR) I X1=13 G:YG'="" FIN G FIN1
 I X1'=9 S YG=$C(X1)_$E(^VALPAR($I,USI,PAR),2,599),ADTR="BEG"
 S:'($D(ATT)) ATT=10000 S Y1="",ADTR=ADTR_"^%VLEC",DX=$S(ADTR["MFLD":$X-1,1:$X) X XY S PCX=$S(ADTR["MFLD":$X,1:$X-1),PCY=$Y D:'($D(SUB)) CURRENT^%IS O 0 D @ADTR I (CTRLA=1)!(CTRLF=1) S C="" G FIN
 S C=Y1 I Y1="?" D EXPLIC^TOTESREA,REAFF S DX=43,DY=OODY,OODY=OODY-2 X XY G END
FIN1 D FIN1^TOTESREA G:VOK FIN2 G EFF
FIN S PY=OODY G:'($D(^POSENR($I,PAGE,PY))) END S PAR=$P(^POSENR($I,PAGE,PY),"^",1) I X1'=13 G END
FIN2 S EXPRESS=C,EXF="",PCH=C D TO^%QZNBN1 I ISNUM S EXF=C,^VALPAR($I,USI,PAR)=EXPRESS,^PARVAL($I,USI,PAR)=EXF G END
 I C="" S ^VALPAR($I,USI,PAR)=EXPRESS,^PARVAL($I,USI,PAR)=EXF G END
 D ^TOGETEXP I REFUSE=1 S OODY=OODY-2,ADEF=$S(EFFACE=0:"EFF",1:"REAFF") D ^%VSQUEAK,@ADEF G END
 S ^VALPAR($I,USI,PAR)=EXPRESS,^PARVAL($I,USI,PAR)=EXF D CLEPAG^%VVIDEO,REAFF G END
EFF S DX=42,DY=OODY X XY W "                            " X XY S OODY=OODY-2,^VALPAR($I,USI,PAR)="" G END
GOMME Q:'($D(^POSENR($I,PAGE,$Y)))  S ADY=$Y,PY=OODY,PY=ADY,PAR=$P(^POSENR($I,PAGE,PY),"^",1),^VALPAR($I,USI,PAR)="" G EFF
ECR S DY=DDY,DX=0,PAR=$P(^POSENR($I,PAGE,DY),"^",1) X XY W $E(PAR,1,37),?40," = ",^VALPAR($I,USI,PAR) Q
END S PY=OODY K DE,FI,CHP,ADY,PARA,VPA,VPD,C,Y1,YG Q
REAFF S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=USI_" No : "_NNBB D TO4^%VZCD
 S DDY=-1 F %DDD=1:1 S DDY=$N(^POSENR($I,PAGE,DDY)) Q:DDY=-1  D ECR
 D L7^%QSLIB S TYMOD="Saisie" D ^TO3TYMOD S (PY,DY)=DEBP-1,DX=43 X XY S PAG="Page "_PAGE,DX=40-($L(PAG)\2),DY=6 X XY W "Page ",PAGE

