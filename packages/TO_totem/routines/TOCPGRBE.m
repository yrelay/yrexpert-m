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

;TOCPGRBE^INT^1^59547,74871^0
TOCPGRBE ;
 
TRAIT S ^POSENR($I,PAGE,LI)="" D T0
 S PGC=$O(TL("")),PG=""
LPG S PG=$O(TL(PG)) G:PG="" FPG S DY="" I PG'=PGC D EFF
LDY S DY=$O(TL(PG,DY)) G:DY="" LPG S DX=""
LDX S DX=$O(TL(PG,DY,DX)) G:DX="" LDY X XY W TL(PG,DY,DX) G LDX
FPG F TT="NOMG","NORM","IDENT","TYPGR" S ^POSENR($I,PAGE,LI)=^POSENR($I,PAGE,LI)_@TT_"^"
 S:'($D(TYPNORM)) TYPNORM=""
 S ^POSENR($I,PAGE,LI)=^POSENR($I,PAGE,LI)_TYPNORM
 R *XXYY:0 D TOUCHE^%INCCLAV(XXYY,.XXYY) S:(XXYY=1)!($S'>2000) STOP=1
 S PAGE=$ZP(TL("")),LI=$ZP(TL(PAGE,"")) Q
EFF H 1 S DX=0,DY=LH D CLEBAS^%VVIDEO S DX=66,DY=LB+2 X XY W $$^%QZCHW("Page : "),PAGE
 Q
T0 K LIG,TL S PG=PAGE,LC=LI,IT=$P($T(POS),";;",2) F TT=1:1 S ITC=$P(IT,"/",TT) Q:ITC=""  D T1
 Q
T1 S ITV=@$P(ITC,",",1),ITD=$P(ITC,",",2),ITF=$P(ITC,",",3),ITL=ITF-ITD,LIC=LC,ITA="" F %U=1:1 S CC=$P(ITV,".",%U) Q:CC=""  S LGC=($L(ITA)+$L(CC))+1 D:LGC>ITL T2 S ITA=ITA_$S(ITA="":"",1:".")_CC
 S:ITA'="" TL(PG,LIC,ITD)=ITA Q
T2 S:ITA'="" TL(PG,LIC,ITD)=ITA G:$L(CC)'>ITL T3 S CCC=CC F %V=0:1 S ITA=$E(CCC,(ITL*%V)+1,ITL*(%V+1)) Q:ITA=""  Q:$L(ITA)'>ITL  D T3 S TL(PG,LIC,ITD)=ITA
 D T3 S CC=ITA,ITA="" G T4
T3 I ITA'="" S LIC=LIC+1,ITA="" I LIC>LB S LIC=LH,PG=PG+1
T4 Q
POS ;;NOMG,3,35/NORM,38,58/IDENT,61,73/TYPGR,76,77
 
TEST W !,"NOMG=" R NOMG Q:NOMG=""
 W !,"NORM=" R NORM Q:NORM=""
 W !,"IDENT=" R IDENT Q:IDENT=""
 W !,"TYPGR=" R TYPGR Q:TYPGR=""
 S PAGE=1,LH=5,LB=20,LI=6 D CLEPAG^%VVIDEO,^TOCPGRBE
 R *X G TEST

