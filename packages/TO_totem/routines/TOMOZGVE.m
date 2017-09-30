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

;TOMOZGVE^INT^1^59547,74873^0
TOMOZGVE ;
 D CLEPAG^%VVIDEO S DXG=1,DYH=0,DXD=38,DYB=4,MSG=$$^%QZCHW("Etudes ")_PCH_"*",GRAPH=1 D TO4^%VZCD
 S CH="" F %U=1:1:40 S CH=CH_" "
 S %FIG="CADRE" D DES^%VZCFIG S DY=9,%U=$P($T(COM),";;",2) F %V=1:1 S FIC=$P(%U,"/",%V) Q:FIC=""  S DX=$P(FIC,",",2),NF=$P(FIC,",",1) X XY W NF
 S PG=1 D AFF
LEC D POCLEPA^%VVIDEO W $$L17^%QSLIB1("") S DX=$X D ^%VLEC G FIN:CTRLA,LEC:$A(Y1)<32,PL:Y1="+",PL:Y1="=",MS:Y1="-",LEC:'($D(^TACOMPIL($J,Y1))),LEC:Y1=PG S PG=Y1 D AFF G LEC
PL S NPG=PG+1 G:'($D(^TACOMPIL($J,NPG))) LEC S PG=NPG D AFF G LEC
MS S NPG=PG-1 G:'($D(^TACOMPIL($J,NPG))) LEC S PG=NPG D AFF G LEC
AFF D CUROF^%VVIDEO S DX=33,DY=7 X XY W "             " S MSG=$$^%QZCHW("Page ")_PG_"/"_NBP,DX=40-($L(MSG)\2) X XY W MSG S (OLI,LI)=-1 F %U=1:1 S LI=$N(^TACOMPIL($J,PG,LI)) Q:LI=-1  D T1 S OLI=LI
 G FAFF:OLI=21 K T F %U=1:1:3 S T(%U)=""
 S OLI=OLI+1 F LI=OLI:1:21 D T2
FAFF D CURON^%VVIDEO Q
FIN K TBFIG,CH,PG,NBP,FIC,%U,%V,NF,%FIG,Y1,CTRLA,CTRLF,CTRLE,CTRLZ,CTRLG,CTRLH,CTRLB,LIG,LI,NPG Q
T1 S LIG=^TACOMPIL($J,PG,LI) K T F %V=1:1:5 S T(%V)=$P(LIG,"^",%V)
 S T(2)=T(5)
T2 S DY=LI,DX=4 X XY W T(1),$E(CH,1,35-$X) S DX=38 X XY W T(2),$E(CH,1,63-$X) S DX=66 X XY W T(3),$E(CH,1,76-$X) Q
T0 S CH="" F %W=0:1:2 S CH=CH_$P(FIC,"^",%W+%V)_"^"
 S ^TACOMPIL($J,PG,LI)=CH,LI=LI+1 I LI>21 S LI=11,PG=PG+1
 Q
COM ;;Etudes,12/Articles,46/Dates,67
CADRE ;;~L~H~14~33~6/~L~H~29~3~8/~L~H~14~33~8/~L~H~29~48~8/~L~H~74~3~10/~L~H~74~3~22/~L~V~13~2~9/~L~V~1~32~7/~L~V~1~36~9/~L~V~11~36~11/~L~V~1~47~7/~L~V~1~64~9/~L~V~11~64~11/~L~V~13~77~9/~KS~l~2~8/~KS~t~2~10/~KS~m~2~22/~KS~l~32~6/~KS~v~32~8/~KS~w~36~8/
 ;;~KS~n~36~10/~KS~v~36~22/~KS~k~47~6/~KS~v~47~8/~KS~w~64~8/~KS~n~64~10/~KS~v~64~22/~KS~k~77~8/~KS~u~77~10/~KS~j~77~22/
 ;;

