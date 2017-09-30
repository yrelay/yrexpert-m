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

;%VTOZED^INT^1^59547,74036^0
TOZED ;
 
 
 
 
 
 Q:'($D(WHOIS))
 I '($D(^TOZE($I))) D STAND^%VTOZE
 S TERM=$I D CURRENT^%IS,CLEPAG^%VVIDEO
QU D POCLEPA^%VVIDEO S JOB=$J W $$^%QZCHW("Terminal ["),$I,"] : " S DX=$X D ^%VLEC,INITREM^%QZCHW Q:CTRLA!CTRLF  I Y1="" S TERM=$I G T0
 G QU:'($D(^%IS(Y1))) S TERM=Y1
T0 S USER=WHOIS D STANDS^%VTOZE
 K ^POSENR($J)
 S TBFIG($P($ZPOS,"^",2),1)="DES" D ^%VZCFIG,TAB^%VTOZE S PGE=1,LI=9
 S MNE=-1 F %U=1:1 S MNE=$N(^TBTOZE($J,MNE)) Q:MNE=-1  D T1
 S NBP=$ZP(^POSENR($J,"")),PGE=1 D AFF
QU1 D POCLEPA^%VVIDEO W $$^%QZCHW("+, -, page, CTRLE, "),$$L24^%QSLIB2 S DX=$X D ^%VLEC
 G TOZED:CTRLA,INF:CTRLE,QU1:Y1="",PL:Y1="+",PL:Y1="=",MS:Y1="-",QU1:'(Y1?.N),QU1:Y1=PGE,QU1:'($D(^POSENR($J,Y1))) S PGE=Y1 D AFF0 G QU1
INF D ^%VTOZED1 G QU1
PL S NEW=PGE+1
 G QU1:'($D(^POSENR($J,NEW)))
 S PGE=NEW
 D AFF0
 G QU1
MS S NEW=PGE-1
 G QU1:'($D(^POSENR($J,NEW)))
 S PGE=NEW
 D AFF0
 G QU1
AFF D CLEPAG^%VVIDEO S DXG=20-($L(TERM)\2),DYH=2,MSG=TERM D BIG^%VVIDEO
 S %FIG="DES" D DES^%VZCFIG
 S DY=7,DX=3 X XY W $$^%QZCHW("Mne")
 S X=17 X XY W $$^%QZCHW("Prop")
 S DX=23 X XY W $$^%QZCHW("Position")
 S DX=43 X XY W $$^%QZCHW("Commentaires")
AFF0 K ^POSFUL($J) D CUROF^%VVIDEO S DX=2 F DY=9:1:18 X XY W $J("",12)
 S DX=16 F DY=9:1:18 X XY W $J("",5)
 S DX=22 F DY=9:1:18 X XY W $J("",18)
 S DX=42 F DY=9:1:18 X XY W $J("",35)
 S DX=33,DY=20 X XY W $J("",15) X XY W $$^%QZCHW("Page "),PGE,"/",NBP
 S DY=-1 F %U=1:1 S DY=$N(^POSENR($J,PGE,DY)) Q:DY=-1  S DX=-1 F %V=1:1 S DX=$N(^POSENR($J,PGE,DY,DX)) Q:DX=-1  X XY S CC=^POSENR($J,PGE,DY,DX) W CC I DX=3 S ^POSFUL($J,DY,DX-1)=" "_CC_$J("",11-$L(CC))
 D CURON^%VVIDEO Q
T1 S ^POSENR($J,PGE,LI,3)=MNE
 S ^POSENR($J,PGE,LI,17)=$E(^TBTOZE($J,MNE,"PR"),1,3)
 S ^POSENR($J,PGE,LI,23)=@^TBTOZE($J,MNE,"TBT")@(MNE)
 S MSG=^TBTOZE($J,MNE,"COM"),LIB=""
 F %U=1:1 S CC=$P(MSG," ",%U) Q:CC=""  S LO=($L(LIB)+$L(CC))+1 D:LO>35 T2 S LIB=LIB_CC_" "
 I LIB'="" S ^POSENR($J,PGE,LI,43)=LIB
 S LI=LI+1 D NLIG Q
T2 S ^POSENR($J,PGE,LI,43)=LIB,LIB="",LI=LI+1 D NLIG Q
NLIG I LI>18 S LI=9,PGE=PGE+1
 Q
DES ;;~L~H~13~2~6/~L~H~5~16~6/~L~H~19~22~6/~L~H~36~42~6/~L~H~13~2~8/~L~H~5~16~8/~L~H~19~22~8/~L~H~36~42~8/~L~H~13~2~19/~L~H~5~16~19/~L~H~9~22~19/~L~H~18~32~19/~L~H~27~51~19/~L~H~18~32~21/~L~V~1~1~7/~L~V~10~1~9/~L~V~1~15~7/~L~V~10~15~9/~L~V~1~21~7/~L~V~10~21~9/
 ;;~L~V~1~31~20/~L~V~1~41~7/~L~V~10~41~9/~L~V~1~50~20/~L~V~1~78~7/~L~V~10~78~9/~KS~l~1~6/~KS~t~1~8/~KS~m~1~19/~KS~w~15~6/~KS~n~15~8/~KS~v~15~19/~KS~w~21~6/~KS~n~21~8/~KS~v~21~19/~KS~w~31~19/~KS~m~31~21/~KS~w~41~6/~KS~n~41~8/~KS~v~41~19/~KS~w~50~19/~KS~j~50~21/
 ;;~KS~k~78~6/~KS~u~78~8/~KS~j~78~19/
 ;;

