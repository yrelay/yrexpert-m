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
;! Nomprog     : MOZINSF                                                      !
;! Module      : MOZART                                                       !
;! But         : Introduction du savoir faire.                                !
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
;! HL002 ! HL     ! 11/09/09 ! Deviceparameter unknown.                       !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%MZINSF^INT^1^59547,73872^0
MOZINSF ;
 
CIP F %1=0:0 S X=EMP D ^%MZIN W:X=EMP "Quit" Q:(X=EMP)!^MOZED($J)  W ! X X
 K %1 Q
TIME S %1=T\60,%1=$S((%1\60)<10:0,1:EMP)_(%1\60)_":"_$S((%1#60)<10:0,1:EMP)_(%1#60)_":"_$S((T#60)<10:0,1:EMP)_(T#60) Q
T S T=$P($H,",",2) D TIME S DX=66,DY=22 X XY W " ",$$^%QZCHW("heure")," ",$E(%1,1,5)," " K %1,T Q
INIT K %STK S:'($D(%ED)#2) %ED=2 X ^MOZ("C",+(%ED),6) S (EMP,%BF,%HLP,^MOZED($J),%Q,%B0,%STK,%SCRN,%SEP,X)="",AP="""",U="^" S:($ZE=EMP)!($E($ZE)="<") $ZT="ER^%MZINSF" F %=1:1:RM S %SEP=%SEP_" "
 Q
SET S SET=1,%1=^MOZ("C",+(%ED),3) F %2=1:1:6 S %BF(%2)=$P(%1,U,%2)
 K ^MOZED($J) F %1=0:0 S %1=$O(^MOZ("C",+(%ED),1,%1)) Q:%1'=(+(%1))  S ^MOZED($J,$S($P(^(%1,0),U,3)'=EMP:$P(^(0),U,3),1:%1))=$S($D(^(1)):^(1),1:EMP)
 S:$D(^MOZED($J,128)) ^MOZED($J,0)=^MOZED($J,128) S ^MOZED($J,128)="D E:$L(X)>500 I $L(X)'>500 S X=$E(X,1,EDP-1)_$C(IN)_$E(X,EDP+EDOV,999),EDP=EDP+1,%=2,EDCLP=EDCL",^MOZED($J)=EMP K %1,%2
UTIL X:$D(^MOZ("C",+(%ED),4)) ^(4) Q
Q X:$D(^MOZ("C",+(%ED),7))#2 ^(7) S $ZT="" U 0
 K SET,%,AP,EMP,U,%BF,^MOZED($J),%HLP,%Q,%B0,%STK,%SCRN,%ED,INX,INY,IN,INP,INL Q
ER
 ;HL002 U 0:(RM:"") W !,$ZE Q
 U 0 W !,$ZE Q
C S DX=50,DY=$Y-1 S:DY>22 DY=22 X XY W "Un instant...  " S DX=62 F T=0:0 S T=($P($H,",",2)\10)*10 D TIME W %1 R *T:10 Q:$T
 K T,%1 Q
H G HH:'(%BF(1)) F %1=0:0 S %1=$O(^MOZ("C",+(%ED),SET,%1)) Q:%1'=(+(%1))  S %2=^(%1,0) W !,?2,$P(%2,U,1),?10,$P(%2,U,2)
 W ! K %1,%2 Q
SELECT S %SAVE="%Q;X;%B0" D PUSH^%MZSTK S %Q="SELECT editor? ",X=%ED,%BF=EMP D ^%MZIN I $D(^MOZ("C",+(X)))&('(^MOZED($J))) S %ED=(+(X))_U_$P(^MOZ("C",+(X),0),U,1) D SET
 D POP^%MZSTK S %BF=EMP Q
STO S %1=$S,%2=1024*$ZS W !,!,"PARTITION MEMORY USAGE" X "ZR  S %3=%2-$S" W !,"IN-program",?25,$J((%2-%1)-%3,5),!,"Variables (+stack)",?25,$J(%3,5),!,"Free",?25,$J(%1,5),!,"SUM",?25,$J(%2,5)," bytes",!,! K %1,%2,%3 Q
HH S %2=0,IN=32,EDRP=0
 F %0=0:1 S (DX,DY)=0 X XY D RD^%MZIN:%0 S %3=$O(^MOZ("C",+(%ED),SET,%2)) Q:((((IN'=32)&%0)!(%2'=(+(%2))))!(%3=128))!('(%3))  F %1=0:1:19 S:%2=(+(%2)) %2=$O(^MOZ("C",+(%ED),SET,%2)) S %3=$S((%2=(+(%2)))&(%2'=128):^(%2,0),1:EMP) W ?2,$P(%3,U,1),?10,$P(%3,U,2) X XL W !
 K %0,%1,%2,%3 Q
