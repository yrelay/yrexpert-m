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

;%VACTCOM^INT^1^59547,74033^0
ACTCOMM(MENU,POS,CTR) 
 I '(^TOZE($I,"NMN")) D ZD^%QMDATE4,FIX^%INCUPA(%DAT,10,5,.%OK) G FIN:'(%OK)
 G FIN:'($D(^MEN($I,MENU,POS))),FIN:POS=0 S Y=^MEN($I,MENU,POS) K ^OPT($J)
 F %U=1:1 Q:'($D(^MN(MENU,%U)))  S ^OPT($J,$P(^MN(MENU,%U),"|",1))=%U
 S LIB=$P(Y,"|",1) G:'($D(^OPT($J,LIB))) FIN D ^%VEFFSCR(2,20,76,21) S POS=^OPT($J,LIB),COM=$S(CTR="@":$S($D(^MN(MENU,POS,"COM")):^MN(MENU,POS,"COM"),1:""),1:LIB) D CHAR,^%VLECFLD(COM,"TB",.CT,.Y1) G FIN:CT="A",AR:CTR="@"
CH G FIN:Y1="" S AL=^MN(MENU,POS),ALIB=$P(AL,"|",1),ACT=$P(AL,"|",2),$P(AL,"|",1)=Y1 S:(ACT="")&$D(^MN(ALIB)) $P(AL,"|",2)=ALIB S ^MN(MENU,POS)=AL G DL
AR K ^MN(MENU,POS,"COM") G FIN:Y1="" S ^MN(MENU,POS,"COM")=Y1
DL K ^MEN($I,MENU) F %U=1:1:6 S POS="^GM"_%U_"($I,MENU)" K @(POS)
FIN Q
CHAR K TB S TB("%LGX")=3,TB("%LDX")=77,TB("PCX")=4,TB("PCY")=20 Q
 
MPG(MENU,POS,CTR) 
 I '(^TOZE($I,"NMN")) D ZD^%QMDATE4,FIX^%INCUPA(%DAT,10,5,.%OK) G FIN:'(%OK)
 G:'($D(^GLOMENU($I,MENU,POS))) FIN S POSI=POS,A=^GLOMENU($I,MENU,POS),A=$P(A,";;",2) G:A="" FIN K ^OPT($J),^COPT($J) D:'($D(^MENUMOD($J,MENU))) NEWMEN S NMN=MENU,MENU=^MENUMOD($J,MENU)
 S X1="ZL @MENU F %U=1:1 S X=$P($T(FUN+%U),"";;"",2) Q:X=""""  S ^OPT($J,$P(X,"";;"",1))=%U",X2="ZL @MENU S C=$T(FUNC),EX=(C'="""") X:EX X3 X:'EX X4 ZS @MENU"
 S X3="F %UC=1:1 S Y=$T(FUNC+%UC),X=$P(Y,"";;"",1) Q:Y=""""  Q:$E(X)'="" """
 S X4="S X=$T(FUN+%U-1) ZR FUN+%U-1 ZI X ZI ""FUNC ;;"" ZI "" ;;"" S %UC=2"
 S X5="ZL @MENU S X=$T(FUNC+%UC-1) ZR FUNC+%UC-1 ZI X F %V=%UC:1:%U ZI "" ;;"" ZS:%V=%U @MENU"
 S X6="ZL @MENU ZR FUNC+POS ZI "" ;;""_Y1 ZS @MENU"
 S X61="ZL @MENU S CM=$P($T(FUNC+POS),"";;"",2)"
 S X7="ZL @MENU S X=$T(FUN+POS),$P(X,"";;"",2)=Y1 ZR FUN+POS ZI X ZS @MENU"
 S X71="ZL @MENU S X=$P($T(FUN+POS),"";;"",2)"
 X X1,X2,X5 G:'($D(^OPT($J,A))) FIN
 S POS=^OPT($J,A) X X61,X71 D ^%VEFFSCR(2,19,76,20) S COM=$S(CTR="@":CM,1:X) D CHARD,^%VLECFLD(COM,"TB",.CT,.Y1) G FIN:CT="A",AR1:CTR="@"
 G FIN:Y1="" X X7 S ^GLOMENU($I,NMN,POSI)=X,^GLOMENU($I,NMN,"AFF",POSI)=$P(X,";;",2)_$J("",60-$L($TR($P(X,";;",2),"#","")))_"^"_POSI G DL1
AR1 X X6 S ^GLOMENU($I,NMN,"AFF",POSI,"COM")=Y1 G DL1
DL1 F %U=1:1:6 S POS="^GM"_%U_"($I,NMN)" K @(POS)
 G FIN
CHARD K TB S TB("%LGX")=5,TB("%LDX")=75,TB("PCX")=6,TB("PCY")=19 Q
NEWMEN F %U=1:1 S NMN="z"_%U Q:'($D(^ROUTINE(NMN)))
 S ^MENUMOD($J,MENU)=NMN X "ZL @MENU ZS @NMN" Q

