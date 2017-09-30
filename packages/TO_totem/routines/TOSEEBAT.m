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

;TOSEEBAT^INT^1^59547,74875^0
TOSEEBAT ;
 
 S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG="LOTS BATCH" D CLEPAG^%VVIDEO,TO4^%VZCD
QUES W *-1 S DX=0,DY=5 D CLEBAS^%VVIDEO S DY=10 X XY W "Numero du lot-batch : " S DX=$X D ^%VLEC G:CTRLA!(CTRLF!(Y1="")) FIN G:Y1["?" LIS G:$D(^[QUI]RESBATCH(Y1)) BAT
INC W " ???" D POCLEPA^%VVIDEO W "[RETURN] " R *RET:10 G QUES
BAT S (PAG,OPAG)=-1,NUB=Y1,TB="^[QUI]RESBATCH(NUB)" F %U=1:1 S PAG=$N(@TB@(PAG)) Q:PAG=-1  S OPAG=PAG
 S PGE=1,DX=0,DY=6 D CLEBAS^%VVIDEO S RS=@TB,JD=$P(RS,"|",1),HD=$P(RS,"|",2),JF=$P(RS,"|",3),HF=$P(RS,"|",4),DX=0,DY=6 D BLD^%VVIDEO X XY W NUB D NORM^%VVIDEO W ?20,"Commence le ",JD," a ",HD,"     termine le ",JF," a ",HF D AFF
QU D POCLEPA^%VVIDEO W "Page ",PGE,"/",OPAG,"         ",$$L17^%QSLIB1("(S)uppression ")
 S DX=$X D ^%VLEC G:CTRLA!CTRLF FIN G PL:Y1="+",PL:Y1="=",MS:Y1="-",SUP:Y1="S"
 S PCH=Y1 D TO^%QZNBN1 G QU:'(ISNUM) G:'($D(@TB@(Y1))) QU S PGE=Y1 D AFF G QU
PL S NPAG=PGE+1 G:'($D(@TB@(NPAG))) QU S PGE=NPAG D AFF G QU
MS S NPAG=PGE-1 G:'($D(@TB@(NPAG))) QU S PGE=NPAG D AFF G QU
SUP S B="GO" D ^%INCUPA G:B["??" QU K @(TB) G QUES
AFF S SEP="|",DX=0,DY=8,LI=-1 F %U=1:1 S LI=$N(@TB@(PGE,LI)) Q:LI=-1  S DX=0,DY=LI,RS=@TB@(PGE,LI) X XY S IDT=$P(RS,"|",1),DEF=$P(RS,"|",2),HH=$P(RS,"|",3),CO=$P(RS,"|",4) D AFF1
 Q
AFF1 S POS=$P($T(POS),";;",2) F %U1=1:1 S PP=$P(POS,"/",%U1) Q:PP=""  S IT=$P(PP,",",1),ITX=$P(PP,",",2) W ?ITX,@(IT)
 Q
LIS S VU=0,NUF=$P(Y1,"?",1) S:NUF="" NUF="BAT" G:$E(NUF,1,3)'="BAT" INC S NUB=$E(NUF,1,$L(NUF)-1)_$C($A($E(NUF,$L(NUF)))-1)_"z",DX=0,DY=6,STOP=0 D CLEBAS^%VVIDEO
 F %U=1:1 S NUB=$N(^[QUI]RESBATCH(NUB)) Q:NUB=-1  Q:$E(NUB,1,$L(NUF))'=NUF  W ?((%U-1)#4)*20,NUB W:(%U#4)=0 ! S VU=1 D:$Y>21 SUIT Q:STOP=1
 G:VU=0 QUES D POCLEPA^%VVIDEO W "Fin      [RETURN] " R *RET G QUES
SUIT D POCLEPA^%VVIDEO W $$L2^%QSLIB R *STOP D TOUCHE^%INCCLAV(STOP,.STOP) S DX=0,VU=0,DY=6 D CLEBAS^%VVIDEO Q
POS ;;SEP,0/IDT,2/SEP,18/DEF,20/SEP,60/HH,62/SEP,72/CO,74/SEP,79
FIN Q

